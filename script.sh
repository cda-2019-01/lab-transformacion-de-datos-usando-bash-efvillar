# se eliminan las lineas en blanco
cp data1.csv data1_1.csv
cp data2.csv data2_1.csv
cp data3.csv data3_1.csv
awk 'NF>0' data1_1.csv > data1.csv
awk 'NF>0' data2_1.csv > data2.csv
awk 'NF>0' data3_1.csv > data3.csv
#se agrega el nombre del archivo
awk '{print FILENAME (NF?",":"") $0}' data1.csv > data1_1.csv
awk '{print FILENAME (NF?",":"") $0}' data2.csv  > data2_1.csv
awk '{print FILENAME (NF?",":"") $0}' data3.csv > data3_1.csv
awk '{printf("%01d %s\n", NR, $0)}' data1_1.csv > data_11.csv
awk '{printf("%01d %s\n", NR, $0)}' data2_1.csv > data_21.csv
awk '{printf("%01d %s\n", NR, $0)}' data3_1.csv > data_31.csv
cat data_11.csv data_21.csv data_31.csv > data.csv
sed 's/\([0-9]\) data?.csv,/data?.csv,\1/' data.csv > data_b.csv
tr '\t' ',' < data_b.csv | tr -s ' ' ',' > data_c.csv
sed 's/\([0-9]\),data\([0-9]\).csv/data\2.csv,\1/g' < data_c.csv > data_d.csv
awk 'BEGIN{OFS=",";} {split($0,data,",")} {print data[1], data[2], data[3], data[4], data[1], data[2], data[3], data[5], data[1], data[2], data[3], data[6], data[1], data[2], data[3], data[7], data[1], data[2], data[3], data[8], data[1], data[2], data[3], data[9], data[1], data[2], data[3], data[10] }' data_d.csv > data_e.csv
sed 's/,,[a-z]*[0-9].[a-z]*,[0-9],[A-Z],/|/g' data_e.csv > data_f.csv
sed 's/,[a-z]*[0-9].[a-z]*,[0-9],[A-Z]|//g' data_f.csv > data_g.csv
sed 's/,[a-z]*[0-9].[a-z]*,[0-9],[A-Z],$//' data_g.csv > data_h.csv
sed 's/\([a-z]*[0-9].[a-z]*,[0-9],[A-Z],[a-z]*:[0-9]\)/\1|/g' data_h.csv > data_i.csv
tr '|' '\n' < data_i.csv | awk 'NF>0' | sed 's/,data/data/1'