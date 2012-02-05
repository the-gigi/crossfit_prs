# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'Activity'
        db.create_table('prs_activity', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=256)),
            ('description', self.gf('django.db.models.fields.TextField')(max_length=4096)),
            ('weight', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('unit', self.gf('django.db.models.fields.CharField')(max_length=4, null=True, blank=True)),
            ('reps', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('time', self.gf('django.db.models.fields.TimeField')(null=True, blank=True)),
            ('scoreType', self.gf('django.db.models.fields.CharField')(max_length=8)),
        ))
        db.send_create_signal('prs', ['Activity'])

        # Adding model 'Score'
        db.create_table('prs_score', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('activity', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['prs.Activity'])),
            ('user', self.gf('django.db.models.fields.IntegerField')()),
            ('when', self.gf('django.db.models.fields.DateField')()),
            ('weight', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('unit', self.gf('django.db.models.fields.CharField')(default='LB', max_length=4, null=True, blank=True)),
            ('reps', self.gf('django.db.models.fields.IntegerField')(null=True, blank=True)),
            ('time', self.gf('django.db.models.fields.TimeField')(null=True, blank=True)),
            ('rx', self.gf('django.db.models.fields.BooleanField')(default=True)),
            ('comments', self.gf('django.db.models.fields.TextField')(max_length=1024, null=True, blank=True)),
        ))
        db.send_create_signal('prs', ['Score'])


    def backwards(self, orm):
        
        # Deleting model 'Activity'
        db.delete_table('prs_activity')

        # Deleting model 'Score'
        db.delete_table('prs_score')


    models = {
        'prs.activity': {
            'Meta': {'object_name': 'Activity'},
            'description': ('django.db.models.fields.TextField', [], {'max_length': '4096'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '256'}),
            'reps': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'scoreType': ('django.db.models.fields.CharField', [], {'max_length': '8'}),
            'time': ('django.db.models.fields.TimeField', [], {'null': 'True', 'blank': 'True'}),
            'unit': ('django.db.models.fields.CharField', [], {'max_length': '4', 'null': 'True', 'blank': 'True'}),
            'weight': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'})
        },
        'prs.score': {
            'Meta': {'object_name': 'Score'},
            'activity': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['prs.Activity']"}),
            'comments': ('django.db.models.fields.TextField', [], {'max_length': '1024', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'reps': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rx': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'time': ('django.db.models.fields.TimeField', [], {'null': 'True', 'blank': 'True'}),
            'unit': ('django.db.models.fields.CharField', [], {'default': "'LB'", 'max_length': '4', 'null': 'True', 'blank': 'True'}),
            'user': ('django.db.models.fields.IntegerField', [], {}),
            'weight': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'when': ('django.db.models.fields.DateField', [], {})
        }
    }

    complete_apps = ['prs']
