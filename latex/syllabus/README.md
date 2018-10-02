Syllabus
========
A syllabus class combining components of the CoS template and other sources.

## Usage
See the example **syllabus.tex** document.

1. `\documentclass{neu_syllabus}`
2. ...
3. `\prof{ **your first name here** }{ **your last name here** }`
4. `\date{ **semester designation here** }`
5. `\course{ **college name here** }{ **course code here** }{ **course title here** }`
6. ...
7. `\begin{document}`
8. ... (see below)
9. `\end{document}`

### Info box
To create an info box, use the `SyllabusHeader` environment:

1. `\begin{SyllabusHeader}`
2. `\topic{ **name** }{ **text** }`
3. ...
4. `\end{SyllabusHeader}`

Within text, use the `\topicEndline` command to create a new line.

For convenience, several shortcut topics have been created:

* `\instructor`: uses the information from `\prof` to indicate the instructor name
* `\office{ **location** }{ **notes** }`: provides office information
* `\contact{ **phone** }{ **e-mail** }{ **web** }`: provides contact information

### Section
To create a new section, use the `\SyllabusSection` command:

`\SyllabusSection{ **name** }`

This will provide consistent formatting to the section header.

### Books
To create a section that is _only_ a list of books, use the `\SyllabusBooks` environment:

1. `\begin{SyllabusBooks}{ **Section Name** }`
2. `\book{ **text** }`
3. `\bookInfo{ **Author** }{ **Title** }{ **Edition Number** }{ **Publisher** }{ **Year** }{ **ISBN-13** }`
4. ...
5. `\end{SyllabusBooks}`

The `\book` command is basically a list item. The `\bookInfo` command provides consistent formatting. Both can be used as many times as desired. The environment itself comprises the section, so do not precede with a section heading.

### Schedule
To create a convenient topic schedule _within_ a section, use the `\SyllabusSchedule}` environment:

1. `\begin{SyllabusSchedule}[ **optional extra padding here** ]`
2. `\week{ **Topic** }{ **Reading** }{ **Notes/Assignments** }`
3. ...
4. `\end{SyllabusSchedule}`

The extra padding argument provides vertically centered space in every row and is optional for aesthetic control.

The `\week` command can be used as many times as necessary, and it provides an automatic counter of how many weeks have been entered. New line commands (`\\`) may be used within any of the three arguments to vertically separate the resulting text.

### Sections with Pre-filled Contents
Use the following commands, if you wish, to have sections created automatically:

* `\SyllabusClassroomEnvironment`
