From: Michael Veeck <michael.veeck@gmx.net>
Date: Thu, 26 Feb 2004 21:17:30 +0000
Subject: [Kernel-janitors] [PATCH] sound/oss MIN/MAX removal
Message-Id: <403E626A.5030803@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070904020701070501000206"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070904020701070501000206
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.3) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Best Regards
Michael



--------------070904020701070501000206
Content-Type: text/plain;
 name="minmax_sound_oss.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_sound_oss.patch"

diff -Nau linux-2.6.3.org/sound/oss/nm256_audio.c linux-2.6.3.test/sound/oss/nm256_audio.c
--- linux-2.6.3.org/sound/oss/nm256_audio.c	2004-02-18 04:57:45.000000000 +0100
+++ linux-2.6.3.test/sound/oss/nm256_audio.c	2004-02-26 20:50:58.645851864 +0100
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pm.h>
 #include <linux/delay.h>
@@ -450,9 +451,6 @@
     }
 }

-/* Ultra cheez-whiz.  But I'm too lazy to grep headers. */
-#define MIN(X,Y) ((X) < (Y) ? (X) : (Y))
-
 /* 
  * Read the last-recorded block from the ring buffer, copy it into the
  * saved buffer pointer, and invoke DMAuf_inputintr() with the recording
@@ -480,7 +478,7 @@
 	/* If we wrapped around, copy everything from the start of our
 	   recording buffer to the end of the buffer. */
 	if (currptr < card->curRecPos) {
-	    u32 amt = MIN (ringsize - card->curRecPos, amtToRead);
+	    u32 amt = min (ringsize - card->curRecPos, amtToRead);
 
 	    nm256_readBuffer8 (card, card->recBuf, 1,
 				 card->abuf2 + card->curRecPos,
@@ -493,7 +491,7 @@
 	}
 
 	if ((card->curRecPos < currptr) && (amtToRead > 0)) {
-	    u32 amt = MIN (currptr - card->curRecPos, amtToRead);
+	    u32 amt = min (currptr - card->curRecPos, amtToRead);
 	    nm256_readBuffer8 (card, card->recBuf, 1,
 				 card->abuf2 + card->curRecPos, amt);
 	    card->curRecPos = ((card->curRecPos + amt) % ringsize);
@@ -503,9 +501,8 @@
 	DMAbuf_inputintr (card->dev_for_record);
     }
 }
-#undef MIN
 
-/*
+/*
  * Initialize the hardware.
  */
 static void
diff -Nau linux-2.6.3.org/sound/oss/soundcard.c linux-2.6.3.test/sound/oss/soundcard.c
--- linux-2.6.3.org/sound/oss/soundcard.c	2004-02-18 04:57:56.000000000 +0100
+++ linux-2.6.3.test/sound/oss/soundcard.c	2004-02-26 20:51:45.294760152 +0100
@@ -136,10 +136,6 @@
 	return 0;
 }
 
-#ifndef MIN
-#define MIN(a,b) (((a) < (b)) ? (a) : (b))
-#endif
-
 /* 4K page size but our output routines use some slack for overruns */
 #define PROC_BLOCK_SIZE (3*1024)
--------------070904020701070501000206
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070904020701070501000206--
