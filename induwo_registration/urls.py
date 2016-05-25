from django.conf.urls import url
from django.conf.urls import patterns, url
from induwo_registration import views

urlpatterns = [
    url(r'^$', views.custom_login),
    url(r'^login/', views.custom_login),
    url(r'^register/$',
        views.RegistrationView.as_view(),
        name='registration_register'),
    url(r'^profile/$',
        views.ProfileView.as_view(),
        name='registration_profile'),    
]