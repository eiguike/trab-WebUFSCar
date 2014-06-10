
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
                        <a href="#" id="bconsulta4">Buscar Times por País</a>
                        <a href="#" id="bconsulta1">Buscar Jogadores</a>
                        <a href="#" id="bconsulta2">Buscar por País</a>
                        <a href="#" id="bconsulta3">Buscar Times por Esporte</a>
                    </nav>
                </div>
            </div>

            <div class="formulario">
                <div id="btn_x">
                    <a onclick="fecharBtn();">X</a>
                </div>
                <form id="fConsulta1" class="fconsulta" action="ConsultaJogadores" method="get">
                    <span>Nome do Jogador: <input type="text" class="formulario_input" id="nomeJogador" name="nomeJogador"></span>
                    <p><button type="submit">Consultar</button></p>
                </form>
                <form id="fConsulta2" class="fconsulta">
                    <span>
                        País: <div class="paislista"></div>
                    </span>
                    <p><button type="button" onclick="consulta1();">Buscar</button></p>
                </form>
                <form id="fConsulta3" class="fconsulta" action="ConsultaEsporte" method="get">                    
                    <span>Esporte: <input type="text" name="esporte" id="esporte"></span>
                    <p><button type="submit">Consultar</button></p>
                </form>
                <form id="fConsulta4" class="fconsulta" action="ConsultaTime" method="get">
                    <span>Pais: <div class="paislista"></div></span>
                    <p><button type="submit">Consultar</button></p>
                </form>                
            </div>
            <div id = "main">
                <br>
                <div>
                    <p id="texto">
                    Websports é o seu maior portal de esportes na internet! Tenha sempre em mãos notícias quentíssimas do que esta acontecendo aonde você mora e no mundo!
                    </p>
                </div>
                <div>
                    <div id="resultado1" class="resultado">

                    </div>
                </div>            
            </div>

            <div id = "foot">
                <p>WebSports - Seu melhor conteúdo de esportes é aqui.</p>
            </div>
            <div id = "foot2">
                <p>Trabalho de Web - UFSCar Sorocaba - melhor visualizado com Firefox e em resolução 1920x1080</p>
            </div>	
        </div>
        
        <div id="paraesconder">
        <form id="fConsulta5" action="ConsultaPaisLista" method="get"></form>
        </div>
        <script>
            $(document).ready(function() {
                $(".blanket").hide();
                $("#texto").show();
                $(".formulario").hide();
                $(".resultado").hide();

                $("#bconsulta0").click(function() {
                    $("#texto").show();
                    $(".resultado").hide();
                    $(".formulario").hide();
                });
                $("#bconsulta1").click(function() {
                    $(".blanket").show();
                    $(".formulario").show();
                    $(".fconsulta").hide();                 
                    $(".resultado").show();
                    $("#fConsulta1").show();   
                    $("#nomeJogador").focus();  
                    $("#nomeJogador").val('');
                    $(".resultado").show();
                    $("#texto").hide();
                });

                $("#bconsulta2").click(function() {
                    $("#consulta2").show();
                    $(".blanket").show();
                    $(".formulario").show();
                    $("#fConsulta1").hide();
                    $("#fConsulta2").show();
                    $("#fConsulta3").hide();
                    $(".resultado").show();
                    $("#texto").hide();
                });

                $("#bconsulta3").click(function() {
                    $(".blanket").show();
                    $(".formulario").show();
                    $(".fconsulta").hide();
                    $("#fConsulta3").show();
                    $(".resultado").show();
                    $("#texto").hide();
                    $("#esporte").focus();
                    $("#esporte").val('');
                });
                $("#bconsulta4").click(function() {
                    $(".blanket").show();
                    $(".formulario").show();
                    $(".fconsulta").hide();                 
                    $(".resultado").show();
                    $("#fConsulta4").show();   
                    $("#texto").hide();
                    $("#nomeDoTime").focus();  
                    $("#nomeDoTime").val('');      
                    
                    $.ajax({// create an AJAX call...
                        data: $('#fConsulta5').serialize(), // get the form data
                        type: $('#fConsulta5').attr('method'), // GET or POST
                        url: $('#fConsulta5').attr('action'), // the file to call
                        success: function(response) { // on success..
                            $('.paislista').html(response); // update the DIV
                        }
                    });                 
                });                

                $.fn.capitalize = function() {

                    //iterate through each of the elements passed in, `$.each()` is faster than `.each()
                    $.each(this, function() {

                        //split the value of this input by the spaces
                        var split = this.value.split(' ');

                        //iterate through each of the "words" and capitalize them
                        for (var i = 0, len = split.length; i < len; i++) {
                            split[i] = split[i].charAt(0).toUpperCase() + split[i].slice(1);
                        }

                        //re-join the string and set the value of the element
                        this.value = split.join(' ');
                    });
                    return this;
                };
                $('#nomeJogador').on('keyup', function() {
                    $(this).capitalize();
                }).capitalize();
                $('#nomeDoTime').on('keyup', function() {
                    $(this).capitalize();
                }).capitalize();
                $('#esporte').on('keyup', function() {
                    $(this).capitalize();
                }).capitalize();                
            });

            function fecharBtn() {
                $(".blanket").hide();
                $(".formulario").hide();
            }


            $('#fConsulta1').submit(function() { // catch the form's submit event
                if($('#nomeJogador').val() === ''){
                    alert("Você precisa digitar algum nome!");
                    return false;
                }
                $.ajax({// create an AJAX call...
                    data: $(this).serialize(), // get the form data
                    type: $(this).attr('method'), // GET or POST
                    url: $(this).attr('action'), // the file to call
                    success: function(response) { // on success..
                        $('.resultado').html(response); // update the DIV
                        $('html,body').scrollTop(400);
                        fecharBtn();
                    }
                });
                return false;
            });
            $('#fConsulta3').submit(function() { // catch the form's submit event
                if($('#esporte').val() === ''){
                    alert("Você precisa digitar algum esporte!");
                    return false;
                }
                $.ajax({// create an AJAX call...
                    data: $(this).serialize(), // get the form data
                    type: $(this).attr('method'), // GET or POST
                    url: $(this).attr('action'), // the file to call
                    success: function(response) { // on success..
                        $('.resultado').html(response); // update the DIV
                        $('html,body').scrollTop(400);
                        fecharBtn();
                    }
                });
                return false;
            });
            
            $('#fConsulta4').submit(function() { // catch the form's submit event
                if($('#nomeDoTime').val() === ''){
                    alert("Você precisa digitar algum pais!");
                    return false;
                }
                $.ajax({// create an AJAX call...
                    data: $(this).serialize(), // get the form data
                    type: $(this).attr('method'), // GET or POST
                    url: $(this).attr('action'), // the file to call
                    success: function(response) { // on success..
                        $('.resultado').html(response); // update the DIV
                        $('html,body').scrollTop(400);
                        fecharBtn();
                    }
                });
                return false;
            });            
            
            function OpenPage(url){
                    $.get(url, function(response){
                            $('html,body').scrollTop(400);
                            $('.resultado').html(response);

                    });
            }
            
            function funcao(nome,pagatual,pagnumeros,pagina){
                pagatual = prompt("Há num total de "+pagnumeros+" páginas, qual página pular?");
                if(parseInt(pagatual) > parseInt(pagnumeros)){
                    return false;
                }
                OpenPage(pagina + nome + '&pagina=' + pagatual);
                return true;                    

            }


        </script>
    </body>
</html>
