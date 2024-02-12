%% -*- mode: latex; coding: utf-8 -*-
%% This is df-ufpb.cls
%% A LaTeX class to typeset dissertations and thesis for submission
%% to the graduate and undergraduate degrees in philosophy at UFPB.
%% 
%% Copyright (C) 2024 LoTTec -- UFPB
%% ----------------------------------------------------------
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3c or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.

%% ======================= Indentification ===========================
\NeedsTeXFormat{LaTeX2e}[1999/12/01]%
\ProvidesClass{df-ufpb}%
[2023/12/31 v1.0 DF-UFPB Thesis Class]%

%% ================== Preliminary Declarations =======================
\RequirePackage{ifthen}%

\newboolean{abnt}     % true for following ABNT to the letter

%% =========================== Options ===============================
\DeclareOption{tese}{%
 \def\ufpb@titulacao{Doutor}%
 \def\ufpb@documento{\thesisname}%
 \def\ufpb@programa{ao Programa de P\'{o}s Gradua\c{c}\~{a}o em %
  Filosofia}%
 \def\ufpb@curso{Doutorado}
}%

\DeclareOption{dissertacao}{%
 \def\ufpb@titulacao{Mestre}%
 \def\ufpb@documento{\dissertationname}%
 \def\ufpb@programa{ao Programa de P\'{o}s-Gradua\c{c}\~{a}o em %
   Filosofia}%
 \def\ufpb@curso{Mestrado}%
}%

\DeclareOption{tcc}{%
 \def\ufpb@titulacao{Bacharel}%
 \def\ufpb@documento{\monographname}%
 \def\ufpb@programa{à Coordena\c{c}\~{a}o do Curso de %
   Filosofia}%
 \def\ufpb@curso{Gradua\c{c}\~{a}o}%
}%

\DeclareOption{abnt}{%
  \setboolean{abnt}{true}%
}%

