<?php

namespace AppBundle\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Sommaire controller.
 *
 * @Route("sommaire")
 */
class SommaireController extends Controller
{
    /**
     * Lists all player entities.
     *
     * @Route("/", name="sommaire_index")
     * @Method("GET")
     */
    public function indexAction()
    {

        return $this->render('admin/sommaire.html.twig');
    }


}
