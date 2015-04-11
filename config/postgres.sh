# postgres

sudo apt-get update
sudo apt-get install postgresql postgresql-contrib

#worker
sudo apt-get install git

git clone git@github.com:owocki/Hacker_News_ETL.git
chkconfig crond on
echo '@reboot  screen -dmS get_response bash -c "cd Hacker_News_ETL/; while true; do ./pan.sh --file=jobs/get_response.ktr | tee -a logs/get_response.log; done ";
' > crontab.txt
crontab crontab.txt
rm crontab.txt
