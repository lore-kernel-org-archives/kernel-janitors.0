From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 17:49:29 +0000
Subject: [Kernel-janitors] [PATCH] macintosh/mediabay: replace MS_TO_HZ()
Message-Id: <20040728174929.GG1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37310571192699271=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040723214854.GO2675@us.ibm.com>
In-Reply-To: <20040723214854.GO2675@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============37310571192699271==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Depends-on: Patch to mediabay.c which replaces schedule_timeout() with
msleep(), so that the removal of MS_TO_HZ has no compilation effect.

Description: Replaces MS_TO_HZ() with msecs_to_jiffies() and removes
definition of MS_TO_HZ().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/macintosh/mediabay.c	2004-07-28 10:14:57.000000000 -0700
+++ linux-dev/drivers/macintosh/mediabay.c	2004-07-28 10:10:05.000000000 -0700
@@ -17,6 +17,7 @@
 #include <linux/delay.h>
 #include <linux/sched.h>
 #include <linux/timer.h>
+#include <linux/time.h>
 #include <linux/hdreg.h>
 #include <linux/stddef.h>
 #include <linux/init.h>
@@ -98,11 +99,6 @@ int media_bay_count = 0;
 #define MB_IDE_READY(i)	((readb(media_bays[i].cd_base + 0x70) & 0x80) == 0)
 #endif
 
-/* Note: All delays are not in milliseconds and converted to HZ relative
- * values by the macro below
- */
-#define MS_TO_HZ(ms)	((ms * HZ + 999) / 1000)
-
 /*
  * Wait that number of ms between each step in normal polling mode
  */
@@ -120,26 +116,26 @@ int media_bay_count = 0;
 #define MB_POWER_DELAY	200
 
 /*
- * Hold the media-bay reset signal true for this many ticks
+ * Hold the media-bay reset signal true for this many ms
  * after a device is inserted before releasing it.
  */
 #define MB_RESET_DELAY	50
 
 /*
- * Wait this long after the reset signal is released and before doing
+ * Wait this many ms after the reset signal is released and before doing
  * further operations. After this delay, the IDE reset signal is released
  * too for an IDE device
  */
 #define MB_SETUP_DELAY	100
 
 /*
- * Wait this many ticks after an IDE device (e.g. CD-ROM) is inserted
+ * Wait this many ms after an IDE device (e.g. CD-ROM) is inserted
  * (or until the device is ready) before waiting for busy bit to disappear
  */
 #define MB_IDE_WAIT	1000
 
 /*
- * Timeout waiting for busy bit of an IDE device to go down
+ * Timeout waiting for busy bit of an IDE device to go down, in ms
  */
 #define MB_IDE_TIMEOUT	5000
 
@@ -384,7 +380,7 @@ static inline void __pmac set_mb_power(s
 		bay->state = mb_powering_down;
 		MBDBG("mediabay%d: powering down\n", bay->index);
 	}
-	bay->timer = MS_TO_HZ(MB_POWER_DELAY);
+	bay->timer = msecs_to_jiffies(MB_POWER_DELAY);
 }
 
 static void __pmac poll_media_bay(struct media_bay_info* bay)
