from django.core.management.base import BaseCommand
from stateapi.models import State

class Command(BaseCommand):
    help = 'Populate database with Nigerian states'

    def handle(self, *args, **options):
        states = [
            'Abia', 'Adamawa', 'Akwa Ibom', 'Anambra', 'Bauchi',
            'Bayelsa', 'Benue', 'Borno', 'Cross River', 'Delta',
            'Ebonyi', 'Edo', 'Ekiti', 'Enugu', 'Gombe', 'Imo',
            'Jigawa', 'Kaduna', 'Kano', 'Katsina', 'Kebbi', 'Kogi',
            'Kwara', 'Lagos', 'Nasarawa', 'Niger', 'Ogun', 'Ondo',
            'Osun', 'Oyo', 'Plateau', 'Rivers', 'Sokoto', 'Taraba',
            'Yobe', 'Zamfara', 'FCT'
        ]

        for state_name in states:
            State.objects.create(name=state_name)

        self.stdout.write(self.style.SUCCESS('Successfully populated states'))