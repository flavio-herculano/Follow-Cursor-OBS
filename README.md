# Follow-Cursor-OBS

Esta é uma solução para lives verticais pelo OBS 

- O script reconhece a posição do mouse
- A gameplay (fonte: Tela) move para esquerda e direita de acordo com a posição atual do mouse

Instalação:

- Dentro do OBS acesse o menu Ferramentas/Scripts
- Importe o arquivo "follow-cursor.lua" para os scripts
- Dentro do script.lua existem as variáveis de Cena e Fonte, atualize conforme necessário

Observações:

- Evite logs pois o OBS trava com o tempo

Motivação:

- A maioria do público de lives é mobile, o YouTube recomenda muito mais lives verticais formato 9:16 mas a imagem do computador é 16:9,
sendo assim precisava-se de uma solução para não perder detalhes da gameplay.
- Com esse script as pessoas que estão assistindo conseguem acompanhar o mouse e acompanhar a linha de raciocínio do streamer.

Problemas:

- Atualmente o script é Fixo em 1920x1080, sem ajustes não funcionaria para outros monitores.
- Alguns jogos de FPS não centralizam sempre o cursor ao centro, como o RE4, então acaba que o script joga a tela para esquerda ou direita no momento errado

Possível solução:
- Adicionar um temporizador que não permite que a tela se permaneça nos cantos por mais que X segundos.
- Criar uma lógica para impedir que volte para a esquerda ao mesmo tempo, por exemplo se a função acima foi acionada esperar X segundos para poder fazer uma nova transição.

Explicação:
- É legal acompanhar o mouse, porém é ruim quando faz isso descontroladamente, se eu voltar ao centro e já voltar para a esquerda não vai fazer sentido algum.

Considerações Finais: 

- O projeto funciona super bem para jogos que não prendem o mouse como os jogos de Tiro, jogos de tabuleiro o projeto acompanha super bem o mouse.
- A possível solução é apenas para o problema dos jogos de FPS, jogos de plataforma, tabuleiros, funcionam perfeitamente.