@@ -393,8 +389,8 @@ static void __pmac poll_media_bay(struct
 
 	if (id == bay->last_value) {
 		if (id != bay->content_id) {
-			bay->value_count += MS_TO_HZ(MB_POLL_DELAY);
-			if (bay->value_count >= MS_TO_HZ(MB_STABLE_DELAY)) {
+			bay->value_count += msecs_to_jiffies(MB_POLL_DELAY);
+			if (bay->value_count >= msecs_to_jiffies(MB_STABLE_DELAY)) {
 				/* If the device type changes without going thru
 				 * "MB_NO", we force a pass by "MB_NO" to make sure
 				 * things are properly reset
@@ -503,7 +499,7 @@ static void __pmac media_bay_step(int i)
 
 	/* If timer expired or polling IDE busy, run state machine */
 	if ((bay->state != mb_ide_waiting) && (bay->timer != 0)) {
-		bay->timer -= MS_TO_HZ(MB_POLL_DELAY);
+		bay->timer -= msecs_to_jiffies(MB_POLL_DELAY);
 		if (bay->timer > 0)
 			return;
 		bay->timer = 0;
@@ -516,13 +512,13 @@ static void __pmac media_bay_step(int i)
 	    		set_mb_power(bay, 0);
 	    		break;
 	    	}
-	    	bay->timer = MS_TO_HZ(MB_RESET_DELAY);
+	    	bay->timer = msecs_to_jiffies(MB_RESET_DELAY);
 	    	bay->state = mb_enabling_bay;
 		MBDBG("mediabay%d: enabling (kind:%d)\n", i, bay->content_id);
 		break;
 	case mb_enabling_bay:
 		bay->ops->un_reset(bay);
-	    	bay->timer = MS_TO_HZ(MB_SETUP_DELAY);
+	    	bay->timer = msecs_to_jiffies(MB_SETUP_DELAY);
 	    	bay->state = mb_resetting;
 		MBDBG("mediabay%d: waiting reset (kind:%d)\n", i, bay->content_id);
 	    	break;
@@ -536,7 +532,7 @@ static void __pmac media_bay_step(int i)
 #ifdef CONFIG_BLK_DEV_IDE
 		MBDBG("mediabay%d: waiting IDE reset (kind:%d)\n", i, bay->content_id);
 		bay->ops->un_reset_ide(bay);
-	    	bay->timer = MS_TO_HZ(MB_IDE_WAIT);
+	    	bay->timer = msecs_to_jiffies(MB_IDE_WAIT);
 	    	bay->state = mb_ide_resetting;
 #else
 		printk(KERN_DEBUG "media-bay %d is ide (not compiled in kernel)\n", i);
@@ -546,7 +542,7 @@ static void __pmac media_bay_step(int i)
 	    
 #ifdef CONFIG_BLK_DEV_IDE
 	case mb_ide_resetting:
-	    	bay->timer = MS_TO_HZ(MB_IDE_TIMEOUT);
+	    	bay->timer = msecs_to_jiffies(MB_IDE_TIMEOUT);
 	    	bay->state = mb_ide_waiting;
 		MBDBG("mediabay%d: waiting IDE ready (kind:%d)\n", i, bay->content_id);
 	    	break;
@@ -582,7 +578,7 @@ static void __pmac media_bay_step(int i)
 			}
 			break;
 	    	} else if (bay->timer > 0)
-			bay->timer -= MS_TO_HZ(MB_POLL_DELAY);
+			bay->timer -= msecs_to_jiffies(MB_POLL_DELAY);
 	    	if (bay->timer <= 0) {
 			printk("\nIDE Timeout in bay %d !, IDE state is: 0x%02x\n",
 			       i, readb(bay->cd_base + 0x70));
@@ -688,7 +684,7 @@ static int __devinit media_bay_attach(st
 	msleep(MB_POWER_DELAY);
 	bay->content_id = MB_NO;
 	bay->last_value = bay->ops->content(bay);
-	bay->value_count = MS_TO_HZ(MB_STABLE_DELAY);
+	bay->value_count = msecs_to_jiffies(MB_STABLE_DELAY);
 	bay->state = mb_empty;
 	do {
 		msleep(MB_POLL_DELAY);
@@ -744,8 +740,8 @@ static int __pmac media_bay_resume(struc
 		}
 	       	set_mb_power(bay, 1);
 	       	bay->last_value = bay->content_id;
-	       	bay->value_count = MS_TO_HZ(MB_STABLE_DELAY);
-	       	bay->timer = MS_TO_HZ(MB_POWER_DELAY);
+	       	bay->value_count = msecs_to_jiffies(MB_STABLE_DELAY);
+	       	bay->timer = msecs_to_jiffies(MB_POWER_DELAY);
 #ifdef CONFIG_BLK_DEV_IDE
 	       	bay->cd_retry = 0;
 #endif

--===============37310571192699271==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37310571192699271==--
