from django.shortcuts import render
from django.shortcuts import render, redirect
from django.views import View
from rest_framework import generics
from .models import State
from .serializers import StateSerializer


class HomePageView(View):
    def get(self, request, *args, **kwargs):
        return redirect('https://princewilldev.com')
    


class StateListView(generics.ListAPIView):
    queryset = State.objects.all()
    serializer_class = StateSerializer