#!/bin/bash
echo "existing buckets are"
echo "Hi I am Kunal and this is the 3rd time I am changing"
aws s3 ls
read -p "Enter the bucket name : " buckName
comp=$(aws s3 ls | grep -o "$buckName")
if [[ $buckName = $comp ]]; then
	echo "There is already something in the bucket from this name.Are you sure u want to add it??"
	read -p "Enter yes to overwrite and no to again enter the bucket name:" permission
	     if [["yes" == $permission]]; then
	echo "Hii your bucket is trying to get prepared"
	read -p "Enter the path of the file to b uploaded : " pathName
    bucket=$(aws s3api create-bucket --bucket $buckName --region us-east-1)
    echo $bucket
    aws s3 cp $pathName s3://$buckName/
    echo "file uploaded succesfully"
         elif [[ "no" = $permission ]]; then
	read -p "Enter the bucket name : " buckName
	echo "Hii your bucket is trying to get prepared"
	read -p "Enter the path of the file to b uploaded : " pathName
    bucket=$(aws s3api create-bucket --bucket $buckName --region us-east-1)
    echo $bucket
    aws s3 cp $pathName s3://$buckName/
    list=$(aws s3 ls s3://$buckname)	
    echo $list
	     else
	echo "invalid choice"	 
	      fi  
 else 
	#read -p "Enter the bucket name : " buckName
	echo "Hii your bucket is trying to get prepared"
	read -p "Enter the path of the file to b uploaded : " pathName
    bucket=$(aws s3api create-bucket --bucket $buckName --region us-east-1)
    echo $bucket
    aws s3 cp $pathName s3://$buckName/
	aws s3 ls s3://$buckName --recursive --human-readable --summarize
fi
