from django.shortcuts import render
from django.http import HttpResponse
from django.utils import timezone
import pytz
import datetime

from .models import DeployedInstances

def home(request):
    # Home view
    return HttpResponse('<p>Home View</p>')

# Adds entry for newly deployed instance to the DB
def add_deployment(request):
    if (request.method == 'POST'):
        requestMethod = request.method
        curlInstance =  DeployedInstances()
        curlInstance.targetAppliance = request.POST.get('targetAppliance')
        curlInstance.moduleType = request.POST.get('moduleType')
        curlInstance.version = request.POST.get('version')
        curlInstance.services = request.POST.get('services')
        curlInstance.triggerer = request.POST.get('triggerer')
        curlInstance.timeStamp = str(datetime.datetime.now(tz=timezone.utc))
        curlInstance.save()
        return HttpResponse('<p># In add_deployment function, Method is: POST</p> ')
    else:
        return HttpResponse('<p># In add_deployment function, Method is: GET. Method not supported</p> ')


# Queries the DB for the list of deployed instances 
def list_deployments(request):
    instances = DeployedInstances.objects.all()
    instances = DeployedInstances.objects.order_by('-timeStamp')
    return render(request, 'list_deployments.html', {'instances': instances, })

# Queries the DB for the list of deployed instances(Table filter version)
def list_sample_table(request):
    instances = DeployedInstances.objects.all()
    return render(request, 'list_sample_table.html', {'instances': instances, })

# Queries the DB for the list of deployed instances(Table filter version)
def list_deployments_tf(request):
    instances = DeployedInstances.objects.all()
    instances = DeployedInstances.objects.order_by('-timeStamp')    
    return render(request, 'list_deployments_ts.html', {'instances': instances, })
