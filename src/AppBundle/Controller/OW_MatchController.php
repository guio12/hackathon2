<?php

namespace AppBundle\Controller;

use AppBundle\Entity\OW_Match;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Ow_match controller.
 *
 * @Route("ow_match")
 */
class OW_MatchController extends Controller
{
    /**
     * Lists all oW_Match entities.
     *
     * @Route("/", name="ow_match_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $oW_Matches = $em->getRepository('AppBundle:OW_Match')->findAll();

        return $this->render('ow_match/index.html.twig', array(
            'oW_Matches' => $oW_Matches,
        ));
    }

    /**
     * Creates a new oW_Match entity.
     *
     * @Route("/new", name="ow_match_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $oW_Match = new Ow_match();
        $form = $this->createForm('AppBundle\Form\OW_MatchType', $oW_Match);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($oW_Match);
            $em->flush();

            return $this->redirectToRoute('ow_match_show', array('id' => $oW_Match->getId()));
        }

        return $this->render('ow_match/new.html.twig', array(
            'oW_Match' => $oW_Match,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a oW_Match entity.
     *
     * @Route("/{id}", name="ow_match_show")
     * @Method("GET")
     */
    public function showAction(OW_Match $oW_Match)
    {
        $deleteForm = $this->createDeleteForm($oW_Match);

        return $this->render('ow_match/show.html.twig', array(
            'oW_Match' => $oW_Match,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing oW_Match entity.
     *
     * @Route("/{id}/edit", name="ow_match_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, OW_Match $oW_Match)
    {
        $deleteForm = $this->createDeleteForm($oW_Match);
        $editForm = $this->createForm('AppBundle\Form\OW_MatchType', $oW_Match);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('ow_match_edit', array('id' => $oW_Match->getId()));
        }

        return $this->render('ow_match/edit.html.twig', array(
            'oW_Match' => $oW_Match,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a oW_Match entity.
     *
     * @Route("/{id}", name="ow_match_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, OW_Match $oW_Match)
    {
        $form = $this->createDeleteForm($oW_Match);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($oW_Match);
            $em->flush();
        }

        return $this->redirectToRoute('ow_match_index');
    }

    /**
     * Creates a form to delete a oW_Match entity.
     *
     * @param OW_Match $oW_Match The oW_Match entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(OW_Match $oW_Match)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('ow_match_delete', array('id' => $oW_Match->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
