from django.db import models
from django.utils import timezone

class User(models.Model):
    id = models.BigIntegerField(primary_key=True)
    joined_date = models.DateField(auto_now_add=True)
    registration_date = models.DateField(blank=True, null=True)
    name = models.TextField()
    email = models.EmailField()
    is_guest=models.BooleanField()

    def save(self, *args, **kwargs):
        self.is_guest = self.registration_date is None
        super(User, self).save(*args, **kwargs)

    def __str__(self):
        return self.name


class Task(models.Model):
    id = models.BigAutoField(primary_key=True)

    def __str__(self):
        return self.id       

class Event(models.Model):
    id = models.BigAutoField(primary_key=True)
    time = models.DateTimeField(auto_now_add=True)
    action_id = models.PositiveSmallIntegerField()
    target = models.ForeignKey(Task, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    
    def __str__(self):
        return self.id     