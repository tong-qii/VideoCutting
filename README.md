# VideoCutting

### Prerequisites
#### These are the tools and softwares you need to install before running the script
###### 1. [xsv](https://github.com/BurntSushi/xsv#installation) 
###### 2. [ffmpeg](http://www.renevolution.com/ffmpeg/2013/03/16/how-to-install-ffmpeg-on-mac-os-x.html)


### Things to note
- Please use CSV file format for spread sheet
- Time format has to follow this example -> "0:00-0:20"
- ASCII characters are not recommended in "Name" column

### How to run the script

```
./cutSound.sh <CSV Name> <Source Folder> <Destination Folder>
```

### Example

```
./cutSound.sh dogData.csv V-0128 dataSet1
