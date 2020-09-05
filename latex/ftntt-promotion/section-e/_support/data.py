import statistics

# 'CS 2500' : 'Fundamentals of Computer Science 1'
courses = {
    'CS 5200': 'Database Management Systems',
    'CS 6220': 'Data Mining Techniques',
    'DS 5230': 'Unsupervised Machine Learning and Data Mining',
    'CS 2500': 'Fundamentals of Computer Science 1',
    'CS 3200': 'Database Design',
    'CS 4500': 'Software Development',
    'DS 2000': 'Programming with Data',
    'DS 2001': 'Data Science Programming Practicum',
}

###

# 'Term-Year-Code': Avg
dept_means = {
    'Fall-2017-CS': 4.3,
    'Fall-2017-DS': 4.4,
    'Spring-2018-CS': 4.3,
    'Fall-2018-CS': 4.3,
    'Fall-2018-DS': 4.4,
    'Spring-2019-DS': 4.3,
    'Fall-2019-CS': 4.3,
    'Spring-2020-DS': 4.5,
}

def course_comparison(course, term, year):
    global dept_means

    key = "{}-{}-{}".format(term, year, course.split()[0])

    return dept_means[key]

###

sections = []

# course ~ 'CS 2500'
# term ~ 'Fall'
# year ~ 2018
# num_responded ~ 65
# num_students ~ 90
# instr_mean ~ 4.7
# reg ~ True/False
# eval ~ "Stuff"
def add_section(course, term, year, num_responded, num_students, instr_mean, reg=True, eval="no"):
    global sections
    global courses

    assert(num_responded <= num_students)
    assert(1.0 <= instr_mean <= 5.0)

    sections.append({
        'num': course,
        'title': courses[course],
        'term': term,
        'year': year,
        'num_responded': num_responded,
        'num_students': num_students,
        'instr_mean': instr_mean,
        'compare_mean': course_comparison(course, term, year),
        'reg': reg,
        'eval': eval
    })

###

def summary_table():
    global sections

    for s in sections:
        fs = "{} & {} & {} & {} & {} & {} & {} \\\\ \\hline"
        result = fs.format(s['num'], s['title'], "{} {}".format(s['term'], s['year']), 
                           "{} / {}".format(s['num_responded'], s['num_students']),
                           "{} / {}".format(s['instr_mean'], s['compare_mean']),
                           ("R" if s['reg'] else "E"),
                           s['eval'])
        print(result)

def chart_data():
    global sections

    terms = []
    for s in sections:
        term = (s['term'], s['year'])
        if term not in terms:
            terms.append(term)

    for t in terms:
        term_sections = [s for s in sections if s['term'] == t[0] and s['year'] == t[1]]

        term_scores = [ts['instr_mean'] for ts in term_sections]
        compare_scores = [ts['compare_mean'] for ts in term_sections]
        
        fs = '"{}", {:.2f}, {:.2f}, {}, {}'
        print(fs.format("{} {}".format(t[0], t[1]), statistics.mean(term_scores), statistics.mean(compare_scores), min(term_scores), max(term_scores)))

def stats():
    global sections

    trace = [s['instr_mean'] for s in sections]

    print("N={}, min={}, max={}, mean={:.3f}, stdev={:.3f}, median={:.3f}".format(len(trace), min(trace), max(trace), statistics.mean(trace), statistics.stdev(trace), statistics.median(trace)))


#####

add_section(
    course='CS 5200',
    term='Fall',
    year=2017,
    num_responded=66,
    num_students=72,
    instr_mean=4.8
)

add_section(
    course='CS 6220',
    term='Fall',
    year=2017,
    num_responded=41,
    num_students=46,
    instr_mean=4.7
)

add_section(
    course='DS 5230',
    term='Fall',
    year=2017,
    num_responded=12,
    num_students=12,
    instr_mean=4.7
)

# 

add_section(
    course='CS 2500',
    term='Spring',
    year=2018,
    num_responded=45,
    num_students=68,
    instr_mean=4.8
)

add_section(
    course='CS 3200',
    term='Spring',
    year=2018,
    num_responded=50,
    num_students=61,
    instr_mean=4.7
)

add_section(
    course='CS 4500',
    term='Spring',
    year=2018,
    num_responded=27,
    num_students=31,
    instr_mean=4.3
)

# 

add_section(
    course='CS 2500',
    term='Fall',
    year=2018,
    num_responded=59,
    num_students=114,
    instr_mean=4.8
)

add_section(
    course='CS 2500',
    term='Fall',
    year=2018,
    num_responded=53,
    num_students=99,
    instr_mean=4.9
)

add_section(
    course='DS 2000',
    term='Fall',
    year=2018,
    num_responded=28,
    num_students=52,
    instr_mean=4.6
)

add_section(
    course='DS 2001',
    term='Fall',
    year=2018,
    num_responded=15,
    num_students=43,
    instr_mean=4.3
)

# 

add_section(
    course='DS 2000',
    term='Spring',
    year=2019,
    num_responded=5,
    num_students=8,
    instr_mean=4.8
)

# 

add_section(
    course='CS 2500',
    term='Fall',
    year=2019,
    num_responded=55,
    num_students=109,
    instr_mean=4.7
)

add_section(
    course='CS 2500',
    term='Fall',
    year=2019,
    num_responded=56,
    num_students=111,
    instr_mean=4.8
)

# 

add_section(
    course='DS 2000',
    term='Spring',
    year=2020,
    num_responded=9,
    num_students=12,
    instr_mean=5.0
)

#####

# summary_table()
# chart_data()
stats()
