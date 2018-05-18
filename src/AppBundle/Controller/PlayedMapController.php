<?php

namespace AppBundle\Controller;

use AppBundle\Entity\OW_Match;
use AppBundle\Entity\PlayedMap;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Playedmap controller.
 *
 * @Route("playedmap")
 */
class PlayedMapController extends Controller
{
    /**
     * Lists all playedMap entities.
     *
     * @Route("/", name="playedmap_index")
     * @Method({"GET", "POST"})
     */
    public function indexAction()
    {

        $em = $this->getDoctrine()->getManager();

        //selection du match
        $select="";
        $matchs = $em->getRepository('AppBundle:OW_Match')->findAll();

        if (isset($_POST['match'])){
            $select=$_POST['match'];
        }



        $playedMaps = $em->getRepository('AppBundle:PlayedMap')->findBy(['owMatch'=>$select]);

        return $this->render('playedmap/index.html.twig', array( 'matchs'=>$matchs,
            'playedMaps' => $playedMaps, 'select'=>$select
        ));
    }

    /**
     * Creates a new playedMap entity.
     *
     * @Route("/new", name="playedmap_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $playedMap = new Playedmap();
        $form = $this->createForm('AppBundle\Form\PlayedMapType', $playedMap);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($playedMap);

            $match = $em->getRepository('AppBundle:OW_Match')->findOneBy(['id'=>$playedMap->getOwMatch()]);
            if ($playedMap->getScore1()>$playedMap->getScore2()){
                $match->setScore1($match->getScore1() + 1);
                $em->persist($match);

            }
            else {
                $match->setScore2($match->getScore2() + 1);
                $em->persist($match);
            }

            $nextRound = $match->getRound()+1;
            $nextMatchNum = intval(ceil($match->getMatchNum()/2));
            $nextMatch = $em->getRepository('AppBundle:OW_Match')->findOneBy(['round'=>$nextRound,'matchNum'=>$nextMatchNum]);

            if ($match->getScore1()==3){
                if($match->getMatchNum()%2==1){
                    $nextMatch->setTeam1($match->getTeam1());
                }
                else {
                    $nextMatch->setTeam2($match->getTeam1());
                }
                $em->persist($nextMatch);
            }
            elseif ($match->getScore2()==3){

                if($match->getMatchNum()%2==1){
                    $nextMatch->setTeam1($match->getTeam2());
                }
                else {
                    $nextMatch->setTeam2($match->getTeam2());
                }
                $em->persist($nextMatch);
            }

            $em->flush();
            return $this->redirectToRoute('playedmap_index', array('id' => $playedMap->getowMatch()));
        }

        return $this->render('playedmap/new.html.twig', array(
            'playedMap' => $playedMap,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a playedMap entity.
     *
     * @Route("/{id}", name="playedmap_show")
     * @Method("GET")
     */
    public function showAction(PlayedMap $playedMap)
    {
        $deleteForm = $this->createDeleteForm($playedMap);

        return $this->render('playedmap/show.html.twig', array(
            'playedMap' => $playedMap,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing playedMap entity.
     *
     * @Route("/{id}/edit", name="playedmap_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, PlayedMap $playedMap)
    {

        $oldPlayedMap = clone $playedMap;

        $deleteForm = $this->createDeleteForm($playedMap);
        $editForm = $this->createForm('AppBundle\Form\PlayedMapType', $playedMap);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {

            $em = $this->getDoctrine()->getManager();
            $em->persist($playedMap);

            $match = $em->getRepository('AppBundle:OW_Match')->findOneBy(['id'=>$playedMap->getOwMatch()]);



            if (($oldPlayedMap->getScore1()>$oldPlayedMap->getScore2()) && ($playedMap->getScore1()<$playedMap->getScore2())){
                $match->setScore1($match->getScore1()-1);
                $match->setScore2($match->getScore2()+1);
                $em->persist($match);
            }
            elseif (($oldPlayedMap->getScore1()<$oldPlayedMap->getScore2()) && ($playedMap->getScore1()>$playedMap->getScore2())){
                $match->setScore1($match->getScore1()+1);
                $match->setScore2($match->getScore2()-1);
                $em->persist($match);
            }


            $nextRound = $match->getRound()+1;
            $nextMatchNum = intval(ceil($match->getMatchNum()/2));
            $nextMatch = $em->getRepository('AppBundle:OW_Match')->findOneBy(['round'=>$nextRound,'matchNum'=>$nextMatchNum]);

            if ($match->getScore1()==3){
                if($match->getMatchNum()%2==1){
                    $nextMatch->setTeam1($match->getTeam1());
                }
                else {
                    $nextMatch->setTeam2($match->getTeam1());
                }
                $em->persist($nextMatch);
            }
            elseif ($match->getScore2()==3){

                if($match->getMatchNum()%2==1){
                    $nextMatch->setTeam1($match->getTeam2());
                }
                else {
                    $nextMatch->setTeam2($match->getTeam2());
                }
                $em->persist($nextMatch);
            }
            else {
                if($match->getMatchNum()%2==1){
                    $nextMatch->setTeam1(null);
                }
                else {
                    $nextMatch->setTeam2(null);
                }
                $em->persist($nextMatch);
            }

            $em->flush();
            return $this->redirectToRoute('playedmap_edit', array('id' => $playedMap->getId()));
        }

        return $this->render('playedmap/edit.html.twig', array(
            'playedMap' => $playedMap,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a playedMap entity.
     *
     * @Route("/{id}", name="playedmap_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, PlayedMap $playedMap)
    {
        $form = $this->createDeleteForm($playedMap);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($playedMap);
            $em->flush();
        }

        return $this->redirectToRoute('playedmap_index');
    }

    /**
     * Creates a form to delete a playedMap entity.
     *
     * @param PlayedMap $playedMap The playedMap entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(PlayedMap $playedMap)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('playedmap_delete', array('id' => $playedMap->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
