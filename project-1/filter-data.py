import csv
fin = 'household_power_consumption.txt'
fout = 'data.txt'
fieldnames = ['Date',
			'Time',
			'Global_active_power',
			'Global_reactive_power',
			'Voltage',
			'Global_intensity',
			'Sub_metering_1',
			'Sub_metering_2',
			'Sub_metering_3']
with open(fin, 'rb') as infile:
	with open(fout, 'w') as outfile:
		reader = csv.DictReader(infile, fieldnames, delimiter=";")
		writer = csv.DictWriter(outfile, fieldnames, delimiter=";")
		writer.writeheader()
		for row in reader:
			if (row['Date'] == "1/2/2007" or row['Date'] == "2/2/2007"):
				writer.writerow(row)