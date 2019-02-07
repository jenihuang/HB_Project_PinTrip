import csv

selected = {'asciiname', 'Tucson', 'Jerusalem', 'Muscat', 'Odessa', 'Memphis', 'Vancouver', 'Chengdu', 'Phoenix', 'Quebec', 'Qingdao', 'Busan', 'Shanghai', 'Port Elizabeth', 'Brussels', 'Kingston', 'Calgary', 'Jaipur', 'Amsterdam', 'Cancun', 'Dallas', 'Portland', 'Leicester', 'Delhi', 'Birmingham', 'Las Vegas', 'El Paso', 'Hiroshima', 'Shenzhen', 'Detroit', 'Port-au-Prince', 'Baghdad', 'Guatemala City', 'Milan', 'Mexico City', 'Sydney', 'Sao Paulo', 'Saint Petersburg', 'Padang', 'San Jose', 'Adelaide', 'Madrid', 'Tunis', 'Rio de Janeiro', 'Tainan', 'Jakarta', 'Chicago', 'Brooklyn', 'Guilin', 'Hong Kong', 'Islamabad', "Xi'an", 'Columbus', 'Kyoto', 'Perth', 'Ottawa', 'Mecca', 'Manhattan', 'Hanoi', 'Genoa', 'Baltimore', 'Fort Worth', 'Lagos', 'Salvador', 'Havana', 'Cairo', 'Da Nang', 'Chongqing', 'Jeddah', 'Dublin', 'Abu Dhabi', 'Jeonju', 'Austin', 'Ho Chi Minh City', 'Jacksonville', 'Colombo', 'Pyongyang', 'Brisbane', 'Kobe', 'San Francisco', 'Kawasaki',
            'Kathmandu', 'Denpasar', 'Dalian', 'Chennai', 'Singapore', 'Dakar', 'Giza', 'Malang', 'Bangkok', 'Osaka', 'Nanjing', 'Tijuana', 'Charlotte', 'Bristol', 'San Diego', 'Sapporo', 'Stockholm', 'Alexandria', 'Queens', 'Philadelphia', 'Montreal', 'Johannesburg', 'Houston', 'Barcelona', 'Incheon', 'Washington, D.C.', 'Taipei', 'Gold Coast', 'Liverpool', 'Vienna', 'Lima', 'Dubai', 'Guangzhou', 'Tokyo', 'Mumbai', 'Buenos Aires', 'Tangshan', 'Naples', 'Nottingham', 'Milwaukee', 'Hyderabad', 'Dhaka', 'Seoul', 'New York City', 'Munich', 'Albuquerque', 'Berlin', 'Budapest', 'Mandalay', 'Beijing', 'Prague', 'Macau', 'Winnipeg', 'Wuhan', 'Lijiang', 'Moscow', 'Melbourne', 'Chiba', 'Karachi', 'Oklahoma City', 'Athens', 'Istanbul', 'Toronto', 'London', 'Warsaw', 'Manila', 'Nashville', 'Oslo', 'Lisbon', 'Casablanca', 'Seattle', 'Boston', 'Los Angeles', 'Tianjin', 'Copenhagen', 'Rome', 'Indianapolis', 'Cape Town', 'Edmonton', 'Denver', 'Yokohama', 'Paris'}

# create seed data file for selected travel cities
with open('cities15000.csv', newline='', encoding='ISO-8859-1') as f:
    reader = csv.reader(f)
    results = []
    for row in reader:
        if row[2] in selected:
            #name, long, lat, country, population, timezone
            new = [row[2], row[4], row[5], row[8], row[14], row[-2]]
            results.append(new)

