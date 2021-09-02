
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neu_syllabus}[2018/9/28 NEU Syllabus Class]

\LoadClass[11pt]{article}

\RequirePackage[margin=0.8in]{geometry}
\RequirePackage{multirow}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{titlesec}
\RequirePackage{color}
\RequirePackage{hyperref}
\RequirePackage{pbox}
\RequirePackage{array}
\RequirePackage{footnote}

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%%

\setlength\parindent{0pt}
\titleformat*{\section}{\large\bfseries}

%%

\date{Fall \the\year}

\newcommand{\myProfessorFirst}{Alice}
\newcommand{\myProfessorLast}{Smith}

\newcommand{\myInstitution}{Northeastern University}
\newcommand{\myCollege}{College of Computer and Information Science}
\newcommand{\myCourseCode}{CS1000}
\newcommand{\myCourseTitle}{Intro to Computing}

\newcommand{\course}[3]{
	\renewcommand{\myCollege}{#1}
	\renewcommand{\myCourseCode}{#2}
	\renewcommand{\myCourseTitle}{#3}
}

\newcommand{\prof}[2]{
	\renewcommand{\myProfessorFirst}{#1}
	\renewcommand{\myProfessorLast}{#2}
}

%%

\renewcommand{\maketitle}{

	\vspace*{-1.6cm}
	\begin{center}
		\includegraphics[width=0.7in]{_neu} \\
		\Huge \myInstitution \\
		\LARGE {\myCollege} \\
		\vspace{0.5cm}
		\large { {\myCourseCode} -- {\myCourseTitle} } \\
		\large { \@date }
	\end{center}

	\thispagestyle{empty}
	\pagestyle{myheadings}
	\markright{\textit{{\myCourseCode, \@date, \myProfessorLast} -- Syllabus}}

}

\AtBeginDocument{\maketitle}

%%

\newenvironment{SyllabusHeader}{

\newcommand{\topicEndline}{ \\ & }

\newcommand{\topic}[2]{
& \\
\textbf{##1} & ##2 \\
}

\newcommand{\instructor}{\topic{Instructor}{{\myProfessorFirst} {\myProfessorLast}}}
\newcommand{\office}[2]{\topic{Office}{##1 \topicEndline ##2}}
\newcommand{\contact}[3]{\topic{Contact}{##1 \topicEndline \href{mailto:##2}{##2} \topicEndline \url{##3}}}

\begin{savenotes}
\begin{tabular*}{1.0\textwidth}{ l l }
& \\
\hline
}{
& \\
\hline
& \\
\end{tabular*}
\end{savenotes}
}

%%

\newcommand{\SyllabusSection}[1]{\section*{\uppercase{#1}:}}

%%

\newenvironment{SyllabusBooks}[1]{

\newcommand{\book}[1]{\item ##1}
\newcommand{\bookInfo}[6]{
	\book{{##1}. \textit{##2}, {##3} {ed}. {##4}, {##5} (ISBN-13: {##6})}
}

\SyllabusSection{#1}
\begin{itemize}
}
{
\end{itemize}
}

%%

\newcommand{\SyllabusClassroomEnvironment}{%
\SyllabusSection{Classroom Environment}
To create and preserve a classroom atmosphere that optimizes teaching and learning, all participants share a responsibility in creating a civil and non-disruptive forum for the discussion of ideas.
Students are expected to conduct themselves at all times in a manner that does not disrupt teaching or learning.
Your comments to others should be constructive and free from harassing statements.
You are encouraged to disagree with other students and the instructor, but such disagreements need to respectful and be based upon facts and documentation (rather than prejudices and personalities).
The instructor reserves the right to interrupt conversations that deviate from these expectations.
Repeated unprofessional or disrespectful conduct may result in a lower grade or more severe consequences.
Part of the learning process in this course is respectful engagement of ideas with others.

\subsection*{Title IX}

\textit{Title IX of the Education Amendments of 1972 protects individuals from sex or gender-based discrimination, including discrimination based on gender-identity, in educational programs and activities that receive federal financial assistance.}
\\

Northeastern’s Title IX Policy prohibits Prohibited Offenses, which are defined as sexual harassment, sexual assault, relationship or domestic violence, and stalking.
The Title IX Policy applies to the entire community, including male, female, transgender students, faculty and staff.
\\

If you or someone you know has been a survivor of a Prohibited Offense, confidential support and guidance can be found through University Health and Counseling Services staff\footnote{\url{https://www.northeastern.edu/uhcs}} and the Center for Spiritual Dialogue and Service clergy members\footnote{\url{https://www.northeastern.edu/spirituallife}}.
By law, those employees are not required to report allegations of sex or gender-based discrimination to the University.
\\

Alleged violations can be reported non-confidentially to the Title IX Coordinator within The Office for Gender Equity and Compliance at: \texttt{titleix@northeastern.edu} and/or through NUPD (Emergency 617.373.3333; Non-Emergency 617.373.2121).
Reporting Prohibited Offenses to NUPD does NOT commit the victim/affected party to future legal action.
\\

\underline{Faculty members are considered ``responsible employees''} at Northeastern University, meaning they are required to report all allegations of sex or gender-based discrimination to the Title IX Coordinator.
\\

In case of an emergency, please call 911.
\\

Please visit \texttt{https://www.northeastern.edu/titleix} for a complete list of reporting options and resources both on- and off-campus.

\subsection*{Students With Disabilities}

Students who have disabilities who wish to receive academic services and/or accommodations should visit the Disability Resource Center\footnote{\url{https://drc.sites.northeastern.edu}} at 20 Dodge Hall or call (617) 373-2675.
If you have already done so, please provide your letter from the DRC to the instructor early in the semester to arrange those accommodations.
}

%%

\newcounter{ScheduleWeek}

\newenvironment{SyllabusSchedule}[1][0.0cm]{

\newcommand{\week}[3]{
\stepcounter{ScheduleWeek}
\centering \small \arabic{ScheduleWeek} & \parbox{7.5cm}{\small ##1} & \parbox{3.5cm}{\centering \small ##2} & \parbox{4.0cm}{\small ##3} \\[#1] \hline
}

\setlength{\extrarowheight}{#1}
\begin{savenotes}
\begin{tabular}{ | p{1.0cm} | p{7.5cm} | p{3.5cm} | p{4.0cm} | }
\hline
\centering \textbf{Week} & \textbf{Topic} & \centering \textbf{Reading} & \textbf{Assignments/Notes} \\[#1]
\hline
}{
\end{tabular}
\end{savenotes}
}
