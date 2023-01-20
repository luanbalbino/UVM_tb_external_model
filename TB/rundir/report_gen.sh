load ./cov_work/scope/database_name
exec mkdir -p report
report -out report/coverage.rpt -detail -metrics functional -all -aspect both -assertionStatus -allAssertionCounters -type *