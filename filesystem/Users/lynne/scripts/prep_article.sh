source=$(head -5 $1 | sed '/^$/d' | tail -1 | sed 's/[^A-z]//g')
new_name=$source-$1
mv $1 $new_name
echo Renamed $1 to $new_name

echo "<article source='$source' filename='$new_name'>
$(cat $new_name)
</article>" > $new_name
