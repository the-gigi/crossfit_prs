from django.conf.urls.defaults import patterns, include, url
from django.contrib.auth.views import login, logout
from django.contrib import admin
import prs.urls

admin.autodiscover()

urlpatterns = patterns('',
    url(r'^prs/', include(prs.urls)),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^registration/login/$',  login),
    url(r'^registration/logout/$', logout),
)
