From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 01 Sep 2004 22:50:24 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc1-bk7] message/mptbase: replace
Message-Id: <20040901225024.GH2516@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53355788354746059=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040901222224.GD2516@us.ibm.com>
In-Reply-To: <20040901222224.GD2516@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============53355788354746059==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is one of 10 patches which have either not been pushed to mainline
(2.6.9-rc1-bk7) or have not been included in any of the recent kjt's.

Applys-to: 2.6.9-rc1-bk7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays as desired. Fixed for 2.6.9-rc1-bk7.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc1-bk7-vanilla/drivers/message/fusion/mptbase.c	2004-08-31 21:59:35.000000000 +0000
+++ 2.6.9-rc1-bk7-dev/drivers/message/fusion/mptbase.c	2004-09-01 22:28:15.000000000 +0000
@@ -2229,8 +2229,7 @@ MakeIocReady(MPT_ADAPTER *ioc, int force
 		}
 
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1 * HZ / 1000);
+			msleep (1);
 		} else {
 			mdelay (1);	/* 1 msec delay */
 		}
@@ -2599,8 +2598,7 @@ SendIocInit(MPT_ADAPTER *ioc, int sleepF
 	state = mpt_GetIocState(ioc, 1);
 	while (state != MPI_IOC_STATE_OPERATIONAL && --cntdn) {
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1 * HZ / 1000);
+			msleep(1);
 		} else {
 			mdelay(1);
 		}
@@ -2867,8 +2865,7 @@ mpt_downloadboot(MPT_ADAPTER *ioc, int s
 
 	/* wait 1 msec */
 	if (sleepFlag == CAN_SLEEP) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(1 * HZ / 1000);
+		msleep (1);
 	} else {
 		mdelay (1);
 	}
@@ -2885,8 +2882,7 @@ mpt_downloadboot(MPT_ADAPTER *ioc, int s
 		}
 		/* wait 1 sec */
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1000 * HZ / 1000);
+			msleep (1000);
 		} else {
 			mdelay (1000);
 		}
@@ -2986,8 +2982,7 @@ mpt_downloadboot(MPT_ADAPTER *ioc, int s
 			return 0;
 		}
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(10 * HZ / 1000);
+			msleep (10);
 		} else {
 			mdelay (10);
 		}
@@ -3038,8 +3033,7 @@ KickStart(MPT_ADAPTER *ioc, int force, i
 		SendIocReset(ioc, MPI_FUNCTION_IOC_MESSAGE_UNIT_RESET, sleepFlag);
 
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1000 * HZ / 1000);
+			msleep (1000);
 		} else {
 			mdelay (1000);
 		}
@@ -3061,8 +3055,7 @@ KickStart(MPT_ADAPTER *ioc, int force, i
 			return hard_reset_done;
 		}
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(10 * HZ / 1000);
+			msleep (10);
 		} else {
 			mdelay (10);
 		}
@@ -3133,8 +3126,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 			/* wait 100 msec */
 			if (sleepFlag == CAN_SLEEP) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(100 * HZ / 1000);
+				msleep (100);
 			} else {
 				mdelay (100);
 			}
@@ -3213,8 +3205,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 				/* wait 1 sec */
 				if (sleepFlag == CAN_SLEEP) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(1000 * HZ / 1000);
+					msleep (1000);
 				} else {
 					mdelay (1000);
 				}
@@ -3241,8 +3232,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 				/* wait 1 sec */
 				if (sleepFlag == CAN_SLEEP) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(1000 * HZ / 1000);
+					msleep (1000):
 				} else {
 					mdelay (1000);
 				}
@@ -3276,8 +3266,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 		/* wait 100 msec */
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(100 * HZ / 1000);
+			msleep (100);
 		} else {
 			mdelay (100);
 		}
@@ -3371,8 +3360,7 @@ SendIocReset(MPT_ADAPTER *ioc, u8 reset_
 		}
 
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1 * HZ / 1000);
+			msleep (1);
 		} else {
 			mdelay (1);	/* 1 msec delay */
 		}
@@ -3808,8 +3796,7 @@ WaitForDoorbellAck(MPT_ADAPTER *ioc, int
 			intstat = CHIPREG_READ32(&ioc->chip->IntStatus);
 			if (! (intstat & MPI_HIS_IOP_DOORBELL_STATUS))
 				break;
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1 * HZ / 1000);
+			msleep (1);
 			count++;
 		}
 	} else {
@@ -3858,8 +3845,7 @@ WaitForDoorbellInt(MPT_ADAPTER *ioc, int
 			intstat = CHIPREG_READ32(&ioc->chip->IntStatus);
 			if (intstat & MPI_HIS_DOORBELL_INTERRUPT)
 				break;
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1 * HZ / 1000);
+			msleep (1);
 			count++;
 		}
 	} else {

--===============53355788354746059==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53355788354746059==--
