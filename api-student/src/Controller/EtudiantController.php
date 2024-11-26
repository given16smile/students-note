<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Etudiant;
use Doctrine\ORM\EntityManagerInterface;

class EtudiantController extends AbstractController
{
    #[Route("/etudiants", name:"liste_etudiant",   methods:["GET"])]
    public function getAll(EntityManagerInterface $entityManager):Response
    {
        $etudiants = $entityManager->getRepository(Etudiant::class)->findAll();
        $data = [];
        foreach ($etudiants as $etudiant) {
            $data[] = [
                'ETU' => $etudiant->getEtu(),
                'nom' => $etudiant->getNom(),
                'prenom' => $etudiant->getPrenom(),
                'naissance' => $etudiant->getNaissance()?->format('Y-m-d'),
            ];
        }
        $jsonContent = json_encode($data);
        $response = new Response(
            $jsonContent, // Contenu JSON
            Response::HTTP_OK, // Code HTTP : 200 OK
            ['Content-Type' => 'application/json'] // En-têtes HTTP
        );
        return $response;    
    }

}