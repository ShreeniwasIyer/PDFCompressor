# PDF compressor

The genesis for this code was in the [blog post I wrote a while back](http://tech.shreeni.info/2013/07/compressing-all-pdf-files-in-directory.html). Read that to understand the purpose of this code.

The docker image is readily available at [https://hub.docker.com/r/shreeniwasiyer/pdfcompressor/](https://hub.docker.com/r/shreeniwasiyer/pdfcompressor/)

## Run Instructions

Run it on the volume you want to and mount it to a folder you like, such as /pdfs as indicated below:


```
docker run -it -v /Volumes/FINENC/:/pdfs/ shreeniwasiyer/pdfcompressor bash
```

## Build Instructions

```
docker build -t pdfcompressor .
```

Run it on the volume you want to and mount it to a folder you like, such as /pdfs as indicated below:

```
#Replace Volume mount information as per your needs
docker run -it -v /Volumes/FINENC/:/pdfs/ pdfcompressor bash
```

In the docker container, you can run the compressor.sh like this:

```
root@a0b035f73364:/# compressor.sh /pdfs/ 100000
Running the Compressor on /pdfs/ and 100000
Compressed into /pdfs/.Trashes/501/compressed-2017-07-01.pdf
Compressed into /pdfs/.Trashes/501/Cash (USD)/compressed-13.8.pdf
Renaming Too-Small File /pdfs/.Trashes/501/Cash (USD)/18.00.pdf
Renaming Too-Small File /pdfs/.Trashes/501/Cash (USD)/18.pdf
Compressed into /pdfs/.Trashes/501/Cash (USD)/compressed-19.pdf
Compressed into /pdfs/.Trashes/501/Cash (USD)/compressed-2.75.pdf
Compressed into /pdfs/.Trashes/501/Cash (USD)/compressed-5.5.pdf
Renaming Too-Small File /pdfs/.Trashes/501/2015-09-30.pdf
Renaming Too-Small File /pdfs/.Trashes/501/2015-08-31.pdf
```

### Known Issues

If the first parameter (i.e. /pdfs/ in the above case) has a space, then the script doesn't work correctly.

### Other known Issues

You might occasionally run into these kind of errors - these are a result of poorly formed PDFs in the first place. You can ignore them.

1)

   **** Warning: /BBox has zero width or height, which is not allowed.

   **** This file had errors that were repaired or ignored.
   **** The file was produced by:
   **** >>>> iText 2.0.7 (by lowagie.com) <<<<
   **** Please notify the author of the software that produced this
   **** file that it does not conform to Adobe's published PDF
   **** specification.

2)

   **** Warning:  An error occurred while reading an XREF table.
   **** The file has been damaged.  This may have been caused
   **** by a problem while converting or transfering the file.
   **** Ghostscript will attempt to recover the data.

   **** This file had errors that were repaired or ignored.
   **** The file was produced by:
   **** >>>> Microsoft? PowerPoint? 2010 <<<<
   **** Please notify the author of the software that produced this
   **** file that it does not conform to Adobe's published PDF
   **** specification.


3)
   **** Warning: considering '0000000000 XXXXX n' as a free entry.

   **** This file had errors that were repaired or ignored.
   **** The file was produced by:
   **** >>>> Mac OS X 10.10.5 Quartz PDFContext <<<<
   **** Please notify the author of the software that produced this
   **** file that it does not conform to Adobe's published PDF
   **** specification.

4)
   **** Warning:  An error occurred while reading an XREF table.
   **** The file has been damaged.  This may have been caused
   **** by a problem while converting or transfering the file.
   **** Ghostscript will attempt to recover the data.

   **** This file had errors that were repaired or ignored.
   **** The file was produced by:
   **** >>>> Microsoft? Office Word 2007 <<<<
   **** Please notify the author of the software that produced this
   **** file that it does not conform to Adobe's published PDF
   **** specification.

5)
**** Warning:  An error occurred while reading an XREF table.
**** The file has been damaged.  This may have been caused
**** by a problem while converting or transfering the file.
**** Ghostscript will attempt to recover the data.
**** Warning: stream Length incorrect.

**** This file had errors that were repaired or ignored.
**** The file was produced by:
**** >>>> Canon iR C3580                   <<<<
**** Please notify the author of the software that produced this
**** file that it does not conform to Adobe's published PDF
**** specification.


6)


   **** Warning: considering '0000000000 XXXXX n' as a free entry.
   **** Warning: considering '0000000000 XXXXX n' as a free entry.
   **** Warning: considering '0000000000 XXXXX n' as a free entry.
   **** Warning: considering '0000000000 XXXXX n' as a free entry.

   **** This file had errors that were repaired or ignored.
   **** The file was produced by:
   **** >>>> Mac OS X 10.11.6 Quartz PDFContext <<<<
   **** Please notify the author of the software that produced this
   **** file that it does not conform to Adobe's published PDF
   **** specification.
