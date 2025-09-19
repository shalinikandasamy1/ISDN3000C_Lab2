#!/bin/bash

# a. Generate Report Header (title and date)
echo "# Server Analysis Report" > final_report/analysis_report.md
date >> final_report/analysis_report.md

# b. Extract Connection Logs containing "INFO"
grep "INFO" raw_data/game.log > final_report/player_connections.log

# c. Count warnings and critical errors and append to report
warn_count=$(grep -c "WARN" raw_data/game.log)
critical_count=$(grep -c "CRITICAL" raw_data/game.log)

echo -e "\n## Summary\n" >> final_report/analysis_report.md
echo "- Total Warning: $warn_count" >> final_report/analysis_report.md
echo "- Total Critical Errors: $critical_count" >> final_report/analysis_report.md

# d. Count player logins and append to report
login_count=$(grep -c "LOGIN SUCCESS" raw_data/game.log)
echo "- Total Player Logins: $login_count" >> final_report/analysis_report.md


