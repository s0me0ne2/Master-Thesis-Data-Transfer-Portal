% Klasa dokumentow do skladu prac magisterskich i~licencjackich
% na wydziale Matematyki, Mechaniki i~Informatyki UW.
%
% Copyright (c) 2001 by Wydzial Matematyki, Informatyki i Mechaniki.
%
% Zmiany 05.05.2006 by Seweryn Karlowicz
%
% Zmiany 03.01.2017 by Kuba Pochrybniak

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pracamgr}[2017/01/03 v0.7.0 Praca magisterska]
\newif\ifmyclass@en
\DeclareOption{en}{\myclass@entrue}
\DeclareOption{pl}{\myclass@enfalse}
\ExecuteOptions{pl}
\ProcessOptions\relax

\newcommand\blankpage{%
    \null
    \thispagestyle{empty}%
    \addtocounter{page}{-1}%
    \newpage}

\ifmyclass@en
	\RequirePackage[english]{babel}
	\RequirePackage[T1]{fontenc}
\else
	\RequirePackage[polish]{babel}
	\RequirePackage[T1]{fontenc}
\fi
\RequirePackage[utf8]{inputenc}

\def\@baseclass{report}
\def\@rodzajpracy{\ifmyclass@en Second cycle degree\else magisterska\fi}
\def\@stopien{\ifmyclass@en Master\else magister\fi}
\DeclareOption{licencjacka}{
	\def\@stopien{\ifmyclass@en Bachelor\else licencjat\fi}
	\def\@rodzajpracy{\ifmyclass@en Bachelor's\else licencjacka\fi}
}
%\DeclareOption{licencjacka}{}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseclass}}
\PassOptionsToClass{a4paper,twoside,openright,11pt}{\@baseclass}
\ProcessOptions

\LoadClass{\@baseclass}

\textwidth\paperwidth
\advance\textwidth -55mm
\oddsidemargin-1in
\advance\oddsidemargin 30mm
\evensidemargin-1in
\advance\evensidemargin 25mm
\topmargin -1in
\advance\topmargin 2cm
\setlength\textheight{48\baselineskip}
\addtolength\textheight{\topskip}
\marginparwidth15mm

\newcounter{liczbaAutorow}
\setcounter{liczbaAutorow}{0}
\def\autor#1#2{\def\@imienazwisko{#1}\def\@album{#2}\stepcounter{liczbaAutorow}}
\def\autori#1#2{\def\@imienazwiskoi{#1}\def\@albumi{#2}\stepcounter{liczbaAutorow}}
\def\autorii#1#2{\def\@imienazwiskoii{#1}\def\@albumii{#2}\stepcounter{liczbaAutorow}}
\def\autoriii#1#2{\def\@imienazwiskoiii{#1}\def\@albumiii{#2}\stepcounter{liczbaAutorow}}
\def\autoriv#1#2{\def\@imienazwiskoiv{#1}\def\@albumiv{#2}\stepcounter{liczbaAutorow}}
\def\autorv#1#2{\def\@imienazwiskov{#1}\def\@albumv{#2}\stepcounter{liczbaAutorow}}

\autor{}{}
\autori{}{}
\autorii{}{}
\autoriii{}{}
\autoriv{}{}
\autorv{}{}
\setcounter{liczbaAutorow}{0}
\usepackage{afterpage}

