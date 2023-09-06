#!/bin/bash

#our program goal is to install mysql

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log

# this function should validate the previous commond and inform the user either success or failure
VALIDATE(){
    # $1--->it will receive the argument 1
    if [ $1 -ne 0 ]
    then 
        echo "$2 ... FAILURE"
        exit 1
    else
        echo "$2 ... SUCCESS"  
    fi      
}

USERID=$(id -u)
 
if [ $USERID -ne 0 ]
then 
    echo "ERROR::Please run this script with root access"
    exit 1
# else
#     echo "INFO::you are root user"
fi    

# it is our responsibility again to check installation is success or not
yum install mysql -y &>>$LOGFILE

VALIDATE $? "installing mysql"

yum install postfix -y &>>$LOGFILE

VALIDATE $? "installing postfix"