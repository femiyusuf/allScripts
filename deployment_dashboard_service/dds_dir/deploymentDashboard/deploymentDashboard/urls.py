"""deploymentDashboard URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from instanceInfo import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('add_deployment/', views.add_deployment, name='add_deployment'),    
    path('list_deployments/', views.list_deployments, name='list_deployments'),
    path('list_sample_table/', views.list_sample_table, name='list_sample_table'),
    path('list_deployments_tf/', views.list_deployments_tf, name='list_deployments_tf'),    
]

