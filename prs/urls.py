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
    url(r'^new_activity/$', 'prs.views.new_activity'),
    url(r'^new_score/$', 'prs.views.new_score'),
    url(r'^new_account/$', 'prs.views.new_account'),
)
