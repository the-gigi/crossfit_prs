from django.db import models
from django.contrib.auth.models import User
from datetime import date

# Weight units
UNITS = (
    ('LB',   'Pounds'),
    ('KG',   'Killograms'),
    ('Pood', 'Pood'),
)

SCORE_TYPES = (
    ('Rounds', 'Complete as many rounds as possible'),
    ('Reps', 'Complete as many repetitions as possible'),
    ('Weight', 'Lift as much weight as possible'),
    ('Time', 'Complete as fast as possible'),
)

class Activity(models.Model):
    class Meta:
        verbose_name_plural = 'activities'
    name = models.CharField(max_length=256)
    description = models.TextField(max_length=4096)
    weight = models.IntegerField(null=True, blank=True)
    unit = models.CharField(max_length=4, choices=UNITS, null=True, blank=True)
    reps = models.IntegerField(null=True, blank=True)
    time = models.TimeField(null=True, blank=True)
    scoreType = models.CharField(max_length=8,
                                 choices=SCORE_TYPES,
                                 verbose_name='Score Type')
    image = models.TextField(max_length=4096, null=True, blank=True)

    def __unicode__(self):
        return self.name


class ComparableMixin:
  def __eq__(self, other):
    return not self < other and not other < self
  def __ne__(self, other):
    return self < other or other < self
  def __gt__(self, other):
    return other < self
  def __ge__(self, other):
    return not self < other
  def __le__(self, other):
    return not other < self


class Tag(models.Model):
    tag = models.TextField(max_length=64, blank=True)
    user = models.ForeignKey(User)

    class Meta:
        unique_together = ('tag', 'user',)

class Score(models.Model, ComparableMixin):
    activity = models.ForeignKey(Activity)
    user = models.ForeignKey(User)
    when = models.DateField(default=date.today, blank=False)
    weight = models.IntegerField(null=True, blank=True)
    unit = models.CharField(max_length=4,
                            choices=UNITS,
                            null=True,
                            blank=True,
                            default='LB')
    reps = models.IntegerField(null=True, blank=True) # used for reps and rounds
    time = models.TimeField(null=True, blank=True)
    rx = models.BooleanField(default=True)
    comments = models.TextField(max_length=1024, null=True, blank=True)
    tags = models.ManyToManyField(Tag, null=True, blank=True)
    activity_name = property(lambda self: self.activity.name)
    activity_type = property(lambda self: self.activity.scoreType)

    @property
    def result(self):
        t = self.activity_type
        if t == 'Weight':
            return str(self.weight) + ' ' + self.unit
        elif t == 'Time':
            return str(self.time)
        elif t in ('Reps', 'Rounds'):
            return  str(self.reps)
        else:
            raise Exception('Unknown score type: ' + t)

    def __lt__(self, other):
        t = self.activity.scoreType
        if t == 'Weight':
            # Don't deal with unit conversions
            assert self.unit == other.unit
            return self.weight < other.weight
        elif t == 'Time':
            # A score is a lesser score if it took MORE time to complete
            return self.time > other.time
        elif t in ('Reps', 'Rounds'):
            return self.reps < other.reps
        else:
            raise Exception('Unknown score type: ' + t)

    def __unicode__(self):
        a = self.activity
        name = a.name
        if self.activity_type == "Reps":
            name = 'Max ' + name

        return name + ' - ' + self.result

    date_hierarchy = ['when']
