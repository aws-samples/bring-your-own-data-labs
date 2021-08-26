+++
title = "Prerequisites"
weight = 12
pre = "<b>1.2 </b>"
+++

Before getting straight into the lab, you need to follow these preparation steps. The labs are designed in a "bring your own data" mindset, these instructions are here to help you prepare your own dataset.
 
- Choose your preferred dataset.
  - The best way is to bring your data, but if you just want to trial the workshop, you can use sample public datasets:
  - You can download free samples from different websites. https://www.kaggle.com/ is a good example that we used before. Most probably the dataset will include date column(s), which will be used a lot in the labs.
  - If you want to start with a data sample right away, you can use the one [here](https://console.aws.amazon.com/s3/buckets/serverless-analytics?region=us-east-1&prefix=NYC-Pub/singleyellow/&showversions=false).
- Your dataset size should not exceed **2 – 3 GB max**.
- Data row size should not exceed **1MB**
- Data with multiple related tables via foreign keys are supported in the context of this workshop.
- Data with nested fields like JSON structures are **NOT** supported in the context of this workshop.
- Structure your data in Amazon S3 so that each table would be in a separate folder, with the whole data in separate bucket. (explained in lab 1)
```markdown
    raw
    ├── TABLE-NAME-1
    │   ├── LOAD00000001.csv    
    │   └── LOAD00000002.csv           
    └── TABLE-NAME-2
        ├── LOAD00000001.csv    
        └── LOAD00000002.csv                  
```
- Before uploading your data files to Amazon S3, make sure the files are **UTF-8** encoding format. The best way is to set the encoding during file creation. But if, for some reason, you already have files supplied to you, there are some tools to guess the encoding of the files (Encoding is somewhat complex subject. Here is a [post from Joel Spolsky's blog](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/)). Here are some suggestions:

## File Encoding - UTF-8

## Determining encoding with "file" :
From a Terminal window on OSX:
```bash
file -I {filename}
```
From a Terminal window on Linux:
```bash
file -i {filename}
```

### Determining encoding with "enca":
First, install `enca` (for Ubuntu: `sudo apt-get install enca`)
```bash
enca -L en file.htm    # "en" is for English
```

### Converting to UTF-8:
First, install `iconv` (for Ubuntu: `sudo apt-get install libc6-dev`)
```bash
iconv -f ASCII -t UTF-8    # ASCII is the current format that you have determined
```

## WINDOWS:
- EncodingChecker is an open-source tool for determining encoding format: https://archive.codeplex.com/?p=encodingchecker
- Notepad++ can also be used to open files and convert to UTF-8 by choosing "Encoding > Convert to UTF-8" and then, saving the file.
