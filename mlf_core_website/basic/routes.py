from flask import render_template, redirect, url_for

from mlf_core_website.basic import bp


@bp.route('/')
def root():
    return redirect((url_for('basic.index')))


@bp.route('/index')
def index():
    return render_template('index.html')


@bp.route('/templates')
def dev():
    return render_template('templates.html')


@bp.route('/join')
def join():
    return render_template('join.html')


@bp.route('/about')
def about():
    return render_template('about.html')


@bp.route('/code_of_conduct')
def code_of_conduct():
    return render_template('code_of_conduct.html')


@bp.route('/projects')
def projects():
    return render_template('projects.html')
