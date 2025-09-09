from tabulate import tabulate
tabela = []

header = ["token", "valor"]
with open("out.txt") as f:
    for line in f:

        tabela.append(line.split(','))
    
print(tabulate(tabela,headers=header, tablefmt='grid'))