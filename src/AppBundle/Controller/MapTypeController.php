<?php

namespace AppBundle\Controller;

use AppBundle\Entity\MapType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Maptype controller.
 *
 * @Route("maptype")
 */
class MapTypeController extends Controller
{
    /**
     * Lists all mapType entities.
     *
     * @Route("/", name="maptype_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $mapTypes = $em->getRepository('AppBundle:MapType')->findAll();

        return $this->render('maptype/index.html.twig', array(
            'mapTypes' => $mapTypes,
        ));
    }

    /**
     * Creates a new mapType entity.
     *
     * @Route("/new", name="maptype_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $mapType = new Maptype();
        $form = $this->createForm('AppBundle\Form\MapTypeType', $mapType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($mapType);
            $em->flush();

            return $this->redirectToRoute('maptype_show', array('id' => $mapType->getId()));
        }

        return $this->render('maptype/new.html.twig', array(
            'mapType' => $mapType,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a mapType entity.
     *
     * @Route("/{id}", name="maptype_show")
     * @Method("GET")
     */
    public function showAction(MapType $mapType)
    {
        $deleteForm = $this->createDeleteForm($mapType);

        return $this->render('maptype/show.html.twig', array(
            'mapType' => $mapType,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing mapType entity.
     *
     * @Route("/{id}/edit", name="maptype_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, MapType $mapType)
    {
        $deleteForm = $this->createDeleteForm($mapType);
        $editForm = $this->createForm('AppBundle\Form\MapTypeType', $mapType);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('maptype_edit', array('id' => $mapType->getId()));
        }

        return $this->render('maptype/edit.html.twig', array(
            'mapType' => $mapType,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a mapType entity.
     *
     * @Route("/{id}", name="maptype_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, MapType $mapType)
    {
        $form = $this->createDeleteForm($mapType);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($mapType);
            $em->flush();
        }

        return $this->redirectToRoute('maptype_index');
    }

    /**
     * Creates a form to delete a mapType entity.
     *
     * @param MapType $mapType The mapType entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(MapType $mapType)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('maptype_delete', array('id' => $mapType->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
