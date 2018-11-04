(asdf:defsystem tesseract-blob-v3
  :author "Pavel Korolev"
  :description "Foreign library collection of Tesseract OCR library"
  :license "MIT"
  :defsystem-depends-on (:bodge-blobs-support)
  :class :bodge-blob-system
  :depends-on (base-blobs)
  :libraries (((:darwin :x86-64) "libtesseract.dylib.bodged" "x86_64/")
              ((:darwin :x86) "libtesseract.dylib.bodged" "x86/")
              ((:unix (:not :darwin) :x86-64) "libtesseract.so.bodged" "x86_64/")
              ((:unix (:not :darwin) :x86) "libtesseract.so.bodged" "x86/")
              ((:windows :x86-64) "libtesseract.dll.bodged" "x86_64/")
              ((:windows :x86) "libtesseract.dll.bodged" "x86/")))
