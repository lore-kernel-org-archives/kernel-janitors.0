From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 16 Aug 2004 19:47:40 +0000
Subject: [Kernel-janitors] [PATCH 2.6.8.1] message/mptbase: replace
Message-Id: <20040816194740.GA1942@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46619372562949613=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46619372562949613==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 14, 2004 at 08:59:25PM +0200, maximilian attems wrote:
> On Mon, 26 Jul 2004, Nishanth Aravamudan wrote:
> 
> > I would appreciate any comments from the janitors list. This is one (of
> > many) cases where I made a decision about replacing
> > 
> > set_current_state(TASK_INTERRUPTIBLE);
> > schedule_timeout(some_time);
> > 
> > with
> > 
> > msleep(jiffies_to_msecs(some_time));
> > 
> > msleep() is not exactly the same as the previous code, but I only did
> > this replacement where I thought long delays were *desired*. If this is
> > not the case here, then just disregard this patch. 
> > 
> > Thanks,
> > Nish
> > 
> > 
> > 
> > Applys-to: 2.6.7
> > 
> > Description: Replace schedule_timeout() with msleep() to guarantee the
> > task delays for the desired time.
> > 
> > Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> > 
> > 
> > --- linux-vanilla/drivers/message/fusion/mptbase.c	2004-06-16 05:19:01.000000000 +0000
> > +++ linux-dev/drivers/message/fusion/mptbase.c	2004-07-12 18:56:59.000000000 +0000
> 
> could you please rework this one, it doesn't apply anymore to 2.6.8
> i could do it but prefer to get next kjt patchset out soon.

In this file, there were a few things I noticed. For one, there
are many blocks (which I did not change) along the lines of

if (some condition) {
	set_current_state (TASK_INTERRUPTIBLE);
	schedule_timeout (1);
} else {
	mdelay (1);
}

This seems weird to me, since in the patch below the schedule_timeout()
and mdelay() calls matched up exactly. I can fix these blocks, if they
are errors... Also, I changed the comment in one of the cases in this
patch, as it erroneously referred to 2 secs.

Please let me know of any other problems.

-Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-2.6.8.1-vanilla/drivers/message/fusion/mptbase.c	2004-08-16 08:32:22.000000000 -0700
+++ linux-2.6.8.1-dev/drivers/message/fusion/mptbase.c	2004-08-16 12:30:39.000000000 -0700
@@ -2876,8 +2876,7 @@ mpt_downloadboot(MPT_ADAPTER *ioc, int s
 
 	/* wait 100 msec */
 	if (sleepFlag == CAN_SLEEP) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(100 * HZ / 1000);
+		msleep (100);
 	} else {
 		mdelay (100);
 	}
@@ -2893,8 +2892,7 @@ mpt_downloadboot(MPT_ADAPTER *ioc, int s
 		}
 		/* wait 1 sec */
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ);
+			msleep (1000);
 		} else {
 			mdelay (1000);
 		}
@@ -2990,8 +2988,7 @@ mpt_downloadboot(MPT_ADAPTER *ioc, int s
 	/* wait 100 msec */
 	if (sleepFlag == CAN_SLEEP) {
 		ddlprintk((MYIOC_s_INFO_FMT "CAN_SLEEP 100 msec before reset the sequencer\n", ioc->name));
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(100 * HZ / 1000);
+		msleep (100);
 	} else {
 		ddlprintk((MYIOC_s_INFO_FMT "mdelay 100 msec before reset the sequencer\n", ioc->name));
 		mdelay (100);
@@ -3016,10 +3013,9 @@ mpt_downloadboot(MPT_ADAPTER *ioc, int s
 						return -EFAULT;
 				}
 			} */
-			/* wait 2 sec */
+			/* wait 55555 sec */
 /*			if (sleepFlag == CAN_SLEEP) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(5000 * HZ / 1000);
+				msleep (5000);
 			} else {
 				mdelay (5000);
 			} */
@@ -3079,8 +3075,7 @@ KickStart(MPT_ADAPTER *ioc, int force, i
 		SendIocReset(ioc, MPI_FUNCTION_IOC_MESSAGE_UNIT_RESET, sleepFlag);
 
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ);
+			msleep (1000);
 		} else {
 			mdelay (1000);
 		}
@@ -3173,8 +3168,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 			/* wait 100 msec */
 			if (sleepFlag == CAN_SLEEP) {
-				set_current_state(TASK_INTERRUPTIBLE);
-				schedule_timeout(100 * HZ / 1000);
+				msleep (100);
 			} else {
 				mdelay (100);
 			}
@@ -3266,8 +3260,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 				/* wait 1 sec */
 				if (sleepFlag == CAN_SLEEP) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(HZ);
+					msleep (1000);
 				} else {
 					mdelay (1000);
 				}
@@ -3294,8 +3287,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 				/* wait 1 sec */
 				if (sleepFlag == CAN_SLEEP) {
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(HZ);
+					msleep (1000);
 				} else {
 					mdelay (1000);
 				}
@@ -3329,8 +3321,7 @@ mpt_diag_reset(MPT_ADAPTER *ioc, int ign
 
 		/* wait 100 msec */
 		if (sleepFlag == CAN_SLEEP) {
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(100 * HZ / 1000);
+			msleep (100);
 		} else {
 			mdelay (100);
 		}

--===============46619372562949613==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46619372562949613==--
