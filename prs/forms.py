from django import forms
from prs.models import Activity, Score
from django.contrib.auth.models import User

class ActivityForm(forms.ModelForm):
    class Meta(object):
        model = Activity

class ScoreForm(forms.ModelForm):
    class Meta(object):
        model = Score
    
