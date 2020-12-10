Pandoc
=====================================================================================================

:Penulis: Yohan Sidik

.. contents:: **Daftar Isi**

Install Pandoc
---------------------------------------------------------------------------------

`Installing pandoc`_

Markdown ke PDF
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

Markdown ke HTML
---------------------------------------------------------------------------------
     
**Simpan Template**

- buat folder di

::

	$ mkdir -p ~/.pandoc/templates/html

- simpan template di folder html

Contoh template:

- `easy pandoc templates`_

 
**Default**

::

	$ pandoc source.md -o destination.html 

**With CSS**

pandoc.css berada dalam folder yang sama dengan source.md. 

::

	$ pandoc -s -c pandoc.css source.md -o destination.html

**Install CSS Template**

Tanpa toc:

::

	$ pandoc source.md -o destination.html --template=template_name.html

Dengan toc:

::

	$ pandoc --toc source.md -o destination.html --template=template_name.html

Agar bisa dijalankan secara offline:

::

	$ pandoc -s --toc source.md -o destination.html --template=template_name.html

 
.. Referensi
 
.. _`Installing pandoc`: https://pandoc.org/installing.html 
.. _`easy pandoc templates`: https://github.com/ryangrose/easy-pandoc-templates
