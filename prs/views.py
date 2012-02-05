from prs.models import Activity, Score
from prs.forms import ActivityForm, ScoreForm

from django.http import HttpResponse
from django.shortcuts import (render_to_response,
                              get_object_or_404)
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.template import RequestContext

import operator

def home(request):
    return render_to_response('home.html',
                              context_instance=RequestContext(request))

def new_account(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            new_user = form.save()
        if 'next' in request.POST:
            next = request.POST['next']
        else:
            next = reverse('prs.views.home')            
        return HttpResponseRedirect(next)
    else:
        form = UserCreationForm()
    return render_to_response('registration/register.html',
                              dict(form=form),
                              context_instance=RequestContext(request))

def about(request):
    """Provide general inormation about the application
    
    Doesn't require login
    """
    
    return render_to_response('about.html', 
                              context_instance=RequestContext(request))

@login_required
def all(request):
    # The '-when' means order by the 'when' field in descending order
    scores = Score.objects.filter(user=request.user.id).order_by('-when')
    scores = sorted(scores, key=lambda s: s.activity.name)
    return render_to_response('index.html',
                              dict(scores=scores),
                              context_instance=RequestContext(request))

@login_required
def detail(request, score_id):
    score = get_object_or_404(Score, pk=score_id)
    return render_to_response('detail.html',
                              dict(score=score),
                              context_instance=RequestContext(request))

@login_required
def history(request, activity_id):
    # The '-when' means order by the 'when' field in descending order
    scores = Score.objects.filter(user=request.user.id, activity__id=activity_id).order_by('-when')
    return render_to_response('index.html',
                              dict(scores=scores),
                              context_instance=RequestContext(request))

@login_required
def pr(request, activity_id):
    return HttpResponse("You're looking at the results of activity %s." % activity_id)

@login_required
def all_prs(request):
    def getBetter(s1, s2):
        if s1 is None:
            return s2
        if s2 is None:
            return s1

        assert s1.activity.id == s2.activity.id
        if s1.activity.scoreType == 'Time':
            return s1 if s1.time < s2.time else s2
        else:
            return s1 if s1 > s2 else s2

    ## Authentication
    u = request.user
    if not u.is_authenticated():
        return HttpResponseRedirect('/registration/login/?next=%s' % request.path)

    # The '-when' means order by the 'when' field in descending order
    scores = Score.objects.filter(user=request.user.id).order_by('-when')

    prs = dict()
    for score in scores:
        current = prs.get(score.activity_id, None)
        prs[score.activity_id] = getBetter(score, current)

    prs = prs.values()
    # Sort alphabetically by activity name
    prs.sort(key=lambda x: x.activity.name)

    return render_to_response('prs.html',
                              dict(prs=prs),
                              context_instance=RequestContext(request))

@login_required
def create_activity(request):
    form = ActivityForm(request.POST or None)
    if not form.is_valid():
        return render_to_response('create_activity.html',
                                  dict(form=form),
                                  context_instance=RequestContext(request))

    # Cool, form is valid go ahead and save the new activity
    activity = form.save(commit=False)

    # Populate/modify activity fields here if needed

    # Save new activity to DB
    activity.save()

    # Create a message for the user
    if request.user.is_authenticated():
        request.user.message_set.create(message='Your activity was created')

    # Redirect to next destination
    if 'next' in request.POST:
        next = request.POST['next']
    else:
        next = reverse('prs.views.all_prs')

    return HttpResponseRedirect(next)

@login_required
def create_score(request):
    form = ScoreForm(request.POST or None)
    if not form.is_valid():
        return render_to_response('create_score.html',
                                  dict(form=form),
                                  context_instance=RequestContext(request))

    # Cool, form is valid go ahead and save the new activity
    score = form.save(commit=False)

    # Populate/modify activity fields here if needed

    # Save new activity to DB
    score.save()

    # Create a message for the user
    if request.user.is_authenticated():
        request.user.message_set.create(message='Your score was created')

    # Redirect to next destination
    if 'next' in request.POST:
        next = request.POST['next']
    else:
        next = reverse('prs.views.all_prs')

    return HttpResponseRedirect(next)