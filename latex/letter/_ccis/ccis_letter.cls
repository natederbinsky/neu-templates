
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ccis_letter}[2017/11/10 CCIS Letter Class]

\LoadClass[11pt]{article}

\RequirePackage[margin=0.8in]{geometry}
\RequirePackage{multirow}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{fancyhdr}

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\setlength\parindent{0pt}

%%

\newcommand{\myOpen}{To Whom It May Concern:}
\newcommand{\myClose}{%
Professor Foo-Bar \\
Associate Teaching Professor, College of Computer and Information Science \\
Phone: (617) 373-1234 \\
E-Mail: foo.bar@northeastern.edu
}

\newcommand{\mySchoolLogo}{_ccis}
\newcommand{\mySchoolInfo}{360 Huntington Avenue\hspace{5pt}\textbar\hspace{5pt}202 WVH\hspace{5pt}\textbar\hspace{5pt}Boston, Massachusetts 02115\hspace{5pt}\textbar\hspace{5pt}www.ccis.northeastern.edu}

\newcommand{\open}[1]{
	\renewcommand{\myOpen}{#1}
}

\newcommand{\close}[1]{
	\renewcommand{\myClose}{#1}
}

\newcommand{\signature}[1]{
	\vspace{#1}
	\myClose
}

\newcommand{\info}[1]{
	\renewcommand{\mySchoolInfo}{#1}
}

%%

\renewcommand{\maketitle}{
	\includegraphics[width=4in]{\mySchoolLogo}
	\vspace{0.3in} \\
	\myOpen \\
	
	\pagestyle{fancy}
	\lhead{}
	\chead{}
	\rhead{}
	\lfoot{}
	\cfoot{\small{\textsf{\mySchoolInfo}}}
	\rfoot{}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}

\AtBeginDocument{\maketitle}
