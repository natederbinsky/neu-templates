import os

PDF = '../dossier.pdf'
NAME = 'Nate Derbinsky'

files = {
    18: 'CV',
    24: 'Teaching Statement',
    25: 'TRACE Summary',
    28: 'Professional Development and Research Statement',
    30: 'Service Statement',
    31: 'Performance Reviews',
    39: 'List of Supporting Materials in Appendices',
    261: 'Appendix A',
    492: 'Appendix B',
    545: 'Appendix C',
}

# 

os.system('python2 splitPDF.py {} {}'.format(PDF, " ".join([str(k) for k in files])))

pdf_path, pdf_fname = os.path.split(PDF)
pdf_name, pdf_ext = os.path.splitext(pdf_fname)

outname_prefix = NAME.replace(' ', '_')
keys = list(files.keys())

for i,page in enumerate(keys):
    old = 1
    if i != 0:
        old = keys[i - 1] + 1
    
    old_fname = "{}.part{}.{}_{}.pdf".format(pdf_name, i+1, old, page)
    new_fname = '"{}_{}.pdf"'.format(outname_prefix, files[keys[i]])

    os.system('mv {} {}'.format(old_fname, new_fname))
