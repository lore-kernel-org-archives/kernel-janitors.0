From: Don Scorgie <DonScorgie@Blueyonder.co.uk>
Date: Tue, 16 Mar 2004 20:41:08 +0000
Subject: [Kernel-janitors] Patch to make html docs properly
Message-Id: <1079469668.5026.13.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

When making htmldocs, the front file (*.html in the Documantation/
DocBook directory) sends the user to the wrong file (as far as I can
tell).  This little patch fixes this.

Hope this is ok.  If this is, I hope to fix up some of the API
references...

Thanks
Don


diff -Nur linux-2.6.4/Documentation/DocBook/Makefile linux-2.6.4.bak/
Documentation/DocBook/Makefile
--- linux-2.6.4/Documentation/DocBook/Makefile  2004-03-16
20:29:59.625122885 +0000
+++ linux-2.6.4.bak/Documentation/DocBook/Makefile      2004-03-16
20:26:21.503805414 +0000
@@ -124,7 +124,7 @@
  
 quiet_cmd_db2html = DB2HTML $@
       cmd_db2html = db2html -o $(patsubst %.html,%,$@) $< &&
\
-               echo '<a HREF="$(patsubst %.html,%,$(notdir $@))/index.
html"> \
+               echo '<a HREF="$(patsubst %.html,%,$(notdir $@))/book1.
html"> \
          Goto $(patsubst %.html,%,$(notdir $@))</a><p>' > $@
  
 %.html:        %.sgml


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
