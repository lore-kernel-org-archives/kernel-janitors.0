From: Carlo Perassi <carlo@linux.it>
Date: Tue, 09 Aug 2005 14:09:40 +0000
Subject: [KJ] [PATCH] removing odd number of parentheses
Message-Id: <20050809140939.GA4603@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50730764983144128=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============50730764983144128==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Taking the idea from Alexey Dobriyan, I made those short trivial
janitor patches.

I'd also suggest to add to the current TODO list something like
"Even though it is not mandatory to Lindent each .[ch] file, make sure
it does not output anything to stderr when processed with it."
IMHO there are interesting things to do on this topic.

Signed-off-by: Carlo Perassi <carlo@linux.it>
---
--- linux-2.6.13-rc6/arch/ppc/syslib/qspan_pci.c	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc6-mod/arch/ppc/syslib/qspan_pci.c	2005-08-09 10:03:28.000000000 +0200
@@ -366,13 +366,13 @@ int qspan_pcibios_find_class(unsigned in
 }
 
 void __init
-m8xx_pcibios_fixup(void))
+m8xx_pcibios_fixup(void)
 {
    /* Lots to do here, all board and configuration specific. */
 }
 
 void __init
-m8xx_setup_pci_ptrs(void))
+m8xx_setup_pci_ptrs(void)
 {
 	set_config_access_method(qspan);
 

--- linux-2.6.13-rc6/drivers/video/sis/sis_main.c	2005-06-17 21:48:29.000000000 +0200
+++ linux-2.6.13-rc6-mod/drivers/video/sis/sis_main.c	2005-08-09 10:19:53.000000000 +0200
@@ -4411,7 +4411,7 @@ static void __devinit sisfb_post_sis3153
 
 	/* Get memory type */
 	if(ivideo->sishw_ext.UseROM) {
-	   if(ivideo->sishw_ext.pjVirtualRomBase[0x52] & 0x80)) {
+	   if(ivideo->sishw_ext.pjVirtualRomBase[0x52] & 0x80) {
 	      memtype = ivideo->sishw_ext.pjVirtualRomBase[0x52];
  	   } else {
 	      inSISIDXREG(SISSR,0x3a,memtype);

--===============50730764983144128==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50730764983144128==--
