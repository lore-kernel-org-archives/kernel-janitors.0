From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 17 Mar 2004 17:30:22 +0000
Subject: Re: [Kernel-janitors] Patch to make html docs properly
Message-Id: <20040317093022.694f4645.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1079469668.5026.13.camel@localhost>
In-Reply-To: <1079469668.5026.13.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 16 Mar 2004 20:41:08 +0000 Don Scorgie wrote:

| hi,
| 
| When making htmldocs, the front file (*.html in the Documantation/
| DocBook directory) sends the user to the wrong file (as far as I can
| tell).  This little patch fixes this.
| 
| Hope this is ok.  If this is, I hope to fix up some of the API
| references...
| 
| 
| diff -Nur linux-2.6.4/Documentation/DocBook/Makefile linux-2.6.4.bak/
| Documentation/DocBook/Makefile
| --- linux-2.6.4/Documentation/DocBook/Makefile  2004-03-16
| 20:29:59.625122885 +0000
| +++ linux-2.6.4.bak/Documentation/DocBook/Makefile      2004-03-16
| 20:26:21.503805414 +0000
| @@ -124,7 +124,7 @@
|   
|  quiet_cmd_db2html = DB2HTML $@
|        cmd_db2html = db2html -o $(patsubst %.html,%,$@) $< &&
| \
| -               echo '<a HREF="$(patsubst %.html,%,$(notdir $@))/index.
| html"> \
| +               echo '<a HREF="$(patsubst %.html,%,$(notdir $@))/book1.
| html"> \

That's already fixed in 2.6.5-rc1.

And one of us has a mailer that breaks lines at very bad places....

But send more API fixups if you have them.  We'll get your^W the
mail client fixed up....

--
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
