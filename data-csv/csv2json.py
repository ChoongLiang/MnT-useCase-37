import csv
import json

def title(name):
    names = []
    entries = []

    with open(name, 'rt') as f:
        reader = csv.reader(f)
        counter = 0
        for row in reader:
            if counter != 0:
                try:
                    index = names.index(row[0])
                except ValueError:
                    names.append(row[0])
                    index = names.index(row[0])

                data = {}
                data["id"] = index
                data["owner"] = row[0]
                data["tax_year"] = row[1]
                data["taxes_recieved"] = row[2]
                data["amount"] = row[3]
                entries.append(data)
                print(index, row[0])
            counter += 1

    with open(name.split(".")[0] + ".json", "a+") as outf:
        json.dump(entries, outf)

def judgement(name):
    names = []
    entries = []

    with open(name, "rt") as f:
        reader = csv.reader(f)
        counter = 0
        for row in reader:
            if counter != 0:
                try:
                    index = names.index(row[0])
                except ValueError:
                    names.append(row[0])
                    data = {}
                    data["owner"] = row[0]
                    data["case_number"] = []
                    data["judgement_description"] = []
                    data["file_date"] = []
                    data["amount"] = []
                    index = names.index(row[0])
                    entries.insert(index, data)

                data = entries[index]
                case_number = data["case_number"]
                case_number.append(row[1])
                data["case_number"] = case_number

                descrip = data["judgement_description"]
                descrip.append(row[2])
                data["judgement_description"] = descrip

                file_date = data["file_date"]
                file_date.append(row[3])
                data["file_date"] = file_date

                amount = data["amount"]
                amount.append(row[4])
                data["amount"] = amount
                

            counter += 1        
            print(entries)
    
    with open(name.split(".")[0] + ".json", "a+") as outf:
        json.dump(entries, outf)

def tax(name):
    names = []
    entries = []

    with open(name, "rt") as f:
        reader = csv.reader(f)
        counter = 0
        for row in reader:
            if counter != 0:
                try:
                    index = names.index(row[0])
                except ValueError:
                    names.append(row[0])
                    data = {}
                    data["owner"] = row[0]
                    data["tax_year"] = []
                    data["taxes_received"] = []
                    data["amount"] = []
                    index = names.index(row[0])
                    entries.insert(index, data)

                data = entries[index]
                tax_year = data["tax_year"]
                tax_year.append(row[1])
                data["tax_year"] = tax_year

                taxes_received = data["taxes_received"]
                taxes_received.append(row[2])
                data["taxes_received"] = taxes_received

                amount = data["amount"]
                amount.append(row[3])
                data["amount"] = amount
                

            counter += 1        
            print(entries)
    
    with open(name.split(".")[0] + ".json", "a+") as outf:
        json.dump(entries, outf)

def mortgage(name):
    names = []
    entries = []

    with open(name, "rt") as f:
        reader = csv.reader(f)
        counter = 0
        for row in reader:
            if counter != 0:
                try:
                    index = names.index(row[0])
                except ValueError:
                    names.append(row[0])
                    data = {}
                    data["owner"] = row[0]
                    data["mortgage_amount"] = []
                    data["current_balance"] = []
                    data["status"] = []
                    index = names.index(row[0])
                    entries.insert(index, data)

                data = entries[index]
                mortgage_amount = data["mortgage_amount"]
                mortgage_amount.append(row[1])
                data["mortgage_amount"] = mortgage_amount

                current_balance = data["current_balance"]
                current_balance.append(row[2])
                data["current_balance"] = current_balance

                status = data["status"]
                status.append(row[3])
                data["status"] = status
                

            counter += 1        
            print(entries)
    
    with open(name.split(".")[0] + ".json", "a+") as outf:
        json.dump(entries, outf)
# name = "TitleDataset-370BerrymanDr.csv"
# title(name)
# judgement("JudgementDatabase.csv")
# tax("TaxDatabase.csv")
mortgage("MortgageDatabase.csv")
