From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:17:28 +0000
Subject: [Kernel-janitors] [PATCH] message/mptbase: replace
Message-Id: <20040726231728.GZ1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15705833191224206=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============15705833191224206==
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

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/message/fusion/mptbase.c	2004-06-16 05:19:01.000000000 +0000
+++ linux-dev/drivers/message/fusion/mptbase.c	2004-07-12 18:56:59.000000000 +0000
@@ -3117,12 +3117,10 @@ mpt_downloadboot(MPT_ADAPTER *ioc, int s
 		CHIPREG_WRITE32(&ioc->chip->WriteSequence, MPI_WRSEQ_5TH_KEY_VALUE);
 
 		/* wait 100 msec */
-		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(100 * HZ / 1000);
-		} else {
+		if (sleepFlag == CAN_SLEEP)
+			msleep (100);
+		else
 			mdelay (100);
-		}
 
 		count++;
 		if (count > 20) {
@@ -3351,12 +3349,10 @@ KickStart(MPT_ADAPTER *ioc, int force, i
 		 */
 		SendIocReset(ioc, MPI_FUNCTION_IOC_MESSAGE_UNIT_RESET, sleepFlag);
 
-		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ);
-		} else {
+		if (sleepFlag == CAN_SLEEP)
+			msleep (1000);
+		else
 			mdelay (1000);
-		}
 	}
 
 	hard_reset_done = mpt_diag_reset(ioc, force, sleepFlag);
@@ -3445,12 +3441,10 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 			CHIPREG_WRITE32(&ioc->chip->WriteSequence, MPI_WRSEQ_5TH_KEY_VALUE);
 
 			/* wait 100 msec */
-			if (sleepFlag == CAN_SLEEP) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(100 * HZ / 1000);
-			} else {
+			if (sleepFlag == CAN_SLEEP)
+				msleep (100);
+			else
 				mdelay (100);
-			}
 
 			count++;
 			if (count > 20) {
@@ -3538,12 +3532,10 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 				}
 
 				/* wait 1 sec */
-				if (sleepFlag == CAN_SLEEP) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(HZ);
-				} else {
+				if (sleepFlag == CAN_SLEEP)
+					msleep (1000);
+				else
 					mdelay (1000);
-				}
 			}
 			if ((count = mpt_downloadboot(ioc, sleepFlag)) < 0) {
 				printk(KERN_WARNING MYNAM
@@ -3566,12 +3558,10 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 				}
 
 				/* wait 1 sec */
-				if (sleepFlag == CAN_SLEEP) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(HZ);
-				} else {
+				if (sleepFlag == CAN_SLEEP)
+					msleep (1000);
+				else
 					mdelay (1000);
-				}
 			}
 		}
 	}
@@ -3600,12 +3590,10 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 		CHIPREG_WRITE32(&ioc->chip->WriteSequence, MPI_WRSEQ_5TH_KEY_VALUE);
 
 		/* wait 100 msec */
-		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(100 * HZ / 1000);
-		} else {
+		if (sleepFlag == CAN_SLEEP)
+			msleep (100);
+		else
 			mdelay (100);
-		}
 
 		count++;
 		if (count > 20) {

--===============15705833191224206==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15705833191224206==--
