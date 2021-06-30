#!/usr/bin/env python

from distutils.core import setup

setup(name='neutemplates',
      version='0.1',
      description='Northeastern Static Website Generator',
      author='Nate Derbinsky',
      author_email='n.derbinsky@northeastern.edu',
      url='https://derbinsky.info',
      packages=['neutemplates'],
      install_requires=['Jinja2', 'jinja2-highlight', 'MarkupSafe', 'Pygments'],
     )
