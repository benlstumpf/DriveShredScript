#Thoughts of continued developement
  #Move failed Shreds to different dir
  #Make log dir a variable
lsblk -ld | grep -o '^sd[b-z]' | while read -r filename; do #find the drives needing to be shreded
    filename="/dev/$filename" # Assign one drive path to a variable at a time
    # Part 1: Run shred using variable
    # Part 2: Get Serial Number of drive
    # Part 3: Log output in file named using the Serial Number
    shred -fvz "$filename" > "/home/ben/ProjectsInProgress/ShredLogs/$(hdparm -I "$filename" | grep -o 'Serial Number:\s*\S*' | cut -f2 -d: | sed 's/^\s*//').log" 2>&1 &
done
