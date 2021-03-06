# postgres

sudo apt-get update
sudo apt-get install postgresql postgresql-contrib

#worker
sudo apt-get update
sudo apt-get install git
sudo apt-get install default-jre

git clone git@github.com:owocki/Hacker_News_ETL.git

chkconfig crond on
echo '
#deploy on boot
@reboot cd Hacker_News_ETL/; git pull origin master
#run four threads of the worker at once
@reboot  screen -dmS get_response bash -c "cd Hacker_News_ETL/; while true; do ./pan.sh -file=jobs/get_response.ktr | tee -a logs/get_response.log; done ";
@reboot  screen -dmS get_response bash -c "cd Hacker_News_ETL/; while true; do ./pan.sh -file=jobs/get_response.ktr | tee -a logs/get_response.log; done ";
@reboot  screen -dmS get_response bash -c "cd Hacker_News_ETL/; while true; do ./pan.sh -file=jobs/get_response.ktr | tee -a logs/get_response.log; done ";
@reboot  screen -dmS get_response bash -c "cd Hacker_News_ETL/; while true; do ./pan.sh -file=jobs/get_response.ktr | tee -a logs/get_response.log; done ";
#because get_users is a job that will be run on a handful of distributed EC2 instances, and we do not want those instances to thrash, execute the job through the hour.
1 * * * * screen -dmS get_users bash -c " sleep $[ ( $RANDOM % 3600 )  + 1 ]s; cd Hacker_News_ETL/; ./pan.sh -file=jobs/get_users.ktr | tee -a logs/get_users.log ";
' > crontab.txt
crontab crontab.txt
rm crontab.txt
