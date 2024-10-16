# Follow-Cursor-OBS

Esta é uma solução para lives verticais pelo OBS, o script vai arrastar a fonte gameplay para esquerda e direita de acordo com a posição atual do mouse, possibilitando quem está assistindo poder acompanhar todos os detalhes.

### Instalação:

- No arquivo follow-cursor.lua, localize a linha 80.
- Atualize os parâmetros da função get_scene_and_source para refletir o nome da Cena e da Fonte que você está usando no OBS.
<br/>**Exemplo: get_scene_and_source("nome_da_cena", "nome_da_fonte")**

- Dentro do OBS acesse o menu Ferramentas/Scripts
- Importe o arquivo "follow-cursor.lua" para os scripts
- A partir da importação o script já vai começar a rodar, o obs não possuí nenhuma ferramenta para fazer um script parar de rodar, para parar é necessário remover o script do obs

### Observações:

- Evite logs (print) pois o OBS trava com o tempo pois não sabe lidar com logs, use logs apenas para debug, na versão final remova os prints para evitar lentidão ou travamentos.

### Motivação:

- A maioria do público de lives é mobile, o YouTube recomenda muito mais lives verticais formato 9:16 mas a imagem do computador é 16:9,
sendo assim precisava-se de uma solução para não perder detalhes da gameplay.
- Com esse script as pessoas que estão assistindo conseguem acompanhar o mouse e acompanhar a linha de raciocínio do streamer.

### Problemas:

- Atualmente o script é Fixo em 1920x1080, sem ajustes não funcionaria para outros monitores.
- Alguns jogos de FPS não centralizam sempre o cursor ao centro, como o RE4, então acaba que o script joga a tela para esquerda ou direita no momento errado

### Possível solução:
- Adicionar um temporizador que não permite que a tela se permaneça nos cantos por mais que X segundos.
- Criar uma lógica para impedir que volte para a esquerda ao mesmo tempo, por exemplo se a função acima foi acionada esperar X segundos para poder fazer uma nova transição.

### Explicação:
- É legal acompanhar o mouse, porém é ruim quando faz isso descontroladamente, se eu voltar ao centro e já voltar para a esquerda não vai fazer sentido algum.

### Considerações Finais: 

- O projeto funciona super bem para jogos que não prendem o mouse como os jogos de Tiro, jogos de tabuleiro o projeto acompanha super bem o mouse.
- A possível solução é apenas para o problema dos jogos de FPS, jogos de plataforma, tabuleiros, funcionam perfeitamente.

### Outra versão futura

- Com o Mouse ao centro a tela deve ficar ampliada
- Com o Mouse nas bordas a cena deve diminuir para encaixar

<br/>

*Essa futura versão pode acabar com os problemas de perder detalhes em jogos de FPS*
