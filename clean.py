import csv
import re

fieldnames = ['county', 'city', 'address', 'date']

with open("clan-lab-ok-edit.txt", "r") as f:

    with open('clan-lab-ok.csv', 'w') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()

        for line in f:
            json = {}
            county = re.search(r"\w+\s\s", line)
            date = re.search(r"\d{1,2}\/\d{1,2}\/\d{4}", line)

            if date:
                json['date'] = date.group()
            else:
                json['date'] = ''

            if county:
                json['county'] = line[:county.end()].strip()
            else:
                json['county'] = ''

            city = re.search(r"\w+\s\s", line[county.end():])

            if city:
                json['city'] = line[county.end():city.end() + county.end()].strip()
                address = re.search(r"\w+\s\s", line[city.end() + county.end():])
            else:
                json['city'] = ''
                address = 0

            if address:
                json['address'] = line[city.end() + county.end():city.end() + county.end() + address.end()].strip()
            else:
                json['address'] = ''

            writer.writerow(json)
