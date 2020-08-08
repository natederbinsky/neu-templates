\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neu_ftntt_promotion}[2020/8/01 NEU FTNTT Promotion Class]

%%%%%

\newcommand{\baseFont}{12pt} % dossier specifies 12pt font
\newcommand{\baseMargin}{1.0in} % dossier specifies minimum 1-inch margin

%%%%%

\LoadClass[\baseFont]{article}

%%%

\RequirePackage[margin=\baseMargin]{geometry} % reasonable margins

\RequirePackage{pdfpages}
\includepdfset{pagecommand={}, pages=-} % put page numbers on included PDFs

\RequirePackage{bibentry}
\RequirePackage{tabularx}
\RequirePackage{lscape}
\RequirePackage{graphicx}

%%%%%

\setlength\parindent{0pt} % paragraphs don't indent
\setlength{\parskip}{\baseFont} % skip space between paragraphs

%%%

\renewcommand{\thesection}{\Alph{section}} % sections are capital letters

\counterwithin{page}{section} % restart page numbers within sections
\renewcommand{\thepage}{\thesection-\arabic{page}} % pages are S-#

%%%%%

% Start a new page,
% use the supplied section,
% start page at 1 instead of 0
\newcommand{\DossierSection}[2]{
    \newpage
    \setcounter{section}{#1}
    \section{#2}
    \stepcounter{page}
}

% Provides all the section names/letters

\newcommand{\SectionD} {
    \DossierSection{3}{Comprehensive Dossier Curriculum Vitae}
}

\newcommand{\SectionE} {
    \DossierSection{4}{Candidate's Statements and Supporting Evidence}
}

\newcommand{\SectionF} {
    \DossierSection{5}{Performance Reviews}
}

\newcommand{\SectionG} {
    \DossierSection{6}{Comprehensive List of Contents for Appendices}
}

\newcommand{\AppendixA}{
    \DossierSection{0}{Teaching Supporting Materials}
}

\newcommand{\AppendixB}{
    \DossierSection{1}{Professional Development and Scholarship}
}

\newcommand{\AppendixC}{
    \DossierSection{2}{Service}
}
