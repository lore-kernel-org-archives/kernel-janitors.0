From: Tracey Dent <tdent48227@gmail.com>
Date: Wed, 06 Oct 2010 01:00:43 +0000
Subject: [PATCH 28/28] Staging: comedi: drivers: amcc_s5933.h:  Edit file so that checkpatch.pl has 2 warning
Message-Id: <1286326843-6170-28-git-send-email-tdent48227@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
In-Reply-To: <1286326843-6170-1-git-send-email-tdent48227@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: greg@kroah.com, abbotti@mev.co.uk, fmhess@users.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tracey Dent <tdent48227@gmail.com>

Changed a few lines that made checkpatch.pl complain. Could not get ever error but
I got it down to to just two, WARNING: line over 80 characters.

Signed-off-by: Tracey Dent <tdent48227@gmail.com>
---
 drivers/staging/comedi/drivers/amcc_s5933.h |   26 +++++++++++++-------------
 1 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/comedi/drivers/amcc_s5933.h b/drivers/staging/comedi/drivers/amcc_s5933.h
index b810d5f..e87c4e7 100644
--- a/drivers/staging/comedi/drivers/amcc_s5933.h
+++ b/drivers/staging/comedi/drivers/amcc_s5933.h
@@ -1,15 +1,15 @@
 /*
-    comedi/drivers/amcc_s5933.h
+	comedi/drivers/amcc_s5933.h
 
-    Stuff for AMCC S5933 PCI Controller
+	Stuff for AMCC S5933 PCI Controller
 
-    Author: Michal Dobes <dobes@tesnet.cz>
+	Author: Michal Dobes <dobes@tesnet.cz>
 
-    Inspirated from general-purpose AMCC S5933 PCI Matchmaker driver
-    made by Andrea Cisternino  <acister@pcape1.pi.infn.it>
-    and as result of espionage from MITE code made by David A. Schleef.
-    Thanks to AMCC for their on-line documentation and bus master DMA
-    example.
+	Inspirated from general-purpose AMCC S5933 PCI Matchmaker driver
+	made by Andrea Cisternino  <acister@pcape1.pi.infn.it>
+	and as result of espionage from MITE code made by David A. Schleef.
+	Thanks to AMCC for their on-line documentation and bus master DMA
+	example.
 */
 
 #ifndef _AMCC_S5933_H_
@@ -41,7 +41,7 @@
 #define  AMCC_OP_REG_MCSR_NVCMD  (AMCC_OP_REG_MCSR + 3)	/* Command in byte 3 */
 
 #define AMCC_FIFO_DEPTH_DWORD	8
-#define AMCC_FIFO_DEPTH_BYTES	(8 * sizeof (u32))
+#define AMCC_FIFO_DEPTH_BYTES	(8 * sizeof(u32))
 
 /****************************************************************************/
 /* AMCC - PCI Interrupt Control/Status Register                            */
@@ -145,12 +145,12 @@
 #define AINT_READ_COMPL		0x00008000
 #define AINT_WRITE_COMPL	0x00004000
 
-#define AINT_OMB_ENABLE 	0x00001000
-#define AINT_OMB_SELECT 	0x00000c00
+#define AINT_OMB_ENABLE		0x00001000
+#define AINT_OMB_SELECT		0x00000c00
 #define AINT_OMB_BYTE		0x00000300
 
-#define AINT_IMB_ENABLE 	0x00000010
-#define AINT_IMB_SELECT 	0x0000000c
+#define AINT_IMB_ENABLE		0x00000010
+#define AINT_IMB_SELECT		0x0000000c
 #define AINT_IMB_BYTE		0x00000003
 
 /* these are bits from various different registers, needs cleanup XXX */
-- 
1.7.3.1.50.g1e633

