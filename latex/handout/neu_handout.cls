
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neu_handout}[2017/8/04 NEU Handout Class]

\LoadClass[11pt]{article}

\RequirePackage[margin=0.8in]{geometry}
\RequirePackage{multirow}
\RequirePackage[pdftex]{graphicx}

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\setlength\parindent{0pt}

%%

\author{Professor Smith}
\title{Handout}
\date{Fall \the\year}

\newcommand{\myInstitution}{Northeastern University}
\newcommand{\myCourseCode}{CS1000}
\newcommand{\myCourseTitle}{Intro to Computing}
\newcommand{\mySchoolLogo}{_neu}

\newcommand{\course}[2]{
	\renewcommand{\myCourseCode}{#1}
	\renewcommand{\myCourseTitle}{#2}
}

%%

\renewcommand{\maketitle}{
	\begin{tabular}{ p{1.12cm} p{0.9\textwidth} }
		\multirow{3}{*}{\includegraphics[width=0.46in]{\mySchoolLogo}} & \textbf{\myInstitution} \\
			& {{\myCourseCode} -- {\myCourseTitle}} \\
			& {{\@date}, {\@author}}\\
	\end{tabular}

	\begin{tabular*}{1.0\textwidth}{ c }
    		\\ 
    		\hline
    		\\
	\end{tabular*}

	\begin{center}
		\LARGE{\@title}
	\end{center}
	
	\thispagestyle{empty}
	\pagestyle{myheadings}
	\markright{\textit{{\myCourseCode, \@date, \@author} -- {\@title}}}
}

\AtBeginDocument{\maketitle}
