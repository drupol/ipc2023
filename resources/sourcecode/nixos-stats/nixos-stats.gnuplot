set datafile separator ','

set term svg
set output "nixos-stats.svg"

set key left top
set key autotitle columnhead
set xlabel ' '

set y2tics # enable second axis
set ytics nomirror # dont show the tics on that side

set mxtics 2
set mytics 2
set my2tics 2
set grid x,y,y2

# Thinner, filled bars
set boxwidth 0.4
set style fill solid 1.00

# Remove border around chart
unset border

# Manual set the Y-axis range
set style data histograms
set boxwidth 1

# Show human-readable Y-axis. E.g. "100 k" instead of 100000.
set format y '%.0s %c'
set format y2 '%.0s %c'

plot 'nixos-stats.csv' using 2:xticlabels(1) lt rgb "#5277C3", \
  '' using 3 lt rgb "#7EBAE4" axis x1y2
