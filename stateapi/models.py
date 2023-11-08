from django.db import models

class State(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name
    
class LocalGovernment(models.Model):
    name = models.CharField(max_length=100)
    state = models.ForeignKey(State, on_delete=models.CASCADE)

    def __str__(self):
        return self.name
    

# class City(models.Model):
#     name = models.CharField(max_length=100)
#     local_government = models.ForeignKey(LocalGovernment, on_delete=models.CASCADE)

#     def __str__(self):
#         return self.name