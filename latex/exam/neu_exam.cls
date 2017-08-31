
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neu_exam}[2017/8/31 NEU Exam Class]

\LoadClass[11pt]{article}

\RequirePackage[margin=0.8in]{geometry}
\RequirePackage{multirow}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{etoolbox}
\RequirePackage{xspace}
\RequirePackage{ifthen}
\RequirePackage{calc}

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%%

\setlength\parindent{0pt}

%%

\author{Professor Smith}
\date{Fall \the\year}
\title{Exam}

\newcommand{\myInstitution}{Northeastern University}
\newcommand{\myCourseCode}{CS10000}
\newcommand{\myCourseTitle}{Intro to Computing}

\newcommand{\course}[2]{
	\renewcommand{\myCourseCode}{#1}
	\renewcommand{\myCourseTitle}{#2}
}

%%

\newcounter{mySolution}
\setcounter{mySolution}{0}

\newcommand{\MakeSolution}{\setcounter{mySolution}{1}}
\newcommand{\IfSolution}{\ifnum\value{mySolution}=1}

\newcommand{\Answer}[1]{
    \IfSolution
    \textbf{#1}
    \fi
}

%%

\newcommand\set[3]{%
  \csdef{#1_#2}{#3}}
  
\newcommand\get[2]{%
  \csuse{#1_#2}}
  
\newcounter{i}
  
%%

\newcounter{ctrInstructions}

\newcommand{\ExamInstruction}[1]{
	\stepcounter{ctrInstructions}
	\set{instr}{\thectrInstructions}{#1}
}

%%

\newcounter{ctrProblems}
\newcounter{totalPoints}
\newcounter{ctrDefinitions}

\newcommand{\addp}[3]{
	\stepcounter{ctrProblems}
	\addtocounter{totalPoints}{#3}
	\set{prob}{\thectrProblems}{#1}
	\set{points}{\thectrProblems}{#2}
}

\newcommand{\ProblemDeclaration}[2]{
	\addp{#1}{#2}{#2}
}

\newcommand{\BonusDeclaration}[2]{
	\addp{#1}{#2}{0}
}

%%

\newenvironment{ProblemDefinition}[1][]{

	\newpage
	\stepcounter{ctrDefinitions}
	
	\section*{(\get{points}{\thectrDefinitions} pts.) \sc \get{prob}{\thectrDefinitions}}
	
	\ifthenelse{\equal{#1}{}}{}{
		\textit{#1}
		\vspace{1.0cm}
	}
	
}{}

\newcommand{\Blank}[1]{\line(1,0){#1}}

\newcommand{\BlankText}[1]{%
	\setlength{\unitlength}{\widthof{#1}}%
	\line(1,0){1}
}

%%

\def\and{&\xspace}

\renewcommand{\maketitle}{

	\vspace*{-1.0cm}
	\begin{center}
		\includegraphics[width=0.7in]{_neu} \\
		\Large \myInstitution \\
		\Large {\myCourseCode} -- {\myCourseTitle} \\
		\Large {\@date}, {\@author} \\
		\vspace{0.5cm}
		\LARGE \textbf{\@title} \IfSolution \textbf{(SOLUTION)} \fi \\
		\vspace{1.5cm}
	\end{center}
	
	\thispagestyle{empty}
	\pagestyle{myheadings}
	\markright{\textit{{\myCourseCode, \@date, \@author} -- {\@title} \IfSolution (SOLUTION) \fi}}
	
	Name: \line(1,0){275} \\
	\vspace{1.0cm}
	
	%%
	
	\begin{tabular}{ | p{8.0cm} | p{3.0cm} r | }
		\hline
		\centering \textbf{Problem} & \multicolumn{2}{c|}{\textbf{Points}} \tabularnewline \hline \hline
		
		\setcounter{i}{1}
		\whiledo{\numexpr\value{i}-1< \value{ctrProblems}}{
			\sc \get{prob}{\thei} \and \and /\get{points}{\thei} \tabularnewline \hline
			\stepcounter{i}
		}
		
		&& \tabularnewline
		\textbf{Total} && \multicolumn{1}{ r | }{ /\arabic{totalPoints} } \tabularnewline
		&& \tabularnewline \hline

	\end{tabular}
	\vspace{2.0cm}
	
	%%
	
	\ifthenelse{\value{ctrInstructions}>0}{
		
		\section*{Instructions}
		\begin{itemize}
		
			\setcounter{i}{1}
			\whiledo{\numexpr\value{i}-1< \value{ctrInstructions}}{
				\item{\get{instr}{\thei}}
				\stepcounter{i}
			}
			
		\end{itemize}
		
	}{}
	
}

\AtBeginDocument{\maketitle}
