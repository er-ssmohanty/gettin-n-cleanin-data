download_unzip_setwd<-function(){
    if(!file.exists("omega.zip")){
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","omega.zip")
    }
    unzip("omega.zip",exdir="omega69")
    setwd("omega69")
    setwd(list.files()[1])
}
dirchecker<-function(){
    neededfile=c("activity_labels.txt","features_info.txt","features.txt")
    neededfile=append(neededfile,c("README.txt","test","train"))
    neededdirs=c(".","./test","./test/Inertial Signals","./train","./train/Inertial Signals")
    if((identical(neededdirs,list.dirs()))&&(identical(neededfile,list.files()))){
        return(0)
    }
    else{
        return(1)
    }
}

namerectify<-function(anytext){
    anytext=gsub(" ","",anytext)
    anytext=gsub("\\,","",anytext)
    anytext=gsub("\\.","",anytext)
    anytext=gsub("-","",anytext)
    anytext=gsub("\\(","",anytext)
    anytext=gsub("\\)","",anytext)
    anytext=tolower(anytext)
    anytext=gsub("^t","time",anytext)
    anytext=gsub("^f","frequency",anytext)
    anytext=gsub("[Aa]cc","accelerometer",anytext)
    anytext=gsub("[Gg]yro","gyroscope",anytext)
    anytext=gsub("[Mm]ag","magnitude",anytext)
    return(anytext)
}
charactivity<-function(activity_column){
    activity_column=as.character(activity_column)
    activity_column=sub("1","WALKING",activity_column)
    activity_column=sub("2","WALKING_UPSTAIRS",activity_column)
    activity_column=sub("3","WALKING_DOWNSTAIRS",activity_column)
    activity_column=sub("4","SITTING",activity_column)
    activity_column=sub("5","STANDING",activity_column)
    activity_column=sub("6","LAYING",activity_column)
    return(activity_column)
}

dataset1prog<-function(){
    resp=dirchecker()
    if(resp==1){
        download_unzip_setwd()
    }
    features=read.table("features.txt")
    featlist=grep("-mean\\(\\)|-std\\(\\)",features[,2])
    
    xtest=read.table("test/X_test.txt")
    names(xtest)=features[,2]
    xtest=xtest[featlist]
    
    ytest=read.table("test/y_test.txt")
    subtest=read.table("test/subject_test.txt")
    testdata=cbind(subtest,xtest,ytest)
    
    xtrain=read.table("train/X_train.txt")
    names(xtrain)=features[,2]
    xtrain=xtrain[featlist]
    
    ytrain=read.table("train/y_train.txt")
    subtrain=read.table("train/subject_train.txt")
    traindata=cbind(subtrain,xtrain,ytrain)
    
    alldata=rbind(traindata,testdata)
    names(alldata)[c(1,length(alldata))]=c("subject","activity")
    names(alldata)=namerectify(names(alldata))
    alldata[,68]=charactivity(alldata[,68]) #activity column
    
    return(alldata)
}
dataset2prog<-function(alldat){
    wu_=length(names(alldat))-1
    groupedat=aggregate(alldat[,2:wu_], list(alldat[,wu_+1],alldat[,1]), FUN=mean)
    names(groupedat)[c(1,2)]=c("activity","subject")
    return(groupedat)
}

main_<-function(){
    dt1=dataset1prog()
    dt2=dataset2prog(dt1)
    dt_x=list(dt1,dt2)
    return(dt_x)
}

#main_()