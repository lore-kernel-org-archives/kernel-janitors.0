From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 17:53:33 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 12/15] isdn/icn: replace
Message-Id: <20040917175333.GM1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27494089504425934=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27494089504425934==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/icn/icn.c	2004-09-13 17:16:04.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/icn/icn.c	2004-09-14 11:27:07.000000000 -0700
@@ -762,8 +762,7 @@ icn_check_loader(int cardnumber)
 #ifdef BOOT_DEBUG
 			printk(KERN_DEBUG "Loader %d TO?\n", cardnumber);
 #endif
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(ICN_BOOT_TIMEOUT1);
+			msleep_interruptible(ICN_BOOT_TIMEOUT1);
 		} else {
 #ifdef BOOT_DEBUG
 			printk(KERN_DEBUG "Loader %d OK\n", cardnumber);
@@ -788,8 +787,7 @@ icn_check_loader(int cardnumber)
 int slsec = sec; \
   printk(KERN_DEBUG "SLEEP(%d)\n",slsec); \
   while (slsec) { \
-    current->state = TASK_INTERRUPTIBLE; \
-    schedule_timeout(HZ); \
+    msleep_interruptible(1000); \
     slsec--; \
   } \
 }
@@ -950,7 +948,7 @@ icn_loadproto(u_char __user * buffer, ic
 				icn_maprelease_channel(card, 0);
 				return -EIO;
 			}
-			current->state = TASK_INTERRUPTIBLE;
+			set_current_state(TASK_INTERRUPTIBLE);
 			schedule_timeout(10);
 		}
 	}
@@ -974,8 +972,7 @@ icn_loadproto(u_char __user * buffer, ic
 #ifdef BOOT_DEBUG
 			printk(KERN_DEBUG "Proto TO?\n");
 #endif
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(ICN_BOOT_TIMEOUT1);
+			msleep_interruptible(ICN_BOOT_TIMEOUT1);
 		} else {
 			if ((card->secondhalf) || (!card->doubleS0)) {
 #ifdef BOOT_DEBUG
@@ -1271,9 +1268,9 @@ icn_command(isdn_ctrl * c, icn_card * ca
 						if (!card->leased) {
 							card->leased = 1;
 							while (card->ptype == ISDN_PTYPE_UNKNOWN) {
-								schedule_timeout(ICN_BOOT_TIMEOUT1);
+								msleep_interruptible(ICN_BOOT_TIMEOUT1);
 							}
-							schedule_timeout(ICN_BOOT_TIMEOUT1);
+							msleep_interruptible(ICN_BOOT_TIMEOUT1);
 							sprintf(cbuf, "00;FV2ON\n01;EAZ%c\n02;EAZ%c\n",
 								(a & 1)?'1':'C', (a & 2)?'2':'C');
 							i = icn_writecmd(cbuf, strlen(cbuf), 0, card);

--===============27494089504425934==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27494089504425934==--
