
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neu_schedule}[2018/01/02 NEU Extended Schedule Class]

\LoadClass[11pt]{article}

\RequirePackage[margin=0.8in]{geometry}
\RequirePackage{multirow}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{xcolor}
\RequirePackage{colortbl}
\RequirePackage{hhline}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{varwidth}

%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\setlength\parindent{0pt}
\thispagestyle{empty}

%%

\author{Professor Smith}
\date{Fall \the\year}
\newcommand{\myInstitution}{Northeastern University}

%%

\renewcommand{\maketitle}{

	\vspace*{-1.0cm}
	\begin{center}
		\includegraphics[width=0.7in]{_neu} \\
		\LARGE \myInstitution \\
		\Large \@author \\
		\Large \@date
	\end{center}

	\begin{tabular*}{1.0\textwidth}{ l l }
		& \\
		\hline
		& \\
	\end{tabular*}

}

\AtBeginDocument{\maketitle}

%%

\definecolor{Class}{gray}{0.9}
\definecolor{OfficeHours}{HTML}{F6CED8}
\definecolor{Away}{HTML}{F2F5A9}
\definecolor{Clear}{HTML}{FFFFFF}

\newcounter{ScheduleWeekCounter}

\newenvironment{ScheduleWeek}{

\newcommand\set[4]{%
  \csdef{##1_##2_##3}{##4}}

\newcommand\get[3]{%
  \csuse{##1_##2_##3}}

% 1=day, 2=time, 3=text, 4=slots, 5=color
\newcommand{\slot}[5]{

	\set{t}{##1}{##2}{##3}
	\set{c}{##1}{##2}{##5}
	\set{s}{##1}{##2}{##4}

	\setcounter{ScheduleWeekCounter}{##2}
	\addtocounter{ScheduleWeekCounter}{-##4}
	\stepcounter{ScheduleWeekCounter}

	\whiledo{\value{ScheduleWeekCounter}<##2}{%
		\set{c}{##1}{\theScheduleWeekCounter}{##5}
		\stepcounter{ScheduleWeekCounter}
	}

}

\newcommand{\slotclear}[2]{
	\slot{##1}{##2}{}{1}{Clear}
}

\newcommand{\slotclass}[4]{
	\slot{##1}{##2}{##3}{##4}{Class}
}

\newcommand{\slotoffice}[4]{
	\slot{##1}{##2}{##3}{##4}{OfficeHours}
}

\newcommand{\slotaway}[4]{
	\slot{##1}{##2}{##3}{##4}{Away}
}

\newcommand{\tcVIIIam}{1}
\newcommand{\tcVIIIamH}{2}
\newcommand{\tcIXam}{3}
\newcommand{\tcIXamH}{4}
\newcommand{\tcXam}{5}
\newcommand{\tcXamH}{6}
\newcommand{\tcXIam}{7}
\newcommand{\tcXIamH}{8}
\newcommand{\tcXIIpm}{9}
\newcommand{\tcXIIpmH}{10}
\newcommand{\tcIpm}{11}
\newcommand{\tcIpmH}{12}
\newcommand{\tcIIpm}{13}
\newcommand{\tcIIpmH}{14}
\newcommand{\tcIIIpm}{15}
\newcommand{\tcIIIpmH}{16}
\newcommand{\tcIVpm}{17}
\newcommand{\tcIVpmH}{18}
\newcommand{\tcVpm}{19}
\newcommand{\tcVpmH}{20}
\newcommand{\tcVIpm}{21}
\newcommand{\tcVIpmH}{22}
\newcommand{\tcVIIpm}{23}
\newcommand{\tcVIIpmH}{24}
\newcommand{\tcVIIIpm}{25}
\newcommand{\tcVIIIpmH}{26}



\slotclear{m}{1}
\slotclear{m}{2}
\slotclear{m}{3}
\slotclear{m}{4}
\slotclear{m}{5}
\slotclear{m}{6}
\slotclear{m}{7}
\slotclear{m}{8}
\slotclear{m}{9}
\slotclear{m}{10}
\slotclear{m}{11}
\slotclear{m}{12}
\slotclear{m}{13}
\slotclear{m}{14}
\slotclear{m}{15}
\slotclear{m}{16}
\slotclear{m}{17}
\slotclear{m}{18}
\slotclear{m}{19}
\slotclear{m}{20}
\slotclear{m}{21}
\slotclear{m}{22}
\slotclear{m}{23}
\slotclear{m}{24}
\slotclear{m}{25}
\slotclear{m}{26}
\slotclear{t}{1}
\slotclear{t}{2}
\slotclear{t}{3}
\slotclear{t}{4}
\slotclear{t}{5}
\slotclear{t}{6}
\slotclear{t}{7}
\slotclear{t}{8}
\slotclear{t}{9}
\slotclear{t}{10}
\slotclear{t}{11}
\slotclear{t}{12}
\slotclear{t}{13}
\slotclear{t}{14}
\slotclear{t}{15}
\slotclear{t}{16}
\slotclear{t}{17}
\slotclear{t}{18}
\slotclear{t}{19}
\slotclear{t}{20}
\slotclear{t}{21}
\slotclear{t}{22}
\slotclear{t}{23}
\slotclear{t}{24}
\slotclear{t}{25}
\slotclear{t}{26}
\slotclear{w}{1}
\slotclear{w}{2}
\slotclear{w}{3}
\slotclear{w}{4}
\slotclear{w}{5}
\slotclear{w}{6}
\slotclear{w}{7}
\slotclear{w}{8}
\slotclear{w}{9}
\slotclear{w}{10}
\slotclear{w}{11}
\slotclear{w}{12}
\slotclear{w}{13}
\slotclear{w}{14}
\slotclear{w}{15}
\slotclear{w}{16}
\slotclear{w}{17}
\slotclear{w}{18}
\slotclear{w}{19}
\slotclear{w}{20}
\slotclear{w}{21}
\slotclear{w}{22}
\slotclear{w}{23}
\slotclear{w}{24}
\slotclear{w}{25}
\slotclear{w}{26}
\slotclear{h}{1}
\slotclear{h}{2}
\slotclear{h}{3}
\slotclear{h}{4}
\slotclear{h}{5}
\slotclear{h}{6}
\slotclear{h}{7}
\slotclear{h}{8}
\slotclear{h}{9}
\slotclear{h}{10}
\slotclear{h}{11}
\slotclear{h}{12}
\slotclear{h}{13}
\slotclear{h}{14}
\slotclear{h}{15}
\slotclear{h}{16}
\slotclear{h}{17}
\slotclear{h}{18}
\slotclear{h}{19}
\slotclear{h}{20}
\slotclear{h}{21}
\slotclear{h}{22}
\slotclear{h}{23}
\slotclear{h}{24}
\slotclear{h}{25}
\slotclear{h}{26}
\slotclear{f}{1}
\slotclear{f}{2}
\slotclear{f}{3}
\slotclear{f}{4}
\slotclear{f}{5}
\slotclear{f}{6}
\slotclear{f}{7}
\slotclear{f}{8}
\slotclear{f}{9}
\slotclear{f}{10}
\slotclear{f}{11}
\slotclear{f}{12}
\slotclear{f}{13}
\slotclear{f}{14}
\slotclear{f}{15}
\slotclear{f}{16}
\slotclear{f}{17}
\slotclear{f}{18}
\slotclear{f}{19}
\slotclear{f}{20}
\slotclear{f}{21}
\slotclear{f}{22}
\slotclear{f}{23}
\slotclear{f}{24}
\slotclear{f}{25}
\slotclear{f}{26}

}{

	\begin{tabular}{ | m{2.5cm} | m{2.5cm} | m{2.5cm} | m{2.5cm} | m{2.5cm} | m{2.5cm} | }
	\hline
	& \centering \textbf{Monday} & \centering \textbf{Tuesday} & \centering \textbf{Wednesday} & \centering \textbf{Thursday} & \centering \textbf{Friday}
	\tabularnewline
	\hhline{*{6}{-}}

	\multicolumn{1}{|r|}{\textbf{8:00 AM}} & \centering \multirow{-\get{s}{m}{1}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{1}}{\get{t}{m}{1}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{1}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{1}}{\get{t}{t}{1}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{1}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{1}}{\get{t}{w}{1}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{1}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{1}}{\get{t}{h}{1}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{1}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{1}}{\get{t}{f}{1}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{8:30 AM}} & \centering \multirow{-\get{s}{m}{2}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{2}}{\get{t}{m}{2}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{2}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{2}}{\get{t}{t}{2}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{2}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{2}}{\get{t}{w}{2}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{2}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{2}}{\get{t}{h}{2}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{2}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{2}}{\get{t}{f}{2}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{9:00 AM}} & \centering \multirow{-\get{s}{m}{3}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{3}}{\get{t}{m}{3}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{3}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{3}}{\get{t}{t}{3}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{3}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{3}}{\get{t}{w}{3}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{3}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{3}}{\get{t}{h}{3}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{3}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{3}}{\get{t}{f}{3}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{9:30 AM}} & \centering \multirow{-\get{s}{m}{4}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{4}}{\get{t}{m}{4}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{4}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{4}}{\get{t}{t}{4}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{4}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{4}}{\get{t}{w}{4}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{4}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{4}}{\get{t}{h}{4}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{4}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{4}}{\get{t}{f}{4}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{10:00 AM}} & \centering \multirow{-\get{s}{m}{5}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{5}}{\get{t}{m}{5}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{5}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{5}}{\get{t}{t}{5}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{5}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{5}}{\get{t}{w}{5}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{5}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{5}}{\get{t}{h}{5}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{5}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{5}}{\get{t}{f}{5}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{10:30 AM}} & \centering \multirow{-\get{s}{m}{6}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{6}}{\get{t}{m}{6}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{6}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{6}}{\get{t}{t}{6}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{6}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{6}}{\get{t}{w}{6}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{6}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{6}}{\get{t}{h}{6}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{6}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{6}}{\get{t}{f}{6}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{11:00 AM}} & \centering \multirow{-\get{s}{m}{7}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{7}}{\get{t}{m}{7}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{7}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{7}}{\get{t}{t}{7}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{7}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{7}}{\get{t}{w}{7}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{7}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{7}}{\get{t}{h}{7}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{7}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{7}}{\get{t}{f}{7}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{11:30 AM}} & \centering \multirow{-\get{s}{m}{8}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{8}}{\get{t}{m}{8}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{8}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{8}}{\get{t}{t}{8}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{8}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{8}}{\get{t}{w}{8}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{8}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{8}}{\get{t}{h}{8}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{8}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{8}}{\get{t}{f}{8}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{12:00 PM}} & \centering \multirow{-\get{s}{m}{9}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{9}}{\get{t}{m}{9}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{9}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{9}}{\get{t}{t}{9}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{9}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{9}}{\get{t}{w}{9}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{9}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{9}}{\get{t}{h}{9}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{9}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{9}}{\get{t}{f}{9}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{12:30 PM}} & \centering \multirow{-\get{s}{m}{10}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{10}}{\get{t}{m}{10}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{10}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{10}}{\get{t}{t}{10}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{10}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{10}}{\get{t}{w}{10}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{10}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{10}}{\get{t}{h}{10}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{10}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{10}}{\get{t}{f}{10}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{1:00 PM}} & \centering \multirow{-\get{s}{m}{11}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{11}}{\get{t}{m}{11}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{11}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{11}}{\get{t}{t}{11}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{11}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{11}}{\get{t}{w}{11}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{11}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{11}}{\get{t}{h}{11}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{11}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{11}}{\get{t}{f}{11}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{1:30 PM}} & \centering \multirow{-\get{s}{m}{12}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{12}}{\get{t}{m}{12}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{12}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{12}}{\get{t}{t}{12}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{12}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{12}}{\get{t}{w}{12}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{12}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{12}}{\get{t}{h}{12}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{12}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{12}}{\get{t}{f}{12}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{2:00 PM}} & \centering \multirow{-\get{s}{m}{13}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{13}}{\get{t}{m}{13}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{13}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{13}}{\get{t}{t}{13}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{13}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{13}}{\get{t}{w}{13}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{13}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{13}}{\get{t}{h}{13}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{13}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{13}}{\get{t}{f}{13}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{2:30 PM}} & \centering \multirow{-\get{s}{m}{14}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{14}}{\get{t}{m}{14}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{14}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{14}}{\get{t}{t}{14}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{14}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{14}}{\get{t}{w}{14}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{14}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{14}}{\get{t}{h}{14}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{14}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{14}}{\get{t}{f}{14}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{3:00 PM}} & \centering \multirow{-\get{s}{m}{15}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{15}}{\get{t}{m}{15}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{15}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{15}}{\get{t}{t}{15}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{15}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{15}}{\get{t}{w}{15}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{15}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{15}}{\get{t}{h}{15}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{15}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{15}}{\get{t}{f}{15}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{3:30 PM}} & \centering \multirow{-\get{s}{m}{16}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{16}}{\get{t}{m}{16}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{16}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{16}}{\get{t}{t}{16}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{16}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{16}}{\get{t}{w}{16}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{16}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{16}}{\get{t}{h}{16}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{16}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{16}}{\get{t}{f}{16}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{4:00 PM}} & \centering \multirow{-\get{s}{m}{17}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{17}}{\get{t}{m}{17}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{17}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{17}}{\get{t}{t}{17}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{17}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{17}}{\get{t}{w}{17}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{17}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{17}}{\get{t}{h}{17}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{17}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{17}}{\get{t}{f}{17}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{4:30 PM}} & \centering \multirow{-\get{s}{m}{18}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{18}}{\get{t}{m}{18}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{18}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{18}}{\get{t}{t}{18}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{18}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{18}}{\get{t}{w}{18}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{18}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{18}}{\get{t}{h}{18}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{18}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{18}}{\get{t}{f}{18}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{5:00 PM}} & \centering \multirow{-\get{s}{m}{19}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{19}}{\get{t}{m}{19}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{19}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{19}}{\get{t}{t}{19}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{19}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{19}}{\get{t}{w}{19}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{19}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{19}}{\get{t}{h}{19}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{19}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{19}}{\get{t}{f}{19}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{5:30 PM}} & \centering \multirow{-\get{s}{m}{20}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{20}}{\get{t}{m}{20}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{20}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{20}}{\get{t}{t}{20}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{20}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{20}}{\get{t}{w}{20}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{20}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{20}}{\get{t}{h}{20}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{20}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{20}}{\get{t}{f}{20}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{6:00 PM}} & \centering \multirow{-\get{s}{m}{21}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{21}}{\get{t}{m}{21}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{21}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{21}}{\get{t}{t}{21}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{21}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{21}}{\get{t}{w}{21}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{21}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{21}}{\get{t}{h}{21}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{21}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{21}}{\get{t}{f}{21}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{6:30 PM}} & \centering \multirow{-\get{s}{m}{22}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{22}}{\get{t}{m}{22}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{22}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{22}}{\get{t}{t}{22}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{22}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{22}}{\get{t}{w}{22}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{22}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{22}}{\get{t}{h}{22}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{22}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{22}}{\get{t}{f}{22}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{7:00 PM}} & \centering \multirow{-\get{s}{m}{23}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{23}}{\get{t}{m}{23}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{23}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{23}}{\get{t}{t}{23}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{23}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{23}}{\get{t}{w}{23}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{23}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{23}}{\get{t}{h}{23}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{23}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{23}}{\get{t}{f}{23}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{7:30 PM}} & \centering \multirow{-\get{s}{m}{24}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{24}}{\get{t}{m}{24}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{24}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{24}}{\get{t}{t}{24}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{24}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{24}}{\get{t}{w}{24}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{24}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{24}}{\get{t}{h}{24}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{24}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{24}}{\get{t}{f}{24}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{8:00 PM}} & \centering \multirow{-\get{s}{m}{25}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{25}}{\get{t}{m}{25}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{25}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{25}}{\get{t}{t}{25}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{25}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{25}}{\get{t}{w}{25}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{25}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{25}}{\get{t}{h}{25}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{25}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{25}}{\get{t}{f}{25}}}\end{varwidth}} \tabularnewline \hhline{-}
	\multicolumn{1}{|r|}{\textbf{8:30 PM}} & \centering \multirow{-\get{s}{m}{26}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{m}{26}}{\get{t}{m}{26}}}\end{varwidth}} & \centering \multirow{-\get{s}{t}{26}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{t}{26}}{\get{t}{t}{26}}}\end{varwidth}} & \centering \multirow{-\get{s}{w}{26}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{w}{26}}{\get{t}{w}{26}}}\end{varwidth}} & \centering \multirow{-\get{s}{h}{26}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{h}{26}}{\get{t}{h}{26}}}\end{varwidth}} & \centering \multirow{-\get{s}{f}{26}}{*}{\begin{varwidth}{2.45cm}\centering \small \textbf{\cellcolor{\get{c}{f}{26}}{\get{t}{f}{26}}}\end{varwidth}} \tabularnewline \hhline{-}

	\hhline{*{6}{-}}

\end{tabular}

}
