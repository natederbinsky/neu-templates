from pygments import highlight
from pygments.lexers import get_lexer_by_name
from pygments.formatters import HtmlFormatter
from markupsafe import Markup
import base64

# creates highlighted source code based upon a
# lexer name (or instance) and formatter options
def code(source, lexer, formatOpts={}):
    return Markup(highlight(
        source,
        get_lexer_by_name(lexer) if isinstance(lexer, str) else lexer,
        HtmlFormatter(**formatOpts)
    ))

# creates an image tag for inline representation
# given its type (e.g., png, gif), either base64 data
# or file name, and optional attributes
def inline_img(type, b64_data=None, img_fname=None, attrs={}):
    if (b64_data and img_fname) or (not b64_data and not img_fname):
        return None

    if not b64_data and img_fname:
        with open(img_fname, "rb") as img_f:
            b64_data = base64.b64encode(img_f.read())

    return Markup('<img src="data:image/{};base64, {}" {}/>'.format(
        type, b64_data.decode('ascii'), 
        "" if not attrs else '{} '.format(' '.join(['{}="{}"'.format(k, v) for k,v in attrs.items()]))))

# creates an anchor tag targeted to a new window;
# provides for the ability to override the link text,
# title, and whether it's in a new window
def link(url, text=None, new_window=True, title=""):
    return Markup('<a href="{}"{} title="{}">{}</a>'.format(
        url,
        ' target="_blank"' if new_window else '',
        title,
        text if text else url
    ))

# creates an e-mail anchor;
# provides for the ability to override the link text and title
def email(address, text=None, title=""):
    return link('mailto:{}'.format(address), text if text else address, title=title)

# creates a list of items, ordered or not
def lst(items, ordered):
    return Markup('<{sep}>{contents}</{sep}>'.format(sep='ol' if ordered else 'ul', contents=''.join('<li>{}</li>'.format(el) for el in items)))

# creates an unordered list of items supplied
# as arguments
def ulist(*items):
    return lst(items=items, ordered=False)

# creates an ordered list of items supplied
# as arguments
def olist(*items):
    return lst(items=items, ordered=True)
