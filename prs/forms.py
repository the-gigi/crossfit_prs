from django import forms
from prs.models import Activity, Score
#from django.contrib.auth.models import User
from django.forms.extras.widgets import SelectDateWidget
from django.forms.fields import DateField

from datetime import date

# Can insert workout up to 3 years in back
this_year = date.today().year
YEARS = [str(y) for y in xrange(this_year - 3, this_year + 1)]

class ActivityForm(forms.ModelForm):
    class Meta(object):
        model = Activity

class ScoreForm(forms.ModelForm):
    class Meta(object):
        model = Score

    def __init__(self, *args, **kwargs):
        super(ScoreForm, self).__init__(*args, **kwargs)
        self.fields['when'].widget = SelectDateWidget(years=YEARS)