\DeclareOption{greek}{%
  \PassOptionsToPackage{\CurrentOption}{report}
  \AtEndOfClass{%
    \languageattribute{greek}{polutoniko}%
    \addto\captionsgreek{%
      \def\pagesname{sel'ides}%
      \def\keysname{Th'ema}%
      \def\thesisname{Th'esis}%
      \def\dissertationname{Th'esis}%
      \def\monographname{Th'esis}%
      \def\acknowledgementname{Eucharist'ies}%
    }%
  }%
}%

\DeclareOption{latin}{%
  \PassOptionsToPackage{\CurrentOption}{report}
  \AtEndOfClass{%
    \languageattribute{latin}{medieval}%
    \addto\captionslatin{%
      \def\pagesname{chartae}%
      \def\keysname{Materia}%
      \def\thesisname{Dissertatio}%
      \def\dissertationname{Dissertatio}%
      \def\monographname{Dissertatio}%
      \def\acknowledgementname{Recognitiones}%
    }%
  }%
}%

\DeclareOption{french}{%
  \PassOptionsToPackage{\CurrentOption}{report}
  \AtEndOfClass{%
    \addto\captionsfrench{%
      \def\pagesname{pages}%
      \def\keysname{Mots-cl\'es}%
      \def\thesisname{Th\`ese de Doctorat}%
      \def\dissertationname{M\'emoire de Master}%
      \def\monographname{Monographie de Baccalaur\'{e}at}%
      \def\acknowledgementname{Remerciements}%
    }%
  }%
}%

\DeclareOption{german}{%
  \PassOptionsToPackage{\CurrentOption}{report}
  \AtEndOfClass{%
    \addto\captionsgerman{%
      \def\pagesname{seiten}%
      \def\keysname{Stichw\"orter}%
      \def\thesisname{Doktorarbeit}%
      \def\dissertationname{Masterarbeit}%
      \def\monographname{Diplomarbeit}%
      \def\acknowledgementname{Danksagungen}%
    }%
  }%
}%

\DeclareOption{brazil}{%
  \PassOptionsToPackage{\CurrentOption}{report}
  \AtEndOfClass{%
    \addto\captionsbrazil{%
      \def\pagesname{p\'aginas}%
      \def\keysname{Palavras-chave}%
      \def\thesisname{Tese}%
      \def\dissertationname{Disserta\c{c}\~ao}%
      \def\monographname{Monografia}%
      \def\acknowledgementsname{Agradecimentos}%
    }%
  }%
}%

\DeclareOption{english}{%
  \PassOptionsToPackage{\CurrentOption}{report}
  \AtEndOfClass{%
    \addto\captionsenglish{%
      \def\pagesname{pages}%
      \def\keysname{Keywords}%
      \def\thesisname{PhD Thesis}%
      \def\dissertationname{Master's Dissertation}%
      \def\monographname{Bachelor's Monograph}%
      \def\acknowledgementsname{Acknowledgements}%
    }%
  }%
}%

%% Pass any unknown option to the report class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%% Loading necessary class and packages
\LoadClass[a4paper,12pt]{report}%
\RequirePackage[utf8]{inputenc}%
\RequirePackage[T1]{fontenc}%
\RequirePackage{indentfirst}%
\RequirePackage{setspace}%
\RequirePackage{pageslts}%
\pagenumbering{arabic}%
\RequirePackage{babel}%
\RequirePackage{graphicx}%  

%% ABNT quotation environment
\newenvironment{citacao}%
  {\begin{spacing}{1.}%
   \small
   \begin{list}{}{%
       \setlength{\listparindent}{0cm}%
       \setlength{\itemindent}{\listparindent}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\leftmargin}{4cm}%
       \setlength{\parsep}{0pt}}%
    \item\relax}%
  {\end{list}\end{spacing}}

\ifthenelse{\boolean{abnt}}{%
  \RequirePackage[alf]{abntex2cite}%
  \newcommand{\textcite}[2][]{\citeonline[#1]{#2}}%
  \newcommand{\autocite}[2][]{\cite[#1]{#2}}%
  \renewenvironment{quote}%
                   {\begin{citacao}}%
                   {\end{citacao}}%
}{}%

\RequirePackage{ifpdf}   % pdfTeX?
\ifpdf%
 \RequirePackage[hidelinks,pdftex]{hyperref}%
 \pdfadjustspacing=1            % LaTeX spacing
 \AtBeginDocument{%
   %% Define a command to use when there is no gender declination
   \ifthenelse{\isundefined{\ufpb@autora}}{\let\ufpb@autorx=\ufpb@autor}{\let\ufpb@autorx=\ufpb@autora}%
   \hypersetup{%
     bookmarksopen=false,%
     bookmarksnumbered=true,%
     pdfstartview=FitH,%
     hypertexnames=false,%
     naturalnames=true,%
     backref=page,%
     hyperindex=true,%
     pdftitle={\ufpb@titulo},%
     pdfauthor={\ufpb@autorx},%
     pdfsubject={\ufpb@chaves}%
   }%
 }%
\else%
 \RequirePackage[dvips]{hyperref}%
\fi%
%% ========================== Main Code ==============================

\def\titulo#1{\def\ufpb@titulo{#1}}%
\def\subtitulo#1{\def\ufpb@subtitulo{#1}}%
\def\autor#1{\def\ufpb@autor{#1}}%
\def\autora#1{\def\ufpb@autora{#1}}%
\def\autorR#1{\def\ufpb@autorR{#1}}%
\def\orientador#1{\def\ufpb@orientador{#1}}%
\def\orientadora#1{\def\ufpb@orientadora{#1}}%
\def\coorientador#1{\def\ufpb@coorientador{#1}}%
\def\coorientadora#1{\def\ufpb@coorientadora{#1}}%
\def\chaves#1{\def\ufpb@chaves{#1}}%
\def\keys#1{\def\ufpb@keys{#1}}%
\def\dia#1{\def\ufpb@dia{#1}}%
\def\mes#1{\def\ufpb@mes{#1}}%
\def\ano#1{\def\ufpb@ano{#1}}%
\def\cidade#1{\def\ufpb@cidade{#1}}%
\cidade{Jo\~ao Pessoa}           % default 
\def\centro#1{\def\ufpb@centro{#1}}%
\centro{Centro de Ci\^{e}ncias Humanas, Letras e Artes}                                 % default
\def\unidade#1{\def\ufpb@unidade{#1}}%
\unidade{Departamento de Filosofia}      % default
\def\area#1{\def\ufpb@area{#1}}
\area{Filosofia}                                       % default
\def\programa#1{\def\ufpb@programa{#1}}%
\def\universidade#1{\def\ufpb@universidade{#1}}%
\universidade{Universidade Federal da Para\'{i}ba} % default
\def\siglauni#1{\def\ufpb@uni{#1}}%
\siglauni{UFPB}                          % default
\def\linhadepesquisa#1{\def\ufpb@linhadepesquisa{#1}}%
\def\titulacao#1{\def\ufpb@titulacao{#1}}%
\def\inclui#1{\long\def\ufpb@inclui{#1}}%
\inclui{\IfFileExists{\jobname.bbl}{Inclui bibliografia.}} % default
\def\codigoBC#1{\def\ufpb@codigoBC{#1}}%
\def\CDU#1{\def\ufpb@CDU{#1}}%
\def\classi#1{\def\ufpb@classi{#1}}%
\def\classii#1{\def\ufpb@classii{#1}}%
\def\classiii#1{\def\ufpb@classiii{#1}}%


%% Elementos Pre-textuais

%%% Capa

\newcommand{\capa}{%
 \ifpdf
  \pdfbookmark[0]{Elementos Pr\'{e}-Textuais}{pretexto}
  \pdfbookmark[1]{Capa}{pretexto.capa}
 \fi
 % 
 \begin{titlepage}
   \begin{otherlanguage}{brazil}
     \begin{onehalfspace}
       \begin{center}
         \includegraphics[height=0.1\paperheight]{brasao-ufpb}\par
         \Large\textsc{\ufpb@universidade}\linebreak%
         \textsc{\ufpb@centro}\linebreak%
         \textsc{\ufpb@unidade}%
       \end{center}
     \end{onehalfspace}
     \begin{doublespace}
       \vspace{\stretch{0.5}}%
       \begin{center}
         \Large\textbf{\ufpb@titulo}\linebreak%
         \ifthenelse{\isundefined{\ufpb@subtitulo}}{}{%
           \large\textbf{\ufpb@subtitulo}}
       \end{center}
     \end{doublespace}
     \begin{center}
       \Large\ufpb@autorx%
     \end{center}
     \vfill
     \begin{center}
       \ufpb@cidade\linebreak%
       \ufpb@ano\linebreak%
     \end{center}
   \end{otherlanguage}
 \end{titlepage}%
}%

%%% Autorizacao para publicacao

\newcommand{\publica}{%
 \ifpdf
  \pdfbookmark[1]{Publica\c{c}\~{a}o}{pretexto.publica}
 \fi
 \begin{otherlanguage}{brazil}
   \begin{onehalfspace}
     \begin{center}
       \Large\textsc{\ufpb@universidade}\linebreak%
       \textsc{\ufpb@centro}\linebreak%
       \textsc{\ufpb@unidade}%
     \end{center}
   \end{onehalfspace}
   \vspace{\stretch{0.3}}%
   \begin{onehalfspace}
     \begin{center}
       \large\textbf{\MakeUppercase{Autoriza\c{c}\~{a}o para %
           Publica\c{c}\~{a}o de\ \ufpb@documento{} Em Formato %
           Eletr\^{o}nico}}
     \end{center}
   \end{onehalfspace}
   \vspace{10pt}%
   Na qualidade de titular dos direitos de autor, \textbf{AUTORIZO}
   a \ufpb@universidade{} -- \ufpb@uni{} a
   reproduzir, inclusive em outro formato ou m\'{i}dia e atrav\'{e}s
   de armazenamento permanente ou tempor\'{a}rio, bem como a
   publicar na rede mundial de computadores (\textit{Internet}) e na
   biblioteca virtual da \ufpb@uni, entendendo-se os termos
   ``reproduzir'' e ``publicar'' conforme defini\c{c}\~{o}es dos
   incisos VI e I, respectivamente, do artigo 5\textordmasculine{}
   da Lei n\textordmasculine{} 9610/98 de 10/02/1998, a obra abaixo
   especificada, sem que me seja devido pagamento a t\'{i}tulo de
   direitos autorais, desde que a reprodu\c{c}\~{a}o e/ou
   publica\c{c}\~{a}o tenham a finalidade exclusiva de uso por quem
   a consulta, e a t\'{i}tulo de divulga\c{c}\~{a}o da
   produ\c{c}\~{a}o acad\^{e}mica gerada pela Universidade, a partir
   desta data.
   \vspace{15pt}%
   \par%
   \noindent\textbf{T\'{i}tulo:} \ufpb@titulo{}%
   \ifthenelse{\isundefined{\ufpb@subtitulo}}{}{%
     \ -- \ufpb@subtitulo}\par%
   \vspace{15pt}%
   \noindent%
   \ifthenelse{\isundefined{\ufpb@autora}}{%
     \textbf{Autor:} \ufpb@autor\par}{%
     \textbf{Autora:} \ufpb@autora\par}%
   \vspace{20pt}%
   \noindent\ufpb@cidade{}, \ufpb@dia{} de \ufpb@mes{} de %
   \ufpb@ano{}.%
   \vfill%
   \begin{flushright}
     \rule{0.7\textwidth}{0.4pt}\linebreak%
     \small%
     \ifthenelse{\isundefined{\ufpb@autora}}{%
       \ufpb@autor{} -- Autor\par}{%
       \ufpb@autora{} -- Autora\par}%
     \vspace{20pt}
     \rule{0.7\textwidth}{0.4pt}\linebreak%
     \small%
     \ifthenelse{\isundefined{\ufpb@orientadora}}{%
         \ufpb@orientador{} -- Orientador\par}{%
         \ufpb@orientadora{} -- Orientadora\par}%
     \ifthenelse{\isundefined{\ufpb@coorientador}}{}{%
       \vspace{20pt}%
       \rule{0.7\textwidth}{0.4pt}\linebreak%
       \small\ufpb@coorientador{} -- Co-Orientador}
     \ifthenelse{\isundefined{\ufpb@coorientadora}}{}{%
       \vspace{20pt}%
       \rule{0.7\textwidth}{0.4pt}\linebreak%
       \small\ufpb@coorientadora{} -- Co-Orientadora}
   \end{flushright}%
 \end{otherlanguage}
 \thispagestyle{empty}%
 \clearpage
}%

%%% Folha de rosto

\newcommand{\rosto}{%
 \ifpdf
  \pdfbookmark[1]{Folha de Rosto}{pretexto.rosto}
 \fi
 \begin{otherlanguage}{brazil}
   \begin{onehalfspace}
     \begin{center}
       \Large\textsc{\ufpb@autorx}
     \end{center}
     \vspace{\stretch{0.7}}
     \begin{center}
       \Large\textbf{\ufpb@titulo}\linebreak%
       \ifthenelse{\isundefined{\ufpb@subtitulo}}{}{%
         \large\textbf{\ufpb@subtitulo}}
     \end{center}
   \end{onehalfspace}
   \vspace{\stretch{0.7}}
   \begin{flushright}
     \begin{minipage}{9.5cm}
       \ufpb@documento{} apresentada \ufpb@programa{} da
       \ufpb@universidade{}, como requisito parcial para
       obten\c{c}\~{a}o do t\'{i}tulo de \ufpb@titulacao{} em
       \ufpb@area{}.\par%
       \vspace{2cm}
       \begin{tabular}{rp{6cm}}
         \ifthenelse{\isundefined{\ufpb@linhadepesquisa}}{}{%
           \textsf{Linha de Pesquisa:} & \ufpb@linhadepesquisa{}\\[4pt]
         }%
         \ifthenelse{\isundefined{\ufpb@orientadora}}{%
           \textsf{Orientador:}     & Prof. Dr. \ufpb@orientador{}\\
         }{%
           \textsf{Orientadora:}     & Profa. Dra. \ufpb@orientadora{}\\
         }%
         \ifthenelse{\NOT\isundefined{\ufpb@coorientadora}}{%
           \textsf{Coorientadora:}     & Profa. Dra. \ufpb@coorientadora{}
         }{}%
         \ifthenelse{\NOT\isundefined{\ufpb@coorientador}}{%
           \textsf{Coorientador:}     & Prof. Dr. \ufpb@coorientador{}
         }{}%
       \end{tabular}
     \end{minipage}
   \end{flushright}
   \vfill
   \begin{center}
     \ufpb@cidade{}\linebreak
     \ufpb@ano
   \end{center}
 \end{otherlanguage}
 \thispagestyle{empty}
 \clearpage
}%

%%% Ficha Catalografica

\newcommand{\ficha}{%
 \ifpdf
  \pdfbookmark[1]{Ficha Catalogr\'{a}fica}{pretexto.ficha}
 \fi
 \thispagestyle{empty}%
 \null\vfill%
 \begin{otherlanguage}{brazil}
   \begin{minipage}[b]{\textwidth}
     \begin{center}
       \textbf{Dados Internacionais de Cataloga\c{c}\~{a}o na %
         Publica\c{c}\~{a}o (CIP)}\par%
       \textbf{BC/UFPB}
     \end{center}
     \begin{center}
     \begin{tabular}{|l p{0.6\linewidth} r|}
       \hline
       & \ufpb@autorR & \\
       \ufpb@codigoBC & \ufpb@titulo
       \ifthenelse{\isundefined{\ufpb@subtitulo}}{}{%
         : \ufpb@subtitulo} [manuscrito] / %
       \ufpb@autorx{}. -- \ufpb@ano{}. & \\
       & \lastpageref{LastPages}f. & \\[0.5cm]
       & \ifthenelse{\isundefined{\ufpb@orientadora}}{%
         Orientador: Prof. \ufpb@orientador{}}{Orientadora: Profa. \ufpb@orientadora{}}
       \ifthenelse{\isundefined{\ufpb@coorientador}}{}{%
         ; Co-Orientador: Prof. \ufpb@coorientador{}}
       \ifthenelse{\isundefined{\ufpb@coorientadora}}{}{%
         ; Co-Orientadora: Profa. \ufpb@coorientadora{}} & \\
       & \ufpb@documento{} (\ufpb@curso{}) -- \ufpb@universidade{}, %
       \ufpb@unidade{}, \ufpb@ano{}. & \\[0.5cm]
       & \ufpb@inclui{} & \\[1cm]
       
       & 1.~\ufpb@classi{} 2.~\ufpb@classii{} 3.~\ufpb@classiii{} %
       I.~T\'{i}tulo. & \\
       & & CDU: \ufpb@CDU \\
       \hline
     \end{tabular}
     \end{center}
   \end{minipage}
 \end{otherlanguage}
 \thispagestyle{empty}
 \clearpage%
}%

%%% Termo de aprovacao
\newenvironment{aprovacao}{
 \ifpdf
  \pdfbookmark[1]{Aprova\c{c}\~{a}o}{pretexto.aprovacao}
 \fi
 \newcommand{\membro}[3]{%
   \rule{0.8\textwidth}{0.4pt}\linebreak
   \textbf{##1}\linebreak
   ##2 -- ##3 \vskip 30pt
 }%
 \begin{otherlanguage}{brazil}
   \begin{center}
     \begin{onehalfspace}
       \Large\textsc{\ufpb@autorx}\linebreak
       \vskip 20pt
       \Large\textbf{\ufpb@titulo}\linebreak
       \ifthenelse{\isundefined{\ufpb@subtitulo}}{}{%
         \large\textbf{\ufpb@subtitulo}}
     \end{onehalfspace}
   \end{center}\par%
   \vskip 30pt 
   \ufpb@documento{} apresentada \ufpb@programa{} da
   \ufpb@universidade{} como requisito parcial para
   obten\c{c}\~{a}o do t\'{i}tulo de \ufpb@titulacao{} em
   \ufpb@area{}, aprovado em \ufpb@dia{} de \ufpb@mes{} de
   \ufpb@ano{}, pela Banca Examinadora constitu\'{i}da pelos
   professores abaixo assinados.\par
   \vfill
   \begin{center}
     \rule{0.8\textwidth}{0.4pt}\linebreak
     \ifthenelse{\isundefined{\ufpb@orientadora}}{%
       \textbf{Prof. Dr. \ufpb@orientador}\linebreak}{%
       \textbf{Profa. Dra. \ufpb@orientadora}\linebreak}%
     Presidente da Banca \vskip 30pt
}{%
   \end{center}%
 \end{otherlanguage}
 \thispagestyle{empty}%
 \clearpage%
}%

%%% Dedicatoria

\newenvironment{dedicatoria}{%
 \ifpdf
  \pdfbookmark[1]{Dedicat\'{o}ria}{pretexto.dedicatoria}
 \fi
 \vspace*{\stretch{0.5}}
 \begin{center}
}{\vspace*{\fill}\end{center}\thispagestyle{empty}\clearpage}

%%% Agradecimentos

\newenvironment{agradecimentos}{
 \ifpdf
  \pdfbookmark[1]{\acknowledgementsname}{pretexto.agradecimentos}
 \fi
 \begin{center}
   \textbf{\Huge{\acknowledgementsname}}
 \end{center}
 \par%
 \vspace{30pt}%
}{\thispagestyle{empty}\clearpage}

%%% Resumo

\newenvironment{resumo}{%
  \begin{otherlanguage}{brazil}
    \ifpdf
    \pdfbookmark[1]{\abstractname}{pretexto.resumo}
    \fi
    \begin{center}
      \textbf{\Huge{\abstractname}}
    \end{center}
    \par\vspace{30pt}\noindent
    \begin{minipage}{\textwidth}
      \begin{singlespace}
        \ufpb@autorR{}.
        \textbf{\ufpb@titulo}.
        \ufpb@cidade{}, \ufpb@ano{}.
        \lastpageref{LastPage} \pagesname.
        \ufpb@documento{} de \ufpb@curso{}.
        \ufpb@unidade{},
        \ufpb@universidade.
      \end{singlespace}
    \end{minipage}
    \par\vspace{20pt}
}{%
  % \vspace{\stretch{0.8}}%
  \par%
  \vspace{20pt}
  \noindent\textbf{\keysname{}\ }
  \ufpb@chaves{}%
  \end{otherlanguage}
  \thispagestyle{empty}
  \clearpage%
}%

%%% Abstract

\renewenvironment{abstract}[2][\ufpb@titulo]{%
  \begin{otherlanguage}{#2}
  \ifpdf
  \pdfbookmark[1]{\abstractname}{pretexto.abstract} 
 \fi
 \begin{center}
   \textbf{\Huge{\abstractname}}%
 \end{center}
 \par\vspace{30pt}\noindent
  \begin{minipage}{\textwidth}
    \begin{singlespace}
      \foreignlanguage{brazil}{\ufpb@autorR}.
      \textbf{#1}.
      \foreignlanguage{brazil}{\ufpb@cidade},
      \foreignlanguage{brazil}{\ufpb@ano}.
      \lastpageref{LastPage} \pagesname.
      \ufpb@documento{}.
      \foreignlanguage{brazil}{\ufpb@unidade},
      \foreignlanguage{brazil}{\ufpb@universidade}.
    \end{singlespace}
  \end{minipage}
  \par\vspace{20pt}
  }
  {%
  \par%
  \vspace{20pt}%
  \noindent\textbf{\keysname{}\ }%
  \ufpb@keys{}%
  \end{otherlanguage}%
  \thispagestyle{empty}%
  \clearpage%
  }

%%% Epigrafe

\newcommand{\epigrafe}[4][brazilian]{%
  \ifpdf
   \pdfbookmark[1]{Ep\'{i}grafe}{pretexto.epigrafe}
  \fi
  \thispagestyle{empty}%
  \vspace*{\stretch{1}}%
  \begin{otherlanguage}{#1}%
  \begin{quotation}%
  \noindent #2\par
  \begin{flushright}
  \textbf{#3}\\ \textit{#4}
  \end{flushright}%
  \end{quotation}%
  \end{otherlanguage}
  \thispagestyle{empty}%
  \clearpage%
}

\newcommand{\listadefiguras}{%
  \ifpdf%
  \pdfbookmark[1]{\listfigurename}{figuras}
  \fi
  \listoffigures%
  \thispagestyle{empty}%
  \clearpage%
}%

\newcommand{\listadetabelas}{%
  \ifpdf%
  \pdfbookmark[1]{\listtablename}{tabelas}
  \fi
  \listoftables%
  \thispagestyle{empty}%
  \clearpage%
}%

\newcommand{\sumario}{%
  \ifpdf%
  \pdfbookmark[1]{\contentsname}{sumario}
  \fi
  \tableofcontents%
  \thispagestyle{empty}%
  \clearpage%
}%

\newcommand{\bibliografia}[1]{%
%  \clearpage
%  \addcontentsline{toc}{chapter}{Bibliography}
  \ifpdf%
  \pdfbookmark[0]{\bibname}{bib}
  \fi
  \bibliography{#1}
}%

\endinput

%% =================== End of file df-ufpb.cls =====================
