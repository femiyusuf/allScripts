# Generated by Django 3.0.3 on 2020-11-21 02:31

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='mirageInstance',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('moduleType', models.CharField(choices=[('F', 'FMV'), ('G', 'GSM')], max_length=1)),
                ('services', models.TextField(blank=True)),
                ('version', models.CharField(max_length=20)),
                ('targetAppliance', models.CharField(max_length=100)),
                ('triggerer', models.CharField(max_length=100)),
                ('timeStamp', models.DateTimeField()),
            ],
        ),
    ]
