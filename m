From: Christophe Lucas <clucas@rotomalug.org>
Date: Tue, 22 Mar 2005 16:24:44 +0000
Subject: [KJ] [PATCH] printk: drivers/char/agp/generic.c
Message-Id: <20050322162444.GQ14887@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="xA/XKXTdy9G3iaIz"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--xA/XKXTdy9G3iaIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--xA/XKXTdy9G3iaIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_char_agp_generic.c.diff"

diff -urpN -X dontdiff a/drivers/char/agp/generic.c b/drivers/char/agp/generic.c
--- a/drivers/char/agp/generic.c	2005-03-18 02:34:09.000000000 +0100
+++ b/drivers/char/agp/generic.c	2005-03-22 16:52:47.000000000 +0100
@@ -545,7 +545,7 @@ static void agp_v3_parse_one(u32 *reques
 		 * AGP2.x 4x -> AGP3.0 4x.
 		 */
 		if (*requested_mode & AGPSTAT2_4X) {
-			printk (KERN_INFO PFX "%s passes broken AGP3 flags (%x). Fixed.\n",
+			printk(KERN_INFO PFX "%s passes broken AGP3 flags (%x). Fixed.\n",
 						current->comm, *requested_mode);
 			*requested_mode &= ~AGPSTAT2_4X;
 			*requested_mode |= AGPSTAT3_4X;
@@ -556,7 +556,7 @@ static void agp_v3_parse_one(u32 *reques
 		 * but have been passed an AGP 2.x mode.
 		 * Convert AGP 1x,2x,4x -> AGP 3.0 4x.
 		 */
-		printk (KERN_INFO PFX "%s passes broken AGP2 flags (%x) in AGP3 mode. Fixed.\n",
+		printk(KERN_INFO PFX "%s passes broken AGP2 flags (%x) in AGP3 mode. Fixed.\n",
 					current->comm, *requested_mode);
 		*requested_mode &= ~(AGPSTAT2_4X | AGPSTAT2_2X | AGPSTAT2_1X);
 		*requested_mode |= AGPSTAT3_4X;
@@ -566,13 +566,13 @@ static void agp_v3_parse_one(u32 *reques
 		if (!(*bridge_agpstat & AGPSTAT3_8X)) {
 			*bridge_agpstat &= ~(AGPSTAT3_8X | AGPSTAT3_RSVD);
 			*bridge_agpstat |= AGPSTAT3_4X;
-			printk ("%s requested AGPx8 but bridge not capable.\n", current->comm);
+			printk(KERN_INFO PFX "%s requested AGPx8 but bridge not capable.\n", current->comm);
 			return;
 		}
 		if (!(*vga_agpstat & AGPSTAT3_8X)) {
 			*bridge_agpstat &= ~(AGPSTAT3_8X | AGPSTAT3_RSVD);
 			*bridge_agpstat |= AGPSTAT3_4X;
-			printk ("%s requested AGPx8 but graphic card not capable.\n", current->comm);
+			printk(KERN_INFO PFX "%s requested AGPx8 but graphic card not capable.\n", current->comm);
 			return;
 		}
 		/* All set, bridge & device can do AGP x8*/

--xA/XKXTdy9G3iaIz
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--xA/XKXTdy9G3iaIz--
