from django.shortcuts import render
from django.shortcuts import render, redirect
from django.views import View
from rest_framework import generics
from .models import State
from .models import LocalGovernment
from .serializers import StateSerializer
from .serializers import LocalGovernmentSerializer
from django.http import Http404


class HomePageView(View):
    def get(self, request, *args, **kwargs):
        return redirect('https://princewilldev.com')
    


class StateListView(generics.ListAPIView):
    queryset = State.objects.all()
    serializer_class = StateSerializer


class LocalGovernmentListView(generics.ListAPIView):
    serializer_class = LocalGovernmentSerializer

    def get_queryset(self):
        state_name = self.kwargs['state_name']
        queryset = LocalGovernment.objects.filter(state__name=state_name)
        if not queryset.exists():
            raise Http404("Invalid state entered")
        
        return queryset