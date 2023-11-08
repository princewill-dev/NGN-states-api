from django.core.management.base import BaseCommand
from stateapi.models import LocalGovernment, City

class Command(BaseCommand):
    help = 'Populate database with Nigerian cities'

    def handle(self, *args, **options):
        data = {
            'Aba North': ['City1', 'City2', 'City3'],
            'Aba South': ['City1', 'City2', 'City3'],
            # Add the rest of the LGAs and their cities here...
        }

        for lga_name, cities in data.items():
            lga = LocalGovernment.objects.get(name=lga_name)
            for city_name in cities:
                City.objects.create(name=city_name, local_government=lga)

        self.stdout.write(self.style.SUCCESS('Successfully populated cities'))