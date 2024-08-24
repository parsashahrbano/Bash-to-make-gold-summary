#!/bin/bash
cd /home/shishi/DUCs/
mkdir -p tmp
for i in gold/*; do 
  fname=$(basename "$i")
  cluster_num=${fname:1:5}
  cluster_dir="directory/$cluster_num"
  mkdir -p "$cluster_dir"
  awk '{print $2}' "$i" | head -4 | cut -c 1-667 > "tmp/$cluster_num.txt"
  for j in {1..4}; do
    mv "tmp/$cluster_num.txt" "$cluster_dir/fg$j.txt"
  done
done
rm -rf tmp
