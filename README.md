# Uma classe LaTeX para trabalhos acadêmicos

[![Build
Status](../../actions/workflows/main.yml/badge.svg)](../../actions/workflows/main.yml)

A classe `df-ufpb.cls` foi escrita para auxiliar estudantes na elaboração de monografias, dissertações ou teses.

O foco da classe é a geração de elementos textuais comuns em trabalhos acadêmicos (capa, folha de rosto e etc.) e algumas amenidades e ajustes na produção do PDF (metadados e marcadores). Para além disto, no entanto, não é imposta qualquer diagramação ou estilo. Estes aspectos visuais são melhor relegados ao gosto da freguesia. 

Um [modelo LaTeX](../../blob/main/modelo.tex) ilustrativo e o [PDF resultante](../../releases/latest/download/modelo.pdf) estão disponíveis.

# Instruções

Coloque a classe `df-ufpb.cls` no próprio diretório onde se encontra o arquivo `.tex`.

A classe foi testada numa instalação completa e atualizada do [TeX Live](https://www.tug.org/texlive/).
Diversos pacotes comuns (e alguns incomuns) são requeridos pela classe, tais como `hyperref`, `babel`, `identfirst` e `graphicx`, dentre outros. Ademais, para fazer uso das funcionalidades envolvendo idiomas estrangeiros, a sua instalação do TeX deve fornecer suporte completo ao respectivo idioma.

Abaixo, uma descrição das opções e comandos básicos disponibilizados pela classe.

## Opções

A classe pode ser invocada como abaixo.


```LaTeX
\documentclass[12pt,tcc,abnt,english,brazil]{df-ufpb}
```

Qualquer opção não reconhecida pela `df-ufpb` é repassada à classe comum `report`. Portanto, você pode utilizar normalmente qualquer opção suportada por esta classe comum.

São detectadas três opções que definem o tipo de trabalho: `tcc`, `dissertacao` e `tese`. Passe os idiomas a serem usados no trabalho, sendo o último idioma aquele no qual o trabalho é majoritariamente escrito. Os demais idiomas podem ser empregados, por exemplo, em citações ou no resumo em língua estrangeira.

A opção `abnt` redefine o ambiente `quote` de modo a formatar citações destacadas com espaçamento conforme a ABNT (NBR 14724). Note que o espaçamento simples para citações é o *único* aspecto desta norma implantado. Para formatar as referências no estilo autor-data previsto na ABNT (NBR 10520), pode ser usado o pacote `abntex2cite` do [ABNTeX2](https://www.abntex.net.br) ou o [estilo ABNT](https://www.ctan.org/pkg/biblatex-abnt) para o BibLaTeX. Normalmente, essas adaptações são suficientes para convencer a maior parte dos burocratas de que o trabalho "obedece as normas da ABNT". Contudo, caso possível, é recomendável não seguir estas normas, mas adotar um estilo com ampla aceitação internacional, como [Chicago](https://www.ctan.org/pkg/biblatex-chicago), por exemplo. 

## Metadados

Estes comandos devem ser usados no preâmbulo (antes de `\begin{document}`) para informar alguns metadados para a classe.

### `\titulo{}` (obrigatório)

Informar o título do trabalho.

### `\subtitulo{}` (opcional)

Informar o subtítulo do trabalho.

### `\autor{}` ou `\autora{}` (obrigatório ao menos um)

Informar o(a) autor(a) do trabalho.

### `\autorR{}` (obrigatório)

Informar o nome do(a) autor(a) no formato "Sobrenome, Nome".

### `\orientador{}` ou `\orientadora{}` (obrigatório ao menos um)

Informar o(a) orientador(a) do trabalho.

### `\coorientador{}` ou `\coorientadora{}` (opcional)

Informar o(a) coorientador(a) do trabalho, caso houver.

### `\chaves{}` (obrigatório)

Informar as palavras-chave do trabalho, para aparecer junto ao resumo.

### `\keys{}` (obrigatório)

Informar "keywords" (ou equivalente em outra língua estrangeira), para aparecer junto ao resumo em língua estrangeira.

### `\dia{}` (obrigatório)

Informar dia da defesa.

### `\mes{}` (obrigatório)

Informar mês da defesa, por extenso.

### `\ano{}` (obrigatório)

Informar ano da defesa.

### `\cidade{}` (opcional)

Informar a cidade onde ocorreu/ocorrerá a defesa. Caso não informado, será assumido "João Pessoa".

### `\universidade{}` (opcional)

Informar a universidade. Caso não informado, será assumido "Universidade Federal da Paraíba".

### `\siglauni{}` (opcional)

Informar a sigla da universidade. Caso não informado, será assumido "UFPB".

### `\centro{}` (opcional)

Informar o centro, ou órgão de vinculação do curso. Caso não informado, será assumido "Centro de Ciências Humanas, Letras e Artes".

### `\unidade{}` (opcional)

Informar o departamento, ou unidade de vinculação do(a) orientador(a). Caso não informado, será assumido "Departamento de Filosofia".

### `\area{}` (opcional)

Informar a área de conhecimento do trabalho. Caso não informado, será assumido "Filosofia".

### `\linhadepesquisa{}` (opcional)

Informar a linha de pesquisa na qual se insere o trabalho. Normalmente, deve ser informado no caso de trabalhos de pós-graduação.

### `\titulacao{}` (opcional)

Informar a titulação associada ao trabalho. Caso não informado, será assumido "Bacharel", "Mestre" ou "Doutor", conforme o tipo do trabalho. Estudantes de licenciatura podem informar "Licenciado" ou "Licenciada" aqui.

### `\codigoBC{}` (necessário caso seja usado o comando `\ficha`)

Informar o código atribuído ao trabalho na ocasião da catalogação na fonte (CIP), feita pela biblioteca.

### `\CDU{}` (necessário caso seja usado o comando `\ficha`)

Informar a [classificação decimal universal](https://pt.wikipedia.org/wiki/Classifica%C3%A7%C3%A3o_decimal_universal) do trabalho.

### `\classi{}` (necessário caso seja usado o comando `\ficha`)

Informar o primeiro nível de classificação, segundo a CIP.

### `\classii{}` (necessário caso seja usado o comando `\ficha`)

Informar o segundo nível de classificação, segundo a CIP.

### `\classiii{}` (necessário caso seja usado o comando `\ficha`)

Informar o terceiro nível de classificação, segundo a CIP.

## Comandos para geração de elementos pré- e pós-textuais

### `\capa`

Gera uma capa.

### `\ficha`

Gera uma ficha catalográfica.

### `\publica`

Gera um termo de autorização de publicação.

### `\rosto`

Gera uma folha de rosto.

### `\begin{aprovacao}` [...] `\end{aprovacao}`

Ambiente para geração da folha de aprovação da banca. O(a) presidente da banca já fica preenchido, assumindo os dados do(a) orientador(a). Para os demais membros, usar o comando `\membro{}{}{}` dentro do ambiente. O primeiro argumento é o nome (com titulação), o segundo é a filiação, o terceiro é função na banca (avaliador(a), arguidor(a), coorientador(a), etc.).

### `\begin{dedicatoria}` [...] `\end{dedicatoria}`

Ambiente para gerar uma folha com dedicatória.

### `\begin{agradecimentos}` [...] `\end{agradecimentos}`

Ambiente para gerar uma folha com agradecimentos.

### `\begin{resumo}` [...] `\end{resumo}`

Ambiente para gerar uma folha com o resumo em língua portuguesa.

### `\begin{abstract}{}[]` [...] `\end{abstract}`

Ambiente para gerar uma folha com o resumo em língua estrangeira.

O argumento obrigatório entre chaves é o idioma no qual o resumo está escrito, conforme identificado pelo pacote `babel`. Este idioma deve ter sido carregado previamente na chamada ao comando `\documentclass`.

O argumento opcional entre colchetes é uma tradução do título do trabalho na língua estrangeira.

### `\epigrafe[]{}{}{}`

Gera uma folha com uma epígrafe. O primeiro argumento é a epígrafe, o segundo é o nome do autor e o terceiro é o nome da obra. Para frases em língua estrangeira, colocar o idioma no argumento opcional entre colchetes.

### `\listadefiguras`

Gera uma lista de figuras.

### `\listadetabelas`

Gera uma lista de tableas.

### `\sumario`

Gera um sumário.

# Termos de uso

Esta classe está sob [The LaTeX Project Public License](https://www.latex-project.org/lppl.txt). A imagem com o brasão da UFPB é distribuída para sua conveniência. Seu uso é [regimentado pela UFPB](https://www.ufpb.br/ufpb/contents/documentos/outros-pdfs/orientacoes-sobre-o-uso-do-brasao-oficial-da-ufpb.pdf).
