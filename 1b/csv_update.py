import csv

outs = []
with open("result.csv") as f:
 reader = csv.reader(f)
 for row in reader:
  outs.append(row)

header = ['nomor fungsi fx', 'jumlah iterasi', 'tolerance', 'converge/tidak', 'elapsed time', 'norm grad']
with open('result_dengan_label.csv', 'w') as csvfile:
 w = csv.writer(csvfile)
 w.writerow(header)
 for o in outs:
  w.writerow(o)

for i in range(1,5):
 outs = []
 with open("sol{}.csv".format(str(i))) as f:
  reader = csv.reader(f)
  l = 0
  for row in reader:
   l = len(row)
   outs.append(row)
  h = ["X{}".format(i) for i in range(1,l+1)]
  with open('sol{}_dengan_label.csv'.format(i), 'w') as csvfile:
   w = csv.writer(csvfile)
   w.writerow(h)
   for o in outs:
    w.writerow(o)
