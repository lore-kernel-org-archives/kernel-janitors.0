From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:20:37 +0000
Subject: [Kernel-janitors] [PATCH] message/mptscsih: replace
Message-Id: <20040726232037.GA1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77859403384615011=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============77859403384615011==
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


--- linux-vanilla/drivers/message/fusion/mptscsih.c	2004-06-16 05:20:27.000000000 +0000
+++ linux-dev/drivers/message/fusion/mptscsih.c	2004-07-12 18:57:49.000000000 +0000
@@ -3098,8 +3098,7 @@ mptscsih_tm_pending_wait(MPT_SCSI_HOST *
 			break;
 		}
 		spin_unlock_irqrestore(&hd->ioc->FreeQlock, flags);
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ/4);
+		msleep(250);
 	} while (--loop_count);
 
 	return status;
@@ -5723,8 +5722,7 @@ mptscsih_domainValidation(void *arg)
 			}
 			spin_unlock_irqrestore(&dvtaskQ_lock, flags);
 
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ/4);
+			msleep(250);
 
 			/* DV only to SCSI adapters */
 			if ((int)ioc->chip_type <= (int)FC929)
@@ -5772,8 +5770,7 @@ mptscsih_domainValidation(void *arg)
 					hd->ioc->spi_data.dvStatus[id] |= MPT_SCSICFG_DV_PENDING;
 					hd->ioc->spi_data.dvStatus[id] &= ~MPT_SCSICFG_NEED_DV;
 
-					set_current_state(TASK_INTERRUPTIBLE);
-					schedule_timeout(HZ/4);
+					msleep(250);
 
 					/* If hidden phys disk, block IO's to all
 					 *	raid volumes

--===============77859403384615011==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77859403384615011==--
