from django.conf.urls.defaults import patterns, url

urlpatterns = patterns('',
    url(r'^$', 'prs.views.home'),
    url(r'^home/$', 'prs.views.home'),
    url(r'^(?P<score_id>\d+)/$', 'prs.views.detail'),
    url(r'^(?P<activity_id>\d+)/history/$', 'prs.views.history'),
    url(r'^(?P<activity_id>\d+)/pr/$', 'prs.views.pr'),
    url(r'^all/$', 'prs.views.all'),
    url(r'^all_prs/$', 'prs.views.all_prs'),
    url(r'^about/$', 'prs.views.about'),
    url(r'^create_activity/$', 'prs.views.create_activity'),
    url(r'^create_score/$', 'prs.views.create_score'),
    url(r'^new_account/$', 'prs.views.new_account'),
)
