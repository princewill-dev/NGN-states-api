from django.urls import path
from . import views
# import home_view from views.py

urlpatterns = [
    path('', views.HomePageView.as_view(), name='homepage'),
    path('states/', views.StateListView.as_view(), name='state_list'),
    path('states/<str:state_name>/', views.LocalGovernmentListView.as_view(), name='lga_list'),
]
