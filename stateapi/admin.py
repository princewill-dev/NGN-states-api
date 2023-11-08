from django.contrib import admin

# Register your models here.
from .models import State, LocalGovernment
from django.urls import reverse
from django.utils.html import format_html
from .models import State, LocalGovernment



# class LocalGovernmentInline(admin.TabularInline):
#     model = LocalGovernment

# class StateAdmin(admin.ModelAdmin):
#     inlines = [
#         LocalGovernmentInline,
#     ]

admin.site.register(State)
admin.site.register(LocalGovernment)