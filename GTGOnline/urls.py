from django.conf.urls import patterns, include, url


# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^', include('demo.urls', namespace='demo')),
    
    url(r'^tasks/', include('Task_backend.urls', namespace='tasks')),
    url(r'^tags/', include('Tag_backend.urls', namespace='tags')),
    url(r'^user/', include('User_backend.urls', namespace='user')),
    url(r'^accounts/', include('User_backend.urls', namespace='user')),
    url(r'^groups/', include('Group_backend.urls', namespace='groups')),
    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)

from django.conf import settings

if settings.DEBUG:
    urlpatterns += patterns('', (r'^media\/(?P<path>.*)$',
                                 'django.views.static.serve',
                                 {'document_root': settings.STATIC_ROOT}),
                           )
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns
    urlpatterns += staticfiles_urlpatterns()
