from neu_templates import course, webutil

# list of files in custom subdirectory
pages = [
    'index.html',
    'policies.html',
    'notnav.html',
    'schedule.html',
]

# list of files relative to the custom subdirectory
# to be copied to an analogous location in destination
resources = [
    'readings/codd.pdf',
]

# map from navigation titles to valid files in pages
nav = {
    'Home': 'index.html',
    'Policies': 'policies.html',
    'Schedule': 'schedule.html',
}

# key in nav to home page
home = 'Home'

# arbitrary dictionary of data to supply to all pages during render
# (the following are required for this template)
data = {
}

##

def make_prof(name, img, email, web, phone, oh):
    img_fname = 'img/{}'.format(img)
    resources.append(img_fname)

    return {
        'name': name,
        'img': img_fname,
        'email': webutil.email(email),
        'web': webutil.link(web, title='Personal Site'),
        'phone': phone,
        'oh': oh,
    }

data['profs'] = [
    make_prof('Professor Smith', 'prof.jpg', 'prof.smith@northeastern.edu', 
              'https://northeastern.edu', '617-373-1234', 'Building 101, Tuesdays/Thursdays 5-6pm'),
]

def make_ta(name, img, email, oh):
    img_fname = 'img/{}'.format(img)
    resources.append(img_fname)

    return {
        'name': name,
        'img': img_fname,
        'email': webutil.email(email),
        'oh': oh,
    }

data['tas'] = [
    make_ta('Cecilia', 'cecilia.jpg', 'cecilia.ta@husky.neu.edu', 'TBD'),
    make_ta('Tajel', 'tajel.jpeg', 'tajel.ta@husky.neu.edu', 'TBD'),
]

#

letter_fail = 'F'
_lt = '&lt;'
_gte = '&ge;'

letters = ('A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-')
cutoffs = (95,   90,   87,  82,   80,   77,  72,  70,   67,   62,  60)

data['scale'] = [(l, '{} - '.format(n) if i==0 else '{} - {}{}'.format(n, _lt, cutoffs[i-1])) for i, (l, n) in enumerate(zip(letters, cutoffs))]
data['scale'].append((letter_fail, '{}{}{}'.format('&nbsp;' * 5, _lt, cutoffs[-1])))

#

_headers = ('Week', 'Topics', 'Reading (completed <em>prior to lecture</em>', 'Due (default=R@6pm,<br />late=F@6pm)')

def make_row(num, df, dt, topics, reading, due):
    return (
        '{}<br /><small>{} -<br />{}</small>'.format(num, df, dt), 
        topics, 
        reading, 
        due
    )

data['weeks'] = (
    # headers = ((name, style),...)
    tuple((h, 'text-align: center') for h in _headers),
    # column styles = ('',...)
    tuple('' if i % 2 == 1 else 'text-align: center' for i,h in enumerate(_headers)),
    # rows = (('',...),...)
    (
        make_row(1, 'Sep 9', 'Sep 11',
                 webutil.ulist(
                     'Course/Syllabus',
                     'DBMS/Architecture',
                     'Software: {}, {}, {}'.format(
                         webutil.link('https://www.apachefriends.org/download.html', 'XAMPP'),
                         webutil.link('https://sqlitebrowser.org', 'DB Browser for SQLite'),
                         webutil.link('https://github.com/lerocha/chinook-database/tree/master/ChinookDatabase/DataSources', 'Chinook')
                     )
                 ),
                 '1, 2',
                 ''),
        
        make_row(2, 'Sep 14', 'Sep 18',
                 webutil.ulist(
                     'Relational Data Model',
                     'Relational Algebra, DML {}'.format(webutil.ulist('SQL Reference')),
                 ),
                 '5, 6, 8, {}'.format(webutil.link('readings/codd.pdf', 'Codd')),
                 ''),

        make_row(3, 'Sep 21', 'Sep 25',
                 webutil.ulist(
                     "DML cont'd",
                     'DDL'
                 ),
                 '6, 7, Boyce',
                 webutil.ulist(
                     'HW1 (SELECT, RA)',
                 ))
    )
)

#

def _read_rkt(fname):
    with open(fname, 'r') as f:
        for _ in range(3):
            f.readline() # skips first three lines of metadata
        return f.read()

code1 = '''
; f : Number -> Number
; performs a mysterious operation to a number

(check-expect (f 1) 2)
(check-expect (f 2) 5)
(check-expect (f 3) 10)
(check-expect (f 4) 17)

(define (f x)
  (add1
   (* x x)))
'''.strip()

data['code1'] = webutil.code(code1, 'Racket')
data['code2'] = webutil.code(_read_rkt('_script_stuff/code.rkt'), 'Racket')
data['code3'] = webutil.code('print("Hello, World!")', 'Python')

#

data['img1'] = webutil.inline_img('png', img_fname='_script_stuff/logo.png', attrs={'class':'img-thumbnail', 'style':'width: 40%'})

##

course.build(
    site_dir='cs1000',
    destination='_out/cs1000',

    pages=pages,
    resources=resources,

    nav=nav,
    home=home,

    classNum='CS1000', 
    className='Intro to Things', 
    semester='Fall 2021', 
    section='Section 42',
    
    data=data,
    globals={},
)