cities = [['asciiname', 'latitude', 'longitude', 'country code', 'population', 'timezone'], ['Dubai', '25.0657', '55.17128', 'AE', '1137347', 'Asia/Dubai'], ['Abu Dhabi', '24.46667', '54.36667', 'AE', '603492', 'Asia/Dubai'], ['Buenos Aires', '-34.61315', '-58.37723', 'AR', '13076300', 'America/Argentina/Buenos_Aires'], ['San Francisco', '-31.42797', '-62.08266', 'AR', '59062', 'America/Argentina/Cordoba'], ['Vienna', '48.20849', '16.37208', 'AT', '1691468', 'Europe/Vienna'], ['Perth', '-31.95224', '115.8614', 'AU', '1896548', 'Australia/Perth'], ['Adelaide', '-34.92866', '138.59863', 'AU', '1225235', 'Australia/Adelaide'], ['Sydney', '-33.86785', '151.20732', 'AU', '4627345', 'Australia/Sydney'], ['Melbourne', '-37.814', '144.96332', 'AU', '4246375', 'Australia/Melbourne'], ['Liverpool', '-33.9', '150.93333', 'AU', '21317', 'Australia/Sydney'], ['Gold Coast', '-28.00029', '153.43088', 'AU', '591473', 'Australia/Brisbane'], ['Brisbane', '-27.46794', '153.02809', 'AU', '2189878', 'Australia/Brisbane'], ['Dhaka', '23.7104', '90.40744', 'BD', '10356500', 'Asia/Dhaka'], ['Brussels', '50.85045', '4.34878', 'BE', '1019022', 'Europe/Brussels'], ['Macau', '-5.115', '-36.63444', 'BR', '18070', 'America/Fortaleza'], ['Sao Paulo', '-23.5475', '-46.63611', 'BR', '10021295', 'America/Sao_Paulo'], ['Salvador', '-12.97111', '-38.51083', 'BR', '2711840', 'America/Bahia'], ['Rio de Janeiro', '-22.90278', '-43.2075', 'BR', '6023699', 'America/Sao_Paulo'], ['Colombo', '-25.29167', '-49.22417', 'BR', '217000', 'America/Sao_Paulo'], ['Calgary', '51.05011', '-114.08529', 'CA', '1019942', 'America/Edmonton'], ['Edmonton', '53.55014', '-113.46871', 'CA', '712391', 'America/Edmonton'], ['Kingston', '44.22976', '-76.48098', 'CA', '114195', 'America/Toronto'], ['London', '42.98339', '-81.23304', 'CA', '346765', 'America/Toronto'], ['Montreal', '45.50884', '-73.58781', 'CA', '1600000', 'America/Toronto'], ['Ottawa', '45.41117', '-75.69812', 'CA', '812129', 'America/Toronto'], ['Toronto', '43.70011', '-79.4163', 'CA', '2600000', 'America/Toronto'], ['Vancouver', '49.24966', '-123.11934', 'CA', '600000', 'America/Vancouver'], ['Winnipeg', '49.8844', '-97.14704', 'CA', '632063', 'America/Winnipeg'], ['Quebec', '46.81228', '-71.21454', 'CA', '528595', 'America/Toronto'], ['Sydney', '46.1351', '-60.1831', 'CA', '105968', 'America/Glace_Bay'], ['Los Angeles', '-37.46973', '-72.35366', 'CL', '125430', 'America/Santiago'], ["Xi'an", '34.25833', '108.92861', 'CN', '6501190', 'Asia/Shanghai'], ['Wuhan', '30.58333', '114.26667', 'CN', '9785388', 'Asia/Shanghai'], ['Tianjin', '39.14222', '117.17667', 'CN', '11090314', 'Asia/Shanghai'], ['Tangshan', '39.63333', '118.18333', 'CN', '3372102', 'Asia/Shanghai'], ['Shenzhen', '22.54554', '114.0683', 'CN', '10358381', 'Asia/Shanghai'], ['Shanghai', '31.22222', '121.45806', 'CN', '22315474', 'Asia/Shanghai'], ['Qingdao', '36.06488', '120.38042', 'CN', '3718835', 'Asia/Shanghai'], ['Nanjing', '32.06167', '118.77778', 'CN', '7165292', 'Asia/Shanghai'], ['Guilin', '25.28194', '110.28639', 'CN', '649352', 'Asia/Shanghai'], ['Guangzhou', '23.11667', '113.25', 'CN', '11071424', 'Asia/Shanghai'], ['Lijiang', '26.86879', '100.22072', 'CN', '1137600', 'Asia/Shanghai'], ['Dalian', '38.91222', '121.60222', 'CN', '4087733', 'Asia/Shanghai'], ['Chongqing', '29.56278', '106.55278', 'CN', '7457600', 'Asia/Shanghai'], ['Chengdu', '30.66667', '104.06667', 'CN', '7415590', 'Asia/Shanghai'], ['Beijing', '39.9075', '116.39723', 'CN', '11716620', 'Asia/Shanghai'], ['Madrid', '4.73245', '-74.26419', 'CO', '50437', 'America/Bogota'], ['San Jose', '10.95173', '-85.1361', 'CR', '31430', 'America/Costa_Rica'], ['San Jose', '9.93333', '-84.08333', 'CR', '335007', 'America/Costa_Rica'], ['San Francisco', '9.99299', '-84.12934', 'CR', '55923', 'America/Costa_Rica'], ['San Diego', '9.89898', '-84.00287', 'CR', '16991', 'America/Costa_Rica'], ['Havana', '23.13302', '-82.38304', 'CU', '2163824', 'America/Havana'], ['Prague', '50.08804', '14.42076', 'CZ', '1165581', 'Europe/Prague'], ['Munich', '48.13743', '11.57549', 'DE', '1260391', 'Europe/Berlin'], ['Berlin', '52.52437', '13.41053', 'DE', '3426354', 'Europe/Berlin'], ['Copenhagen', '55.67594', '12.56553', 'DK', '1153615', 'Europe/Copenhagen'], ['Cairo', '30.06263', '31.24967', 'EG', '7734614', 'Africa/Cairo'], ['Giza', '30.00808', '31.21093', 'EG', '2443203', 'Africa/Cairo'], ['Alexandria', '31.21564', '29.95527', 'EG', '3811516', 'Africa/Cairo'], ['Madrid', '40.4165', '-3.70256', 'ES', '3255944', 'Europe/Madrid'], ['Barcelona', '41.38879', '2.15899', 'ES', '1621537', 'Europe/Madrid'], ['Paris', '48.85341', '2.3488', 'FR', '2138551', 'Europe/Paris'], ['Perth', '56.39522', '-3.43139', 'GB', '47180', 'Europe/London'], ['Nottingham', '52.9536', '-1.15047', 'GB', '729977', 'Europe/London'], ['London', '51.50853', '-0.12574', 'GB', '7556900', 'Europe/London'], ['Liverpool', '53.41058', '-2.97794', 'GB', '864122', 'Europe/London'], ['Leicester', '52.6386', '-1.13169', 'GB', '508916', 'Europe/London'], ['Bristol', '51.45523', '-2.59665', 'GB', '617280', 'Europe/London'], ['Boston', '52.97633', '-0.02664', 'GB', '41340', 'Europe/London'], ['Birmingham', '52.48142', '-1.89983', 'GB', '984333', 'Europe/London'], ['Athens', '37.97945', '23.71622', 'GR', '664046', 'Europe/Athens'], ['Guatemala City', '14.64072', '-90.51327', 'GT', '994938', 'America/Guatemala'], ['Hong Kong', '22.27832', '114.17469', 'HK', '7012738', 'Asia/Hong_Kong'], ['Port-au-Prince', '18.53917', '-72.335', 'HT', '1234742', 'America/Port-au-Prince'], ['Budapest', '47.49801', '19.03991', 'HU', '1741041', 'Europe/Budapest'], ['Padang', '-0.94924', '100.35427', 'ID', '840352', 'Asia/Jakarta'], ['Malang', '-7.9797', '112.6304', 'ID', '746716', 'Asia/Jakarta'], ['Jakarta', '-6.21462', '106.84513', 'ID', '8540121', 'Asia/Jakarta'], ['Denpasar', '-8.65', '115.21667', 'ID', '834881', 'Asia/Makassar'], ['Dublin', '53.33306', '-6.24889', 'IE', '1024027', 'Europe/Dublin'], ['Jerusalem', '31.76904', '35.21633', 'IL', '801000', 'Asia/Jerusalem'], ['Chennai', '13.08784', '80.27847', 'IN', '4328063', 'Asia/Kolkata'], ['Jaipur', '26.91962', '75.78781', 'IN', '2711758', 'Asia/Kolkata'], ['Hyderabad', '17.38405', '78.45636', 'IN', '3597816', 'Asia/Kolkata'], ['Dhaka', '26.67479', '85.16698', 'IN', '36111', 'Asia/Kolkata'], ['Delhi', '28.65195', '77.23149', 'IN', '10927986', 'Asia/Kolkata'], ['Mumbai', '19.07283', '72.88261', 'IN', '12691836', 'Asia/Kolkata'], ['Baghdad', '33.34058', '44.40088', 'IQ', '7216000', 'Asia/Baghdad'], ['Rome', '41.89193', '12.51133', 'IT', '2318895', 'Europe/Rome'], ['Naples', '40.85216', '14.26811', 'IT', '959470', 'Europe/Rome'], ['Milan', '45.46427', '9.18951', 'IT', '1236837', 'Europe/Rome'], ['Genoa', '44.40478', '8.94439', 'IT', '580223', 'Europe/Rome'], ['Kingston', '17.99702', '-76.79358', 'JM', '937700', 'America/Jamaica'], ['Yokohama', '35.43333', '139.65', 'JP', '3574443', 'Asia/Tokyo'], ['Tokyo', '35.6895', '139.69171', 'JP', '8336599', 'Asia/Tokyo'], ['Osaka', '34.69374', '135.50218', 'JP', '2592413', 'Asia/Tokyo'], ['Kyoto', '35.02107', '135.75385', 'JP', '1459640', 'Asia/Tokyo'], ['Kobe', '34.6913', '135.183', 'JP', '1528478', 'Asia/Tokyo'], ['Kawasaki', '35.52056', '139.71722', 'JP', '1306785', 'Asia/Tokyo'], ['Kawasaki', '33.59993', '130.81495', 'JP', '19141', 'Asia/Tokyo'], ['Hiroshima', '34.4', '132.45', 'JP', '1143841', 'Asia/Tokyo'], ['Chiba', '35.6', '140.11667', 'JP', '919729', 'Asia/Tokyo'], ['Sapporo', '43.06667', '141.35', 'JP', '1883027', 'Asia/Tokyo'], ['Pyongyang', '39.03385', '125.75432', 'KP', '3222000', 'Asia/Pyongyang'], ['Seoul', '37.566', '126.9784', 'KR', '10349312', 'Asia/Seoul'], ['Busan', '35.10278', '129.04028', 'KR', '3678555', 'Asia/Seoul'], ['Incheon', '37.45646', '126.70515', 'KR', '2628000', 'Asia/Seoul'], ['Jeonju', '35.82194', '127.14889', 'KR', '711424', 'Asia/Seoul'], ['Colombo', '6.93194', '79.84778', 'LK', '648034', 'Asia/Colombo'], ['Casablanca', '33.58831', '-7.61138', 'MA', '3144909', 'Africa/Casablanca'], ['Mandalay', '21.97473', '96.08359', 'MM', '1208099', 'Asia/Yangon'], ['Macau', '22.20056', '113.54611', 'MO', '520400', 'Asia/Macau'], ['Mexico City', '19.42847', '-99.12766', 'MX', '12294193', 'America/Mexico_City'], ['Cancun', '21.17429', '-86.84656', 'MX', '542043', 'America/Cancun'], ['Tijuana', '32.5027', '-117.00371', 'MX', '1376457', 'America/Tijuana'], ['Kingston', '-29.05459', '167.96628', 'NF', '880', 'Pacific/Norfolk'], ['Lagos', '6.45407', '3.39467', 'NG', '9000000', 'Africa/Lagos'], ['Amsterdam', '52.37403', '4.88969', 'NL', '741636', 'Europe/Amsterdam'], ['Oslo', '59.91273', '10.74609', 'NO', '580000', 'Europe/Oslo'], ['Kathmandu', '27.70169', '85.3206', 'NP', '1442271', 'Asia/Kathmandu'], ['Muscat', '23.58413', '58.40778', 'OM', '797000', 'Asia/Muscat'], ['Lima', '-12.04318', '-77.02824', 'PE', '7737002', 'America/Lima'], ['San Jose', '13.35', '123.55', 'PH', '35768', 'Asia/Manila'], ['San Jose', '12.35275', '121.06761', 'PH', '118807', 'Asia/Manila'], ['San Francisco', '15.35566', '120.84001', 'PH', '19570', 'Asia/Manila'], ['San Francisco', '8.53556', '125.95', 'PH', '18542', 'Asia/Manila'], ['Manila', '14.6042', '120.9822', 'PH', '1600000', 'Asia/Manila'], ['Karachi', '24.8608', '67.0104', 'PK', '11624219', 'Asia/Karachi'], ['Islamabad', '33.72148', '73.04329', 'PK', '601600', 'Asia/Karachi'], ['Hyderabad', '25.39242', '68.37366', 'PK', '1386330', 'Asia/Karachi'], ['Warsaw', '52.22977', '21.01178', 'PL', '1702139', 'Europe/Warsaw'], ['Lisbon', '38.71667', '-9.13333', 'PT', '517802', 'Europe/Lisbon'], ['Lagos', '37.10202', '-8.67422', 'PT', '18831', 'Europe/Lisbon'], ['Alexandria', '43.98333', '25.33333', 'RO', '49346', 'Europe/Bucharest'], ['Saint Petersburg', '59.93863', '30.31413', 'RU', '5028000', 'Europe/Moscow'], ['Moscow', '55.75222', '37.61556', 'RU', '10381222', 'Europe/Moscow'], ['Mecca', '21.42664', '39.82563', 'SA', '1323624', 'Asia/Riyadh'], ['Jeddah', '21.54238', '39.19797', 'SA', '2867446', 'Asia/Riyadh'], ['Stockholm', '59.33258', '18.0649', 'SE', '1515017', 'Europe/Stockholm'], ['Singapore', '1.28967', '103.85007', 'SG', '3547809', 'Asia/Singapore'], ['Dakar', '14.6937', '-17.44406', 'SN', '2476400', 'Africa/Dakar'], ['San Francisco', '13.7', '-88.1', 'SV', '16152', 'America/El_Salvador'], ['Bangkok', '13.75398', '100.50144', 'TH', '5104476', 'Asia/Bangkok'], ['Tunis', '36.81897', '10.16579', 'TN', '693210', 'Africa/Tunis'], ['Istanbul', '41.01384', '28.94966', 'TR', '14804116', 'Europe/Istanbul'], ['Taipei', '25.04776', '121.53185', 'TW', '7871900', 'Asia/Taipei'], ['Tainan', '22.99083', '120.21333', 'TW', '771235', 'Asia/Taipei'], ['Odessa', '46.47747', '30.73262', 'UA', '1001558', 'Europe/Kiev'], ['Birmingham', '33.52066', '-86.80249', 'US', '212461', 'America/Chicago'], ['Jacksonville', '34.8662', '-92.11015', 'US', '28643', 'America/Chicago'], ['Washington, D.C.', '38.89511', '-77.03637', 'US', '601723', 'America/New_York'], ['Jacksonville', '30.33218', '-81.65565', 'US', '868031', 'America/New_York'], ['Melbourne', '28.08363', '-80.60811', 'US', '80127', 'America/New_York'], ['Naples', '26.14234', '-81.79596', 'US', '21512', 'America/New_York'], ['Athens', '33.96095', '-83.37794', 'US', '116714', 'America/New_York'], ['Columbus', '32.46098', '-84.98771', 'US', '200579', 'America/New_York'], ['Dublin', '32.54044', '-82.90375', 'US', '16197', 'America/New_York'], ['Rome', '34.25704', '-85.16467', 'US', '36323', 'America/New_York'], ['Jacksonville', '39.73394', '-90.22901', 'US', '19103', 'America/Chicago'], ['Columbus', '39.20144', '-85.92138', 'US', '46690', 'America/Indiana/Indianapolis'], ['Indianapolis', '39.76838', '-86.15804', 'US', '829718', 'America/Indiana/Indianapolis'], ['Manhattan', '39.18361', '-96.57167', 'US', '56308', 'America/Chicago'], ['Alexandria', '31.31129', '-92.44514', 'US', '47889', 'America/Chicago'], ['Baltimore', '39.29038', '-76.61219', 'US', '621849', 'America/New_York'], ['Columbus', '33.49567', '-88.42726', 'US', '23168', 'America/Chicago'], ['Charlotte', '35.22709', '-80.84313', 'US', '827097', 'America/New_York'], ['Jacksonville', '34.75405', '-77.43024', 'US', '67357', 'America/New_York'], ['Athens', '39.32924', '-82.10126', 'US', '25044', 'America/New_York'], ['Columbus', '39.96118', '-82.99879', 'US', '850106', 'America/New_York'], ['Oklahoma City', '35.46756', '-97.51643', 'US', '631346', 'America/Chicago'], ['Philadelphia', '39.95233', '-75.16379', 'US', '1567442', 'America/New_York'], ['Bristol', '36.59511', '-82.18874', 'US', '26666', 'America/New_York'], ['Memphis', '35.14953', '-90.04898', 'US', '655770', 'America/Chicago'], ['Nashville', '36.16589', '-86.78444', 'US', '530852', 'America/Chicago'], ['Austin', '30.26715', '-97.74306', 'US', '931830', 'America/Chicago'], ['Dallas', '32.78306', '-96.80667', 'US', '1300092', 'America/Chicago'], ['Fort Worth', '32.72541', '-97.32085', 'US', '833319', 'America/Chicago'], ['Houston', '29.76328', '-95.36327', 'US', '2296224', 'America/Chicago'], ['Vienna', '38.90122', '-77.26526', 'US', '16522', 'America/New_York'], ['Athens', '34.80243', '-86.97219', 'US', '24966', 'America/Chicago'], ['Chicago', '41.85003', '-87.65005', 'US', '2720546', 'America/Chicago'], ['Ottawa', '41.34559', '-88.84258', 'US', '18342', 'America/Chicago'], ['Boston', '42.35843', '-71.05977', 'US', '667137', 'America/New_York'], ['Portland', '43.66147', '-70.25533', 'US', '66881', 'America/New_York'], ['Birmingham', '42.5467', '-83.21132', 'US', '20857', 'America/Detroit'], ['Detroit', '42.33143', '-83.04575', 'US', '677116', 'America/Detroit'], ['Austin', '43.66663', '-92.97464', 'US', '24563', 'America/Chicago'], ['Columbus', '41.42973', '-97.36838', 'US', '22797', 'America/Chicago'], ['Amsterdam', '42.93869', '-74.18819', 'US', '18008', 'America/New_York'], ['Brooklyn', '40.6501', '-73.94958', 'US', '2300664', 'America/New_York'], ['Kingston', '41.92704', '-73.99736', 'US', '23436', 'America/New_York'], ['Manhattan', '40.78343', '-73.96625', 'US', '1487536', 'America/New_York'], ['New York City', '40.71427', '-74.00597', 'US', '8175133', 'America/New_York'], ['Queens', '40.68149', '-73.83652', 'US', '2272771', 'America/New_York'], ['Rome', '43.21285', '-75.45573', 'US', '32573', 'America/New_York'], ['Dublin', '40.09923', '-83.11408', 'US', '45098', 'America/New_York'], ['Lima', '40.74255', '-84.10523', 'US', '37873', 'America/New_York'], ['Bristol', '41.67705', '-71.26616', 'US', '22795', 'America/New_York'], ['Milwaukee', '43.0389', '-87.90647', 'US', '600155', 'America/Chicago'], ['Bristol', '41.67176', '-72.94927', 'US', '60452', 'America/New_York'], ['Phoenix', '33.44838', '-112.07404', 'US', '1563025', 'America/Phoenix'], ['Tucson', '32.22174', '-110.92648', 'US', '531641', 'America/Phoenix'], ['Dublin', '37.70215', '-121.93579', 'US', '57721', 'America/Los_Angeles'], ['Los Angeles', '34.05223', '-118.24368', 'US', '3971883', 'America/Los_Angeles'], ['San Diego', '32.71533', '-117.15726', 'US', '1394928', 'America/Los_Angeles'], ['San Francisco', '37.77493', '-122.41942', 'US', '864816', 'America/Los_Angeles'], ['San Jose', '37.33939', '-121.89496', 'US', '1026908', 'America/Los_Angeles'], ['Denver', '39.73915', '-104.9847', 'US', '682545', 'America/Denver'], ['Albuquerque', '35.08449', '-106.65114', 'US', '559121', 'America/Denver'], ['Las Vegas', '36.17497', '-115.13722', 'US', '623747', 'America/Los_Angeles'], ['El Paso', '31.75872', '-106.48693', 'US', '681124', 'America/Denver'], ['Odessa', '31.84568', '-102.36764', 'US', '118968', 'America/Chicago'], ['Moscow', '46.73239', '-117.00017', 'US', '25060', 'America/Los_Angeles'], ['Dallas', '44.91928', '-123.31705', 'US', '15277', 'America/Los_Angeles'], ['Portland', '45.52345', '-122.67621', 'US', '632309', 'America/Los_Angeles'], ['Seattle', '47.60621', '-122.33207', 'US', '684451', 'America/Los_Angeles'], ['Vancouver', '45.63873', '-122.66149', 'US', '172860', 'America/Los_Angeles'], ['Barcelona', '10.13625', '-64.68618', 'VE', '424795', 'America/Caracas'], ['Ho Chi Minh City', '10.82302', '106.62965', 'VN', '3467331', 'Asia/Ho_Chi_Minh'], ['Hanoi', '21.0245', '105.84117', 'VN', '1431270', 'Asia/Ho_Chi_Minh'], ['Da Nang', '16.06778', '108.22083', 'VN', '752493', 'Asia/Ho_Chi_Minh'], ['Port Elizabeth', '-33.91799', '25.57007', 'ZA', '967677', 'Africa/Johannesburg'], ['Johannesburg', '-26.20227', '28.04363', 'ZA', '2026469', 'Africa/Johannesburg'], ['Cape Town', '-33.92584', '18.42322', 'ZA', '3433441', 'Africa/Johannesburg']]
