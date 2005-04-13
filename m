From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 13 Apr 2005 12:11:20 +0000
Subject: [KJ] [PATCH] scsi/a100u2w: Remove custom msecs_to_jiffies and
Message-Id: <20050413121104.GA9419@argon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4906380132991901=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============4906380132991901==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the MS_TO_JIFFIES() macro with msecs_to_jiffies() from jiffies.h
The current macro is incorrect because HZ can have different values on
different architectures.
The patch also removes the JIFFIES_TO_MS() macro which is not used
anymore in the code.

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN linux-2.6.12-rc2-mm3/drivers/scsi/a100u2w.c linux-2.6.12-rc2-mm3-tk/drivers/scsi/a100u2w.c
--- linux-2.6.12-rc2-mm3/drivers/scsi/a100u2w.c	2005-03-02 08:38:12.000000000 +0100
+++ linux-2.6.12-rc2-mm3-tk/drivers/scsi/a100u2w.c	2005-04-13 13:53:19.000000000 +0200
@@ -100,10 +100,6 @@
 
 #include "a100u2w.h"
 
-
-#define JIFFIES_TO_MS(t) ((t) * 1000 / HZ)
-#define MS_TO_JIFFIES(j) ((j * HZ) / 1000)
-
 static ORC_SCB *orc_alloc_scb(ORC_HCS * hcsp);
 static void inia100SCBPost(BYTE * pHcb, BYTE * pScb);
 
@@ -160,7 +156,7 @@ static UCHAR dftNvRam[64] =
 /***************************************************************************/
 static void waitForPause(unsigned amount)
 {
-	ULONG the_time = jiffies + MS_TO_JIFFIES(amount);
+	ULONG the_time = jiffies + msecs_to_jiffies(amount);
 	while (time_before_eq(jiffies, the_time))
 		cpu_relax();
 }

--===============4906380132991901==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4906380132991901==--