\newcommand{\autorZAlbumem}[2]{\begin{minipage}{0.45\textwidth}\centering{\Large\bfseries #1}\\[2mm]\ifmyclass@en Student’s book no.\else Nr albumu:\fi\ #2\end{minipage}\ }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Wersja angielska
\ifmyclass@en
	\renewcommand\maketitle{%
	  \begin{titlepage}%
		\let\footnotesize\small
		\let\footnoterule\relax
		\let \footnote \thanks
		\begin{center}%
		  {\LARGE\textbf{University of Warsaw}\\
		  Interdisciplinary Centre for Mathematical\\and Computational Modelling\par}
		  \vspace{1cm plus .5fill} 
		{
			\setlength{\parindent}{0em}
			\setlength{\baselineskip}{60pt}
			\centering

			\ifx\@imienazwisko\empty\else\autorZAlbumem{\@imienazwisko}{\@album}\fi
			\ifx\@imienazwiskoi\empty\else\autorZAlbumem{\@imienazwiskoi}{\@albumi}\fi
			\ifx\@imienazwiskoii\empty\else\autorZAlbumem{\@imienazwiskoii}{\@albumii}\fi
			\ifx\@imienazwiskoiii\empty\else\autorZAlbumem{\@imienazwiskoiii}{\@albumiii}\fi
			\ifx\@imienazwiskoiv\empty\else\autorZAlbumem{\@imienazwiskoiv}{\@albumiv}\fi
			\ifx\@imienazwiskov\empty\else\autorZAlbumem{\@imienazwiskov}{\@albumv}\fi
			
		}
			
		  \vspace{8mm plus .5fill}
		  {\Huge\textbf{\@title}\par}
		  \vspace{8mm plus .1fill}
		  {\large\bf \@rodzajpracy\ thesis\\[3pt]
		  field of study \MakeUppercase{\@kierunek} \\
	%----zakres---
			\@zakres \par}
		  \vspace{2cm plus 1.5fill}
		  \begin{flushright}\large
			\begin{tabular}{l}
				The thesis written under the supervision of:\\
			  \@opiekun
			\end{tabular}
		  \end{flushright}
		  \vspace{1cm plus 1fill}
		  {\large \@date\par}
		\end{center}
		\@thanks
	  \end{titlepage}%
	  \begin{titlepage}
		\c@page=2
		\large
		\null
		\vfill

		\noindent\textbf{\Large Oświadczenie kierującego pracą}
		  \vspace{4mm}
		  
		  \noindent Oświadczam, że niniejsza praca została przygotowana pod moim
		  kierunkiem i stwierdzam, że spełniła ona warunki
		  do przedstawienia jej w postępowaniu o nadanie tytułu\break zawodowego.
	   \vspace{4mm}
	   
	   Data \hfill Podpis kierującego pracą 
	   
	   \vspace{2cm}	

	   \noindent\textbf{\Large Statement of the Supervisor on Submission of the Thesis}
		  \vspace{4mm}
		
		\noindent I hereby certify that the thesis submitted has been prepared
		under my supervision and I declare that it satisfies the requirements
		of submission in the proceedings for the award of a degree.

	   \vspace{4mm}
	   
	   Date \hfill Supervisor's signature

	   \vspace{2cm}
	   \noindent\textbf{\Large Oświadczenie autora pracy}
		\vspace{4mm}
		
	   \noindent \'{S}wiadom odpowiedzialności prawnej oświadczam, że niniejsza praca dyplomowa została 
	   napisana przeze mnie samodzielnie i nie zawiera treści uzyskanych w sposób niezgodny 
	   z obowiązującymi przepisami. \\
	   Oświadczam również, że przedstawiona praca nie była 
	   wcześniej przedmiotem procedur związanych z uzyskaniem tytułu zawodowego w wyższej uczelni.\\
	   Oświadczam ponadto, że niniejsza wersja pracy jest identyczna z załączoną wersją elektroniczną. 
	   \vspace{4mm}
	   
	   Data \hfill \ifnum\theliczbaAutorow=1 Podpis autora\else Podpisy autorów\fi\ pracy
	   
	   \vspace{2cm}
	   \noindent\textbf{\Large \ifnum\theliczbaAutorow=1 Statement of the Author's on Submission of the Thesis\else Statement of the Authors' on Submission of the Thesis\fi}
		\vspace{4mm}
		
		\noindent Aware of legal liability I certify that the thesis
		submitted has been prepared by myself and does not include
		information gathered contrary to the law.\\
		I also declare that the thesis submitted has not been
		the subject of proceedings resulting in the award of a university degree.\\
		Furthermore I certify that the submitted version
		of the thesis is identical with its attached electronic version. 
	\vspace{4mm}
	   
	   Date \hfill \ifnum\theliczbaAutorow=1 Author's signature\else Authors' signatures\fi
		\vspace{1cm}

	%\end{hyphenrules}
	  \end{titlepage}

	  \setcounter{footnote}{0}%
	  \global\let\thanks\relax
	  \global\let\maketitle\relax
	  \global\let\@thanks\@empty
	  \global\let\@author\@empty
	  \global\let\@date\@empty
	  \global\let\@title\@empty
	  \global\let\title\relax
	  \global\let\author\relax
	  \global\let\date\relax
	  \global\let\and\relax
	}
	\def\nralbumu#1{\gdef\@nralbumu{#1}}
	\def\@nralbumu{???\ClassError{pracamgr}{Brak numeru albumu}\@ehc}
	\def\kierunek#1{\gdef\@kierunek{#1}}
	\def\@kierunek{???\ClassError{pracamgr}{Nie podano kierunku studiow}\@ehc}
	%----zakres nie konieczny-----
	\def\zakres#1{\gdef\@zakres{w zakresie \MakeUppercase{#1}}}
	\def\@zakres{}
	\def\opiekun#1{\gdef\@opiekun{#1}}
	\def\@opiekun{???\ClassError{pracamgr}{Brak danych opiekuna pracy}\@ehc}
	\def\keywords#1{\gdef\@keywords{#1}}
	\def\@keywords{???\ClassError{pracamgr}{Brak slow kluczowych}\@ehc}
	\def\dziedzina#1{\gdef\@dziedzina{#1}}
	\def\@dziedzina{???\ClassError{pracamgr}{Brak dziedziny Socrates-Erasmus}\@ehc}
	\def\klasyfikacja#1{\gdef\@klasyfikacja{#1}}
	\def\@klasyfikacja{???\ClassError{pracamgr}{Brak klasyfikacji tematycznej}\@ehc}
	%-------------------nowe------------
	%\def\tytulang#1{\gdef\@tytulang{#1}}
	%\def\@tytulang{???\ClassError{pracamgr}{Brak tytulu po angielsku}\@ehc}
	\def\titlepl#1{\gdef\@titlepl{#1}}
	\def\@titlepl{???\ClassError{pracamgr}{Brak tytulu po polski}\@ehc}

	\renewenvironment{abstract}{%


	  \titlepage
	  
	  \null\nobreak\vfil
	  \@beginparpenalty\@lowpenalty
	  \begin{center}%

		\bfseries\large \abstractname
		\@endparpenalty\@M
	  \end{center}}%
	{\par 
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Keywords
		\@endparpenalty\@M
	  \end{center}
	  \@keywords\par
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Area of study (codes according to Erasmus Subject Area Codes List)
		\@endparpenalty\@M
	  \end{center}
	   \@dziedzina\par
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Subject classification
		\@endparpenalty\@M
	  \end{center}
	  \@klasyfikacja\par
	  \vspace*{26pt}%
	  \begin{center}%
		\begingroup
		\bfseries\large The title of the thesis in Polish\\
		\@endparpenalty\@M
		\endgroup
		\medskip
		\@titlepl\par

	  \end{center}
	  \vspace*{26pt}%
	%-------------------nowosc----------------
	\nobreak\vfil\null\endtitlepage}
	

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
    \hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

\renewcommand*\@seccntformat[1]{\csname the#1\endcsname.\enspace}
\def\numberline#1{\hb@xt@\@tempdima{#1.\hfil}}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\mdseries
      \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
      \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Wersja polska  
\else

	\renewcommand\maketitle{%
	  \begin{titlepage}%
		\let\footnotesize\small
		\let\footnoterule\relax
		\let \footnote \thanks
		\begin{center}%
		  {\LARGE\textbf{Uniwersytet Warszawski}\\
			Interdyscyplinarne Centrum Modelowania Matematycznego i Komputerowego\par}
		  \vspace{1cm plus .5fill}
		{
			\setlength{\parindent}{0em}
			%\setlength{\baselineskip}{60pt}
			\centering

				\ifx\@imienazwisko\empty\else\autorZAlbumem{\@imienazwisko}{\@album}\fi
				\ifx\@imienazwiskoi\empty\else\autorZAlbumem{\@imienazwiskoi}{\@albumi}\fi
				\ifx\@imienazwiskoii\empty\else\autorZAlbumem{\@imienazwiskoii}{\@albumii}\fi
				\ifx\@imienazwiskoiii\empty\else\autorZAlbumem{\@imienazwiskoiii}{\@albumiii}\fi
				\ifx\@imienazwiskoiv\empty\else\autorZAlbumem{\@imienazwiskoiv}{\@albumiv}\fi
				\ifx\@imienazwiskov\empty\else\autorZAlbumem{\@imienazwiskov}{\@albumv}\fi
			
		}
			
		  \vspace{8mm plus .5fill}
		  {\Huge\textbf{\@title}\par}
		  \vspace{8mm plus .1fill}
		  {\large\bf Praca \@rodzajpracy\\[3pt]
			na kierunku \MakeUppercase{\@kierunek} \\
	%----zakres---
			\@zakres \par}
		  \vspace{2cm plus 1.5fill}
		  \begin{flushright}\large
			\begin{tabular}{l}
			  Praca wykonana pod kierunkiem\\
			  \bfseries \@opiekun
			\end{tabular}
		  \end{flushright}
		  \vspace{1cm plus 1fill}
		  {\large \@date\par}
		\end{center}
		\@thanks
	  \end{titlepage}%
	  \begin{titlepage}
		\c@page=2
		\large
		\null
		\vfill
		
	   \textbf{\Large Oświadczenie kierującego pracą }
		  \vspace{10mm}
		  
	   Potwierdzam, że niniejsza praca została przygotowana pod moim 
	   kierunkiem i kwalifikuje się do przedstawienia jej w postępowaniu 
	   o nadanie tytułu zawodowego. 
	   \vspace{15mm}
	   
	   Data \hfill Podpis kierującego pracą 
	   
	   \vspace{3cm}
	   \textbf{\Large Oświadczenie autora (autorów) pracy}
		\vspace{10mm}
		
	   \'{S}wiadom odpowiedzialności prawnej oświadczam, że niniejsza praca dyplomowa została 
	   napisana przeze mnie samodzielnie i nie zawiera treści uzyskanych w sposób niezgodny 
	   z obowiązującymi przepisami.
	   
	   Oświadczam również, że przedstawiona praca nie była 
	   wcześniej przedmiotem procedur związanych z uzyskaniem tytułu zawodowego w wyższej uczelni. 
	   
	   Oświadczam ponadto, że niniejsza wersja pracy jest identyczna z załączoną wersją elektroniczną. 
	   \vspace{15mm}
	   
	   Data \hfill \ifnum\theliczbaAutorow=1 Podpis autora\else Podpisy autorów\fi\ pracy
		\vspace{4cm}
	  \end{titlepage}
	  \setcounter{footnote}{0}%
	  \global\let\thanks\relax
	  \global\let\maketitle\relax
	  \global\let\@thanks\@empty
	  \global\let\@author\@empty
	  \global\let\@date\@empty
	  \global\let\@title\@empty
	  \global\let\title\relax
	  \global\let\author\relax
	  \global\let\date\relax
	  \global\let\and\relax
	}
	\def\nralbumu#1{\gdef\@nralbumu{#1}}
	\def\@nralbumu{???\ClassError{pracamgr}{Brak numeru albumu}\@ehc}
	\def\kierunek#1{\gdef\@kierunek{#1}}
	\def\@kierunek{???\ClassError{pracamgr}{Nie podano kierunku studiow}\@ehc}
	%----zakres nie konieczny-----
	\def\zakres#1{\gdef\@zakres{w zakresie \MakeUppercase{#1}}}
	\def\@zakres{}
	\def\opiekun#1{\gdef\@opiekun{#1}}
	\def\@opiekun{???\ClassError{pracamgr}{Brak danych opiekuna pracy}\@ehc}
	\def\keywords#1{\gdef\@keywords{#1}}
	\def\@keywords{???\ClassError{pracamgr}{Brak slow kluczowych}\@ehc}
	\def\dziedzina#1{\gdef\@dziedzina{#1}}
	\def\@dziedzina{???\ClassError{pracamgr}{Brak dziedziny Socrates-Erasmus}\@ehc}
	\def\klasyfikacja#1{\gdef\@klasyfikacja{#1}}
	\def\@klasyfikacja{???\ClassError{pracamgr}{Brak klasyfikacji tematycznej}\@ehc}
	%-------------------nowe------------
	%\def\tytulang#1{\gdef\@tytulang{#1}}
	%\def\@tytulang{???\ClassError{pracamgr}{Brak tytulu po angielsku}\@ehc}


	\renewenvironment{abstract}{%
	  \titlepage
	  \null\nobreak\vfil
	  \@beginparpenalty\@lowpenalty
	  \begin{center}%
		\bfseries\large \abstractname
		\@endparpenalty\@M
	  \end{center}}%
	{\par  
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Słowa kluczowe
		\@endparpenalty\@M
	  \end{center}
	  \@keywords\par
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Dziedzina pracy (kody wg programu Socrates-Erasmus)
		\@endparpenalty\@M
	  \end{center}
	   \@dziedzina\par
	  \vspace*{26pt}%
	  \begin{center}%
		\bfseries\large Klasyfikacja tematyczna
		\@endparpenalty\@M
	  \end{center}
	  \@klasyfikacja\par
	  \vspace*{26pt}%
	%-------------------nowosc----------------
%	  \begin{center}%
%		\bfseries\large Tytuł pracy w języku angielskim
%		\@endparpenalty\@M
%	  \end{center}
%	  \@tytulang\par
	  \nobreak\vfil\null\endtitlepage\cleardoublepage}

	\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
		\hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

	\renewcommand*\@seccntformat[1]{\csname the#1\endcsname.\enspace}
	\def\numberline#1{\hb@xt@\@tempdima{#1.\hfil}}
	\renewcommand*\l@chapter[2]{%
	  \ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\vskip 1.0em \@plus\p@
		\setlength\@tempdima{1.5em}%
		\begingroup
		  \parindent \z@ \rightskip \@pnumwidth
		  \parfillskip -\@pnumwidth
		  \leavevmode \bfseries
		  \advance\leftskip\@tempdima
		  \hskip -\leftskip
		  #1\nobreak\mdseries
		  \leaders\hbox{$\m@th
			\mkern \@dotsep mu\hbox{.}\mkern \@dotsep
			mu$}\hfill
		  \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
		  \penalty\@highpenalty
		\endgroup
	  \fi}

\fi

\endinput
