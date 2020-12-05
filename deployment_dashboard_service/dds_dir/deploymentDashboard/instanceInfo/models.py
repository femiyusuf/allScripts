from django.db import models


class DeployedInstances(models.Model):
    MODULE_TYPES = [('FMV','FMV'),('GSM','GSM')]
    targetAppliance = models.CharField(max_length=100)
    moduleType = models.CharField(max_length=10, choices=MODULE_TYPES)
    version = models.CharField(max_length=20)
    services = models.TextField(blank=True)
    triggerer = models.CharField(max_length=100)
    timeStamp = models.DateTimeField()

    def __str__(self):
        return self.targetAppliance + ', ' + self.moduleType + ', ' + self.version + ', ' + self.triggerer + ', ' + str(self.timeStamp)
