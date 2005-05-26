From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Thu, 26 May 2005 15:07:24 +0000
Subject: [KJ] [PATCH 2.6.11.10] arch/arm: fixes static strings declaration
Message-Id: <20050526120724.5f1552fb.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Multipart=_Thu__26_May_2005_12_07_24_-0300_v8U4IpeFyMPr_d8e"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Thu__26_May_2005_12_07_24_-0300_v8U4IpeFyMPr_d8e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

o Fixes strings declaration from char *str = ""; to char str[] = "";,
  avoiding the extra pointer, as noted by Jeff Garzik.  The strings'
  contents are not changed after declared.

 arch/arm/mm/mm-armv.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

Signed-off-by: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>

--Multipart=_Thu__26_May_2005_12_07_24_-0300_v8U4IpeFyMPr_d8e
Content-Type: text/plain;
 name="string_fix_arch_arm_mm.patch"
Content-Disposition: attachment;
 filename="string_fix_arch_arm_mm.patch"
Content-Transfer-Encoding: 7bit

diff -urNp -X dontdiff linux-2.6.11.10/arch/arm/mm/mm-armv.c mod-linux-2.6.11.10/arch/arm/mm/mm-armv.c
--- linux-2.6.11.10/arch/arm/mm/mm-armv.c	2005-05-16 14:50:30.000000000 -0300
+++ mod-linux-2.6.11.10/arch/arm/mm/mm-armv.c	2005-05-25 23:57:16.000000000 -0300
@@ -102,14 +102,14 @@ static void __init early_cachepolicy(cha
 
 static void __init early_nocache(char **__unused)
 {
-	char *p = "buffered";
+	char p[] = "buffered";
 	printk(KERN_WARNING "nocache is deprecated; use cachepolicy=%s\n", p);
 	early_cachepolicy(&p);
 }
 
 static void __init early_nowrite(char **__unused)
 {
-	char *p = "uncached";
+	char p[] = "uncached";
 	printk(KERN_WARNING "nowb is deprecated; use cachepolicy=%s\n", p);
 	early_cachepolicy(&p);
 }

--Multipart=_Thu__26_May_2005_12_07_24_-0300_v8U4IpeFyMPr_d8e
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Multipart=_Thu__26_May_2005_12_07_24_-0300_v8U4IpeFyMPr_d8e--
