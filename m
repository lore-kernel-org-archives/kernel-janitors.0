From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 23:15:07 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/3] message/mptbase: replace
Message-Id: <20040920231507.GB2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============035031979047730921=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234735.GJ1777@us.ibm.com>
In-Reply-To: <20040916234735.GJ1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============035031979047730921==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. I was recently informed that
i2o_core.c was removed from the kernel, so one of my patches was
obsoleted. Hence, the total number has dropped to 3.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/message/fusion/mptbase.c	2004-09-09 23:05:59.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/message/fusion/mptbase.c	2004-09-10 11:59:42.000000000 -0700
@@ -2229,8 +2229,7 @@ MakeIocReady(MPT_ADAPTER *ioc, int force
 		}
 
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1 * HZ / 1000);
+			msleep_interruptible(1);
 		} else {
 			mdelay (1);	/* 1 msec delay */
 		}
@@ -2599,8 +2598,7 @@ SendIocInit(MPT_ADAPTER *ioc, int sleepF
 	state = mpt_GetIocState(ioc, 1);
 	while (state != MPI_IOC_STATE_OPERATIONAL && --cntdn) {
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1 * HZ / 1000);
+			msleep_interruptible(1);
 		} else {
 			mdelay(1);
 		}
@@ -2867,8 +2865,7 @@ mpt_downloadboot(MPT_ADAPTER *ioc, int s
 
 	/* wait 1 msec */
 	if (sleepFlag == CAN_SLEEP) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(1 * HZ / 1000);
+		msleep_interruptible(1);
 	} else {
 		mdelay (1);
 	}
@@ -2885,8 +2882,7 @@ mpt_downloadboot(MPT_ADAPTER *ioc, int s
 		}
 		/* wait 1 sec */
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1000 * HZ / 1000);
+			msleep_interruptible (1000);
 		} else {
 			mdelay (1000);
 		}
@@ -2986,8 +2982,7 @@ mpt_downloadboot(MPT_ADAPTER *ioc, int s
 			return 0;
 		}
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(10 * HZ / 1000);
+			msleep_interruptible (10);
 		} else {
 			mdelay (10);
 		}
@@ -3038,8 +3033,7 @@ KickStart(MPT_ADAPTER *ioc, int force, i
 		SendIocReset(ioc, MPI_FUNCTION_IOC_MESSAGE_UNIT_RESET, sleepFlag);
 
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1000 * HZ / 1000);
+			msleep_interruptible (1000);
 		} else {
 			mdelay (1000);
 		}
@@ -3061,8 +3055,7 @@ KickStart(MPT_ADAPTER *ioc, int force, i
 			return hard_reset_done;
 		}
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(10 * HZ / 1000);
+			msleep_interruptible (10);
 		} else {
 			mdelay (10);
 		}
@@ -3133,8 +3126,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 			/* wait 100 msec */
 			if (sleepFlag == CAN_SLEEP) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(100 * HZ / 1000);
+				msleep_interruptible (100);
 			} else {
 				mdelay (100);
 			}
@@ -3213,8 +3205,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 				/* wait 1 sec */
 				if (sleepFlag == CAN_SLEEP) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(1000 * HZ / 1000);
+					msleep_interruptible (1000);
 				} else {
 					mdelay (1000);
 				}
@@ -3241,8 +3232,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 				/* wait 1 sec */
 				if (sleepFlag == CAN_SLEEP) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(1000 * HZ / 1000);
+					msleep_interruptible(1000);
 				} else {
 					mdelay (1000);
 				}
@@ -3276,8 +3266,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 		/* wait 100 msec */
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(100 * HZ / 1000);
+			msleep_interruptible (100);
 		} else {
 			mdelay (100);
 		}
@@ -3371,8 +3360,7 @@ SendIocReset(MPT_ADAPTER *ioc, u8 reset_
 		}
 
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1 * HZ / 1000);
+			msleep_interruptible(1);
 		} else {
 			mdelay (1);	/* 1 msec delay */
 		}
@@ -3808,8 +3796,7 @@ WaitForDoorbellAck(MPT_ADAPTER *ioc, int
 			intstat = CHIPREG_READ32(&ioc->chip->IntStatus);
 			if (! (intstat & MPI_HIS_IOP_DOORBELL_STATUS))
 				break;
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1 * HZ / 1000);
+			msleep_interruptible (1);
 			count++;
 		}
 	} else {
@@ -3858,8 +3845,7 @@ WaitForDoorbellInt(MPT_ADAPTER *ioc, int
 			intstat = CHIPREG_READ32(&ioc->chip->IntStatus);
 			if (intstat & MPI_HIS_DOORBELL_INTERRUPT)
 				break;
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(1 * HZ / 1000);
+			msleep_interruptible(1);
 			count++;
 		}
 	} else {

--===============035031979047730921==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============035031979047730921==--
