From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:17:40 +0000
Subject: [Kernel-janitors] [PATCH] s390/zfcp_erp: replace schedule_timeout()
Message-Id: <20040727221740.GG3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92768039392096613=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92768039392096613==
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

Description: Replace schedule_timeout() with msleep() to guarantee the task
delays as desired.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/s390/scsi/zfcp_erp.c	2004-06-15 22:19:01.000000000 -0700
+++ linux-dev/drivers/s390/scsi/zfcp_erp.c	2004-07-27 15:16:39.000000000 -0700
@@ -2158,7 +2158,6 @@ static int
 zfcp_erp_adapter_strategy(struct zfcp_erp_action *erp_action)
 {
 	int retval;
-	unsigned long timeout;
 	struct zfcp_adapter *adapter = erp_action->adapter;
 
 	retval = zfcp_erp_adapter_strategy_close(erp_action);
@@ -2180,9 +2179,7 @@ zfcp_erp_adapter_strategy(struct zfcp_er
 		 * timeout = ZFCP_TYPE2_RECOVERY_TIME;
 		 * __ZFCP_WAIT_EVENT_TIMEOUT(timeout, 0);
 		 */
-		timeout = ZFCP_TYPE2_RECOVERY_TIME;
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(timeout);
+		msleep(jiffies_to_msecs(ZFCP_TYPE2_RECOVERY_TIME));
 	}
 
 	return retval;
@@ -2548,8 +2545,7 @@ zfcp_erp_adapter_strategy_open_fsf_xconf
 			ZFCP_LOG_DEBUG("host connection still initialising... "
 				       "waiting and retrying...\n");
 			/* sleep a little bit before retry */
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(ZFCP_EXCHANGE_CONFIG_DATA_SLEEP);
+			msleep(jiffies_to_msecs(ZFCP_EXCHANGE_CONFIG_DATA_SLEEP));
 		}
 	} while ((retries--) &&
 		 atomic_test_mask(ZFCP_STATUS_ADAPTER_HOST_CON_INIT,

--===============92768039392096613==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92768039392096613==--
