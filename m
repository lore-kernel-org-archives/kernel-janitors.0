From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 18:24:22 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/3] macintosh/mediabay: replace
Message-Id: <20040917182422.GS1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49212557693587922=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234448.GH1777@us.ibm.com>
In-Reply-To: <20040916234448.GH1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============49212557693587922==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected. Also remove macro MS_TO_HZ() and
replace with msecs_to_jiffies().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/macintosh/mediabay.c	2004-09-13 17:16:08.000000000 -0700
+++ 2.6.9-rc2/drivers/macintosh/mediabay.c	2004-09-14 14:14:03.000000000 -0700
@@ -98,11 +98,6 @@ int media_bay_count = 0;
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
@@ -384,7 +379,7 @@ static inline void __pmac set_mb_power(s
 		bay->state = mb_powering_down;
 		MBDBG("mediabay%d: powering down\n", bay->index);
 	}
-	bay->timer = MS_TO_HZ(MB_POWER_DELAY);
+	bay->timer = msecs_to_jiffies(MB_POWER_DELAY);
 }
 
 static void __pmac poll_media_bay(struct media_bay_info* bay)
@@ -393,8 +388,8 @@ static void __pmac poll_media_bay(struct
 
 	if (id == bay->last_value) {
 		if (id != bay->content_id) {
-			bay->value_count += MS_TO_HZ(MB_POLL_DELAY);
-			if (bay->value_count >= MS_TO_HZ(MB_STABLE_DELAY)) {
+			bay->value_count += msecs_to_jiffies(MB_POLL_DELAY);
+			if (bay->value_count >= msecs_to_jiffies(MB_STABLE_DELAY)) {
 				/* If the device type changes without going thru
 				 * "MB_NO", we force a pass by "MB_NO" to make sure
 				 * things are properly reset
@@ -504,7 +499,7 @@ static void __pmac media_bay_step(int i)
 
 	/* If timer expired or polling IDE busy, run state machine */
 	if ((bay->state != mb_ide_waiting) && (bay->timer != 0)) {
-		bay->timer -= MS_TO_HZ(MB_POLL_DELAY);
+		bay->timer -= msecs_to_jiffies(MB_POLL_DELAY);
 		if (bay->timer > 0)
 			return;
 		bay->timer = 0;
@@ -517,13 +512,13 @@ static void __pmac media_bay_step(int i)
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
@@ -537,7 +532,7 @@ static void __pmac media_bay_step(int i)
 #ifdef CONFIG_BLK_DEV_IDE
 		MBDBG("mediabay%d: waiting IDE reset (kind:%d)\n", i, bay->content_id);
 		bay->ops->un_reset_ide(bay);
-	    	bay->timer = MS_TO_HZ(MB_IDE_WAIT);
+	    	bay->timer = msecs_to_jiffies(MB_IDE_WAIT);
 	    	bay->state = mb_ide_resetting;
 #else
 		printk(KERN_DEBUG "media-bay %d is ide (not compiled in kernel)\n", i);
@@ -547,7 +542,7 @@ static void __pmac media_bay_step(int i)
 	    
 #ifdef CONFIG_BLK_DEV_IDE
 	case mb_ide_resetting:
-	    	bay->timer = MS_TO_HZ(MB_IDE_TIMEOUT);
+	    	bay->timer = msecs_to_jiffies(MB_IDE_TIMEOUT);
 	    	bay->state = mb_ide_waiting;
 		MBDBG("mediabay%d: waiting IDE ready (kind:%d)\n", i, bay->content_id);
 	    	break;
@@ -583,7 +578,7 @@ static void __pmac media_bay_step(int i)
 			}
 			break;
 	    	} else if (bay->timer > 0)
-			bay->timer -= MS_TO_HZ(MB_POLL_DELAY);
+			bay->timer -= msecs_to_jiffies(MB_POLL_DELAY);
 	    	if (bay->timer <= 0) {
 			printk("\nIDE Timeout in bay %d !, IDE state is: 0x%02x\n",
 			       i, readb(bay->cd_base + 0x70));
@@ -641,8 +636,7 @@ static int __pmac media_bay_task(void *x
 			up(&media_bays[i].lock);
 		}
 
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(MS_TO_HZ(MB_POLL_DELAY));
+		msleep_interruptible(MB_POLL_DELAY);
 		if (signal_pending(current))
 			return 0;
 	}
@@ -690,7 +684,7 @@ static int __devinit media_bay_attach(st
 	msleep(MB_POWER_DELAY);
 	bay->content_id = MB_NO;
 	bay->last_value = bay->ops->content(bay);
-	bay->value_count = MS_TO_HZ(MB_STABLE_DELAY);
+	bay->value_count = msecs_to_jiffies(MB_STABLE_DELY);
 	bay->state = mb_empty;
 	do {
 		msleep(MB_POLL_DELAY);
@@ -746,8 +740,8 @@ static int __pmac media_bay_resume(struc
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

--===============49212557693587922==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49212557693587922==--
