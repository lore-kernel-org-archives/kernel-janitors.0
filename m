From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:11:52 +0000
Subject: [KJ] [PATCH 22/53] fb: Clean up printk()'s in drivers/video/fbmon.c
Message-Id: <20050125231146.10418.82204.73536@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22671581800439511=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22671581800439511==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/fbmon.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/fbmon.c linux-2.6.11-rc2-mm1/drivers/video/fbmon.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/fbmon.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/fbmon.c	2005-01-24 19:07:03.108260370 -0500
@@ -44,7 +44,7 @@
 #undef DEBUG  /* define this for verbose EDID parsing output */
 
 #ifdef DEBUG
-#define DPRINTK(fmt, args...) printk(fmt,## args)
+#define DPRINTK(fmt, args...) pr_debug("%s(): ", fmt, __FUNCTION__, ## args)
 #else
 #define DPRINTK(fmt, args...)
 #endif
@@ -106,7 +106,7 @@
 	for (i = 0; i < ARRAY_SIZE(brokendb); i++) {
 		if (!strncmp(manufacturer, brokendb[i].manufacturer, 4) &&
 			brokendb[i].model == model) {
-			printk("fbmon: The EDID Block of "
+			pr_info("fbmon: The EDID Block of "
 			       "Manufacturer: %s Model: 0x%x is known to "
 			       "be broken,\n",  manufacturer, model);
  			fix = brokendb[i].fix;
@@ -139,11 +139,11 @@
 
 	switch (fix) {
 	case FBMON_FIX_HEADER:
-		printk("fbmon: trying a header reconstruct\n");
+		pr_info("fbmon: trying a header reconstruct\n");
 		memcpy(edid, edid_v1_header, 8);
 		break;
 	case FBMON_FIX_INPUT:
-		printk("fbmon: trying to fix input type\n");
+		pr_info("fbmon: trying to fix input type\n");
 		b = edid + EDID_STRUCT_DISPLAY;
 		b[0] &= ~0x80;
 		edid[127] += 0x80;
@@ -767,7 +767,7 @@
 		specs->misc |= FB_MISC_1ST_DETAIL;
 	}
 	if (c & 0x01) {
-		printk("      Display is GTF capable\n");
+		DPRINTK("      Display is GTF capable\n");
 		specs->gtf = 1;
 	}
 }

--===============22671581800439511==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22671581800439511==--
