
<!--
relacionada a países + jogadores + esporte

consulta - oq ela consulta hue
1 - busca relativa por jogadores
2 - relacionada a países: busca por países e retorna os jogadores
que jogam por esse país e esporte
3 - busca relativa por jgoadores e esportes

-->
<!DOCTYPE html>



<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="estilo.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
        <title>WebSports | Bem-vindo</title>	
        <script src="http://code.jquery.com/jquery-latest.js"></script>
    </head>
    <body>
        <div class = "blanket"></div>
        <div id = "fundo">
            <div id = "logo">
                <p id="logotexto">WebSports©</p>
                <div id="menu">
                    <nav id="opcoes">
                        <a href="#" id="bconsulta0">Home</a>
                        <a href="#" id="bconsulta1">Buscar por Jogadores</a>
                        <a href="#" id="bconsulta2">Buscar por País</a>
                        <a href="#" id="bconsulta3">Buscar por Jogadores e Esporte</a>
                    </nav>
                </div>
            </div>

            <div class="formulario">
                <div id="btn_x">
                    <a onclick="fecharBtn();">X</a>
                </div>
                <form id="fConsulta1" class="fconsulta" action="ConsultaJogadores" method="post">
                    <span>Nome do Jogador: <input type="text" id="nomeJogador" name="nomeJogador"></span>
                    <p><button type="submit" onclick="consulta1();">Consultar</button></p>
                </form>
                <form id="fConsulta2" class="fconsulta">
                    <span>
                        País: <select name="pais">
                            <option value="brasil">Brasil</option>
                        </select>
                    </span>
                    <p><button type="button" onclick="consulta1();">Buscar</button></p>
                </form>
                <form id="fConsulta3" class="fconsulta">
                    <span>Nome do Jogador: <input type="text" name="nomejogador"></span>
                    <br><span>Esporte: <input type="text" name"esporte"></span>
                    <p><button type="button" onclick="consulta1();">Consultar</button></p>
                </form>
            </div>
            <div id = "main">
                <br>
                <div>
                    <p id="texto">Lorem ipsum dolor sit amet, conseleifend, cutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dicutrum, nisl vel placerat eleifend, nulla metus dictum metus, in hendrerit augue tellus vitae nisi. Quisque ac dignissim est. Vestibulum fringilla semper tincidunt. Quisque pellentesque nisl erat, quis interdum velit fermentum egestas. Curabitur iaculis nisl ac neque pellentesque eleifend. Vestibulum eu lorem quis risus vestibulum tincidunt quis vitae justo. Quisque imperdiet vulputate cursus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam nec euismod risus, et blandit ipsum. Fusce porta massa a sagittis pellentesque. Morbi dictum tincidunt pretium. In hac habitasse platea dictumst. Donec varius porttitor augue ut dapibus. Praesent mollis odio vel vehicula porttitor.In ac orci et quam volutpat pharetra quis in ipsum. In hac habitasse platea dictumst. Nulla ut odio laoreet, tincidunt leo et, auctor nunc. Praesent molestie a nulla ut molestie. Sed lacinia, nibh id rutrum elementum, dolor velit aliquet lacus, nec fermentum turpis nunc ut lacus. Aenean facilisis iaculis dolor ut ultricies. Morbi lobortis arcu nisi, et consectetur tortor cursus vitae.Sed facilisis libero et nisl auctor, tempus </p>
                </div>
                <div id="consulta1">
                    <div class="resultado">
                          
                    </div>
                </div>
                <div id="consulta2">
                    <div class="resultado">
                        <p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p></div>	
                </div>
                <div id="consulta3">	
                    <div class="resultado">
                        <p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p><p>teste</p></div>	
                </div>
            </div>

            <div id = "foot">
                <p>WebSports - Seu melhor conteúdo de esportes é aqui.</p>
            </div>
            <div id = "foot2">
                <p>Trabalho de Web - UFSCar Sorocaba - melhor visualizado com Firefox e em resolução 1920x1080</p>
            </div>	
        </div>

        <script>
            $(document).ready(function() {
                $(".blanket").hide();
                $("#texto").show();
                $("#consulta1").hide();
                $("#consulta2").hide();
                $("#consulta3").hide();
                $(".formulario").hide();

                $("#bconsulta0").click(function() {
                    $("#texto").show();
                    $("#consulta1").hide();
                    $("#consulta2").hide();
                    $("#consulta3").hide();
                    $(".formulario").hide();
                });
                $("#bconsulta1").click(function() {
                    $("#consulta1").show();
                    $(".blanket").show();
                    $(".formulario").show();
                    $("#fConsulta1").show();
                    $("#fConsulta2").hide();
                    $("#fConsulta3").hide();
                    $("#consulta2").hide();
                    $("#consulta3").hide();
                    $("#texto").hide();
                });

                $("#bconsulta2").click(function() {
                    $("#consulta2").show();
                    $(".blanket").show();
                    $(".formulario").show();
                    $("#fConsulta1").hide();
                    $("#fConsulta2").show();
                    $("#fConsulta3").hide();
                    $("#consulta1").hide();
                    $("#consulta3").hide();
                    $("#texto").hide();
                });

                $("#bconsulta3").click(function() {
                    $("#consulta3").show();
                    $(".blanket").show();
                    $(".formulario").show();
                    $("#fConsulta1").hide();
                    $("#fConsulta2").hide();
                    $("#fConsulta3").show();
                    $("#consulta1").hide();
                    $("#consulta2").hide();
                    $("#texto").hide();
                });
            });
            function consulta1() {
                $(".formulario").hide();
                $(".blanket").hide();
            }

            function fecharBtn() {
                $(".blanket").hide();
                $(".formulario").hide();
            }
        </script>


    </body>



</html>