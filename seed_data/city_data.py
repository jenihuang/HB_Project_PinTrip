import csv

# chose top travel cities below to extract from 15000 cities file
selected = ['Aukland', 'Wellington', 'Cozumel', 'Queenstown', 'Reno', 'Napa', 'Monterey', 'Tucson', 'Jerusalem', 'Muscat', 'Odessa', 'Memphis', 'Vancouver', 'Chengdu', 'Phoenix', 'Quebec', 'Qingdao', 'Busan', 'Shanghai', 'Port Elizabeth', 'Brussels', 'Kingston', 'Calgary', 'Jaipur', 'Amsterdam', 'Cancun', 'Dallas', 'Portland', 'Leicester', 'Delhi', 'Birmingham', 'Las Vegas', 'El Paso', 'Hiroshima', 'Shenzhen', 'Detroit', 'Port-au-Prince', 'Baghdad', 'Guatemala City', 'Milan', 'Mexico City', 'Sydney', 'Sao Paulo', 'Saint Petersburg', 'Padang', 'San Jose', 'Adelaide', 'Madrid', 'Tunis', 'Rio de Janeiro', 'Tainan', 'Jakarta', 'Chicago', 'Brooklyn', 'Guilin', 'Hong Kong', 'Islamabad', "Xi'an", 'Columbus', 'Kyoto', 'Perth', 'Ottawa', 'Mecca', 'Manhattan', 'Hanoi', 'Genoa', 'Baltimore', 'Fort Worth', 'Lagos', 'Salvador', 'Havana', 'Cairo', 'Da Nang', 'Chongqing', 'Jeddah', 'Dublin', 'Abu Dhabi', 'Jeonju', 'Austin', 'Ho Chi Minh City', 'Jacksonville', 'Colombo', 'Pyongyang', 'Brisbane', 'Kobe', 'San Francisco', 'Kawasaki',
            'Kathmandu', 'Denpasar', 'Dalian', 'Chennai', 'Singapore', 'Dakar', 'Giza', 'Malang', 'Bangkok', 'Osaka', 'Nanjing', 'Tijuana', 'Charlotte', 'Bristol', 'San Diego', 'Sapporo', 'Stockholm', 'Alexandria', 'Queens', 'Philadelphia', 'Montreal', 'Johannesburg', 'Houston', 'Barcelona', 'Incheon', 'Washington, D.C.', 'Taipei', 'Gold Coast', 'Liverpool', 'Vienna', 'Lima', 'Dubai', 'Guangzhou', 'Tokyo', 'Mumbai', 'Buenos Aires', 'Tangshan', 'Naples', 'Nottingham', 'Milwaukee', 'Hyderabad', 'Dhaka', 'Seoul', 'New York City', 'Munich', 'Albuquerque', 'Berlin', 'Budapest', 'Mandalay', 'Beijing', 'Prague', 'Macau', 'Winnipeg', 'Wuhan', 'Lijiang', 'Moscow', 'Melbourne', 'Chiba', 'Karachi', 'Oklahoma City', 'Athens', 'Istanbul', 'Toronto', 'London', 'Warsaw', 'Manila', 'Nashville', 'Oslo', 'Lisbon', 'Casablanca', 'Seattle', 'Boston', 'Los Angeles', 'Tianjin', 'Copenhagen', 'Rome', 'Indianapolis', 'Cape Town', 'Edmonton', 'Denver', 'Yokohama', 'Paris']

# create seed data file for selected travel cities
with open('cities15000.csv', newline='', encoding='ISO-8859-1') as f:
    reader = csv.reader(f)
    results = ''
    for row in reader:
        if row[2] in selected:
            #name, long, lat, country, population, timezone
            new = f'{row[2]}|{row[4]}|{row[5]}|{row[8]}|{row[14]}|{row[-2]}\n'
            results += new
    #pasted results in cities.txt
    print(results)
