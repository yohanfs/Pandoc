Pandoc
=====================================================================================================

:Penulis: Yohan Sidik

.. contents:: **Daftar Isi**

Konversi dari Markdown ke PDF
---------------------------------------------------------------------------------

- Simple setting

::

    pandoc -o file.pdf file.md


- Xelatex

::

    pandoc --pdf-engine=xelatex -o file.pdf file.md 


- Ukuran page

::

    pandoc --pdf-engine=xelatex --variable geometry=a4paper -o file.pdf file.md 


- Margin

::

    pandoc --pdf-engine=xelatex --variable geometry:"top=2cm, bottom=2cm, left=2cm, right=2cm" --variable geometry=a4paper -o file.pdf file.md 


**Makefile**

Untuk memudahkan mengkonversi banyak file sekaligus, bisa menggunakan makefile sebagai berikut:

::

        SOURCE := $(wildcard *.md) $(wildcard */*.md) 
        
        EXPORTED = $(SOURCE:.md=.pdf)
        
        all: $(EXPORTED)
        
        %.pdf: %.md
        	pandoc --pdf-engine=xelatex \
        	--variable geometry:"top=3cm, bottom=3cm, left=3cm, right=3cm" \
        	--variable geometry:a4paper \
        	-o $@ $<
        
