From: Randy Dunlap <rdunlap@xenotime.net>
Date: Fri, 06 Apr 2007 18:37:13 +0000
Subject: Re: [KJ] [PATCH 5/5] Fix warnings when building 'xmldocs' target:
Message-Id: <20070406113713.efcc0763.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Multipart=_Fri__6_Apr_2007_11_37_13_-0700_zJ4_TiXOWTGzzEZV"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070406074428.GA4884@gollum.tnic>
In-Reply-To: <20070406074428.GA4884@gollum.tnic>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Fri__6_Apr_2007_11_37_13_-0700_zJ4_TiXOWTGzzEZV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 6 Apr 2007 09:44:28 +0200 Borislav Petkov wrote:

> This one fixes the case when a composite expression containing at least one \s
> is found in an array subscript braces (see include/linux/mtd/nand.h:303, for
> example)
> 
> Signed-off-by: Borislav Petkov <bbpetkov@yahoo.de>
> 
> --- kernel.orig/20-rc5/scripts/kernel-doc	2007-04-05 10:22:27.000000000 +0200
> +++ kernel/20-rc5/scripts/kernel-doc	2007-04-05 10:50:21.000000000 +0200
> @@ -1451,6 +1451,8 @@
>  	} elsif ($arg) {
>  	    $arg =~ s/\s*:\s*/:/g;
>  	    $arg =~ s/\s*\[/\[/g;
> +	    # remove array subscript braces early
> +	    # $arg =~ s/\[.*$//;
>  
>  	    my @args = split('\s*,\s*', $arg);
>  	    if ($args[0] =~ m/\*/) {

[removed mpt_linux_development@lsi.com]

Uh, you mean without the second '#' (comment), right?

I know that scripts/kernel-doc needs a patch for this problem,
but I don't care for losing the array indication & sizes that
this patch causes.  Now the generated html output for this looks like:

struct nand_buffers — buffer structure for read/write
Synopsis

struct nand_buffers {
  uint8_t ecccalc;
  uint8_t ecccode;
  uint8_t databuf;
};

but it should look like:

struct nand_buffers — buffer structure for read/write
Synopsis

struct nand_buffers {
  uint8_t ecccalc[NAND_MAX_OOBSIZE];
  uint8_t ecccode[NAND_MAX_OOBSIZE];
  uint8_t databuf[NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE];
};

or at least use "[]" to indicate arrays on those lines.

I have worked on this buglet in the past.  (scripts/kernel-doc
parsing leaves a lot to be desired.)  My patch is attached.  It
removes spaces inside [...].  After that, the script works and
the output looks like this:

struct nand_buffers — buffer structure for read/write
Synopsis

struct nand_buffers {
  uint8_t ecccalc[NAND_MAX_OOBSIZE];
  uint8_t ecccode[NAND_MAX_OOBSIZE];
  uint8_t databuf[NAND_MAX_PAGESIZE+NAND_MAX_OOBSIZE];
};  


I'll submit this patch for kernel inclusion, with some rude
comment that it's just a hack.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***



--Multipart=_Fri__6_Apr_2007_11_37_13_-0700_zJ4_TiXOWTGzzEZV
Content-Type: text/x-patch;
 name="kerndoc-struct-macro.patch"
Content-Disposition: attachment;
 filename="kerndoc-struct-macro.patch"
Content-Transfer-Encoding: 7bit

From: Randy Dunlap <randy.dunlap@oracle.com>

Unfortunately, kernel-doc has problems with a struct field like this:
	uint8_t databuf[NAND_MAX_PAGESIZE + NAND_MAX_OOBSIZE];

simply due to the spaces around the "+" sign, so drop all spaces inside
[...] so that parsing is done correctly (in some sense).

Warning(linux-2.6.20-git15/include/linux/mtd/nand.h:304): No description found for parameter 'NAND_MAX_OOBSIZE]'

This needs to sit in -mm for awhile to see if it has any adverse effects.

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 scripts/kernel-doc |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-2.6.20-git15.orig/scripts/kernel-doc
+++ linux-2.6.20-git15/scripts/kernel-doc
@@ -1470,6 +1470,12 @@ sub create_parameterlist($$$) {
 	    $arg =~ s/\s*:\s*/:/g;
 	    $arg =~ s/\s*\[/\[/g;
 
+	    # no spaces inside [array size expression];
+	    # messes up split/pop/shift/unshift below;
+	    while ($arg =~ m/\[.*\s.*\]/) {
+		$arg =~ s/\[(.*)\s(.*)\]/\[$1$2\]/;
+	    }
+
 	    my @args = split('\s*,\s*', $arg);
 	    if ($args[0] =~ m/\*/) {
 		$args[0] =~ s/(\*+)\s*/ $1/;



--Multipart=_Fri__6_Apr_2007_11_37_13_-0700_zJ4_TiXOWTGzzEZV
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

--Multipart=_Fri__6_Apr_2007_11_37_13_-0700_zJ4_TiXOWTGzzEZV--
