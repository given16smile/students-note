<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class StudentsController extends AbstractController
{    
    private array $students;
    public function __construct()
    {
        // Initialiser l'attribut avec des données
        $this->students = [
            ['id' => 1, 'name' => 'Alice', 'age' => 20],
            ['id' => 2, 'name' => 'Bob', 'age' => 22],
            ['id' => 3, 'name' => 'Charlie', 'age' => 19],
        ];
    }
    #[Route("/students", name:"students_list",   methods:["GET"])]
    public function getAll():Response 
    {
        $jsonContent = json_encode($this->students);
        $response = new Response(
            $jsonContent, // Contenu JSON
            Response::HTTP_OK, // Code HTTP : 200 OK
            ['Content-Type' => 'application/json'] // En-têtes HTTP
        );
        return $response;    
    }

    #[Route("/students/{id}", "students_id", methods:["GET"])]
    function getbyId(int $id) : Response {

        $student = array_filter( $this->students, fn($student) => $student["id"] === $id);

        $statusCode = $student ? Response::HTTP_OK : Response::HTTP_INTERNAL_SERVER_ERROR;
        $message = $student ? json_encode($student) : json_encode(["error" => "students not found"]);
        $response = new Response(
            $message,
            $statusCode,
            ['Content-Type' => 'application/json']
        );
        return $response;
        
    }
}