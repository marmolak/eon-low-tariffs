BEGIN {
	skipped_first = 0
	skipped_first_right = 0
	found_div = 0
}

/<div class="col-sm-6">/ {
	if (skipped_first == 0) {
		skipped_first = 1
		next
	}
	found_div = 1
}

/<div class="pull-left">/ {
	if (found_div == 0) { next }
	
	getline

	print $1 " - " $3
}

/<div class="pull-right">/ {
	if (skipped_first_right == 0) {
		skipped_first_right = 1
		next
	}

	getline
	while ($1 != "</div>") {
		print $1 " - " substr($3, 0, length($3)-4)
		getline
	}
}
