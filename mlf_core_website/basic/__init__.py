from flask import Blueprint

bp = Blueprint('basic', __name__)

from mlf_core_website.basic import routes  # noqa: E402, F401
