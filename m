From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 21:14:12 +0000
Subject: [Kernel-janitors] [PATCH] pci/cpci_hotplug_core: replace
Message-Id: <20040727211412.GO3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28530518311506015=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28530518311506015==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-vanilla/drivers/pci/hotplug/cpci_hotplug_core.c	2004-06-16 05:19:22.000000000 +0000
+++ linux-dev/drivers/pci/hotplug/cpci_hotplug_core.c	2004-07-12 22:10:14.000000000 +0000
@@ -513,11 +513,10 @@ event_thread(void *data)
 			break;
 		while(controller->ops->query_enum()) {
 			rc = check_slots();
-			if(rc > 0) {
+			if(rc > 0)
 				/* Give userspace a chance to handle extraction */
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(HZ / 2);
-			} else if(rc < 0) {
+				msleep(500);
+			else if(rc < 0) {
 				dbg("%s - error checking slots", __FUNCTION__);
 				thread_finished = 1;
 				break;
@@ -568,11 +567,10 @@ poll_thread(void *data)
 
 		while(controller->ops->query_enum()) {
 			rc = check_slots();
-			if(rc > 0) {
+			if(rc > 0)
 				/* Give userspace a chance to handle extraction */
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(HZ / 2);
-			} else if(rc < 0) {
+				msleep(500);
+			else if(rc < 0) {
 				dbg("%s - error checking slots", __FUNCTION__);
 				thread_finished = 1;
 				break;
@@ -595,8 +593,7 @@ poll_thread(void *data)
 			}
 		}
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ / 10);
+		msleep(100);
 	}
 	dbg("poll thread signals exit");
 	up(&thread_exit);

--===============28530518311506015==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28530518311506015==--
