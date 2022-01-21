import os

from jinja2 import Environment, PackageLoader, select_autoescape, Template


def merge():
    env = Environment(
        loader=PackageLoader("api"),
        autoescape=select_autoescape()
    )
    path = os.path.dirname(os.path.realpath(__file__)) + "/templates/resume.html"
    with open (path, "r") as file:
        data = file.read().splitlines()
        template = Template(str(data))
        output = template.render(var1="variables", navigation=[])
        return output
