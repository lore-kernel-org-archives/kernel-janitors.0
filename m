From: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>
Date: Thu, 26 May 2005 15:25:02 +0000
Subject: [KJ] [PATCH 2.6.11.10] arch/cris: fixes static strings declaration
Message-Id: <20050526122502.7aa13915.rnsanchez@terra.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Multipart=_Thu__26_May_2005_12_25_02_-0300_n2KAf0Blz7kKDcRv"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Thu__26_May_2005_12_25_02_-0300_n2KAf0Blz7kKDcRv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

o Fixes strings declaration from char *str = ""; to char str[] = "";,
  avoiding the extra pointer, as noted by Jeff Garzik.  The strings'
  contents are not changed after declared.

 arch/cris/arch-v10/drivers/axisflashmap.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)

Signed-off-by: Ricardo Nabinger Sanchez <rnsanchez@terra.com.br>

--Multipart=_Thu__26_May_2005_12_25_02_-0300_n2KAf0Blz7kKDcRv
Content-Type: text/plain;
 name="string_fix_arch_cris.patch"
Content-Disposition: attachment;
 filename="string_fix_arch_cris.patch"
Content-Transfer-Encoding: 7bit

diff -urNp -X dontdiff linux-2.6.11.10/arch/cris/arch-v10/drivers/axisflashmap.c mod-linux-2.6.11.10/arch/cris/arch-v10/drivers/axisflashmap.c
--- linux-2.6.11.10/arch/cris/arch-v10/drivers/axisflashmap.c	2005-05-16 14:50:30.000000000 -0300
+++ mod-linux-2.6.11.10/arch/cris/arch-v10/drivers/axisflashmap.c	2005-05-25 23:59:46.000000000 -0300
@@ -393,7 +393,7 @@ static int __init init_axis_flash(void)
 	struct partitiontable_head *ptable_head = NULL;
 	struct partitiontable_entry *ptable;
 	int use_default_ptable = 1; /* Until proven otherwise. */
-	const char *pmsg = "  /dev/flash%d at 0x%08x, size 0x%08x\n";
+	const char pmsg[] = "  /dev/flash%d at 0x%08x, size 0x%08x\n";
 
 	if (!(mymtd = flash_probe())) {
 		/* There's no reason to use this module if no flash chip can

--Multipart=_Thu__26_May_2005_12_25_02_-0300_n2KAf0Blz7kKDcRv
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Multipart=_Thu__26_May_2005_12_25_02_-0300_n2KAf0Blz7kKDcRv--
