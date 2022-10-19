<?php
/**
 * Nome do servidor do banco de dados
 */
$servername = "localhost";
/**
 * Usuario de acesso ao banco de dados
 */
$username = "root";
/**
 * Senha de acesso do usuario para o banco de dados
 */
$password = "";
/**
 * Nome da base de dados
 */
$bdname = "base";

/**
 * Objeto de conexão com o banco de dados
 */
$conn = mysqli_connect($servername, $username, $password, $bdname);
if (mysqli_connect_error()) {
    die("Database Connection Error");
}
/**
 * Faz a a consulta para obter o resultado atual da votação e monta o HTML da pagina com esse resultado
 * 
 * @return string contendo o HTML da pagina do resultado atual da votação
 */
function createPage()
{
  
    $result = mysqli_query($GLOBALS["conn"], 'SELECT c.NomeCandidato, c.NomeVice, c.NumeroCandidatura, COUNT(v.IdVoto) AS votos  from votos v
    INNER JOIN candidaturas c ON IdCandidaturaVotada = IdCandidatura
    GROUP BY c.NomeCandidato, c.NomeVice, c.NumeroCandidatura');
  
  if($result)
  {
    $page = '
    <!DOCTYPE html>
    <html>
        
        <head>
            <title>Resultados</title>
        </head>
        
        <body>
        <div class="container">
        <table class="responsive-table">
        <thead>
          <tr>
              <th >Grêmio</th>
              <th >Presidente</th>
              <th >Numero Candidatura</th>
              <th >Quantidade de Votos</th>
          </tr>
          </thead>';
          

    while ($row = mysqli_fetch_array($result)) {
        $page .= '  <tbody>
        <tr >
        <td >' . $row[0] . '</td>
        <td >' . $row[1] . '</td>
        <td >' . $row[2] . '</td>
        <td >' . $row[3] . '</td>
    </tr>
    </tbody>';
    }

    $page .= '</table>
    </div >

    </body>
    
    </html>';

      return $page;
  } else {
    return <<<HTML
      <!DOCTYPE html>
      <html>
          
          <head>
              <title>Resultados</title>
          </head>
          
          <body>
                <h1>
                  Nenhum voto efetuado
                </h1>
          </body>
          
      </html> 
  HTML;
  }
}

/**
 * manda para o front a página criada na função createPage()
 */
function main() {
    echo createPage();
}

main();
?>

  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>