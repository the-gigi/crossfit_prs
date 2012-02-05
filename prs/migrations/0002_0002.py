# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding field 'Activity.image'
        db.add_column('prs_activity', 'image', self.gf('django.db.models.fields.TextField')(max_length=4096, null=True, blank=True), keep_default=False)


    def backwards(self, orm):
        
        # Deleting field 'Activity.image'
        db.delete_column('prs_activity', 'image')


    models = {
        'prs.activity': {
            'Meta': {'object_name': 'Activity'},
            'description': ('django.db.models.fields.TextField', [], {'max_length': '4096'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'image': ('django.db.models.fields.TextField', [], {'max_length': '4096', 'null': 'True', 'blank': 'True'}),
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
