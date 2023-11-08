from rest_framework import serializers
from .models import State
from .models import LocalGovernment

class StateSerializer(serializers.ModelSerializer):
    class Meta:
        model = State
        fields = ['name']


class LocalGovernmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = LocalGovernment
        fields = ['name']