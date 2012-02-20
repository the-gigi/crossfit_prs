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

import json
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
    order_by = request.GET.get('order_by', '-when')
    scores = Score.objects.filter(user=request.user.id).order_by(order_by)
    offset = request.GET.get('offset', None)
    limit =  request.GET.get('limit', None)
    prev_link = None
    next_link = None

    #from dbgp.client import brk; brk(port=9019)
    if offset and limit:
        count = scores.count()
        offset = int(offset)
        limit = int(limit)
        chunk = limit - offset
        scores = scores[offset:limit]

        link_mask = '/prs/all/?offset=%d&limit=%d&order_by=' + order_by
        if offset + limit < count - 1:
            next_offset = offset + chunk
            next_link = link_mask % (next_offset, next_offset + chunk)

        if offset > 0:
            prev_offset = max(offset - chunk, 0)
            prev_link = link_mask % (prev_offset, prev_offset + chunk)

    #scores = sorted(scores, key=lambda s: s.activity.name)
    return render_to_response('all.html',
                              dict(scores=scores,
                                   prev_link=prev_link,
                                   next_link=next_link),
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
    return render_to_response('all.html',
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
def new_activity(request):
    form = ActivityForm(request.POST or None)
    if not form.is_valid():
        return render_to_response('new_activity.html',
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
def new_score(request):
    form = ScoreForm(request.POST or None)

    # Dynamically add a JSON dict which maps activity name to activity type
    # This will allow new_score.js to display the relevant fields on
    # the form when a particular activity is selected. Note the 'activities'
    # field is not defined in the ScoreForm and is added on the fly.
    activities = Activity.objects.all()
    form.activities = {}
    for a in activities:
        form.activities[a.name] = a.scoreType

    form.activities = json.dumps(form.activities);
    if not form.is_valid():
        return render_to_response('new_score.html',
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
