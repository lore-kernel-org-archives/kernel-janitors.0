From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 22:32:54 +0000
Subject: [Kernel-janitors] [PATCH] ide/pmac: replace schedule_timeout() with
Message-Id: <20040722223254.GU2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17803280992441106=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============17803280992441106==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee the
desired delay.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/ide/ppc/pmac.c	2004-06-16 05:18:58.000000000 +0000
+++ linux-dev/drivers/ide/ppc/pmac.c	2004-07-02 18:01:35.000000000 +0000
@@ -1126,11 +1126,9 @@ pmac_ide_do_resume(ide_hwif_t *hwif)
 	if (!pmif->mediabay) {
 		ppc_md.feature_call(PMAC_FTR_IDE_RESET, pmif->node, pmif->aapl_bus_id, 1);
 		ppc_md.feature_call(PMAC_FTR_IDE_ENABLE, pmif->node, pmif->aapl_bus_id, 1);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/100);
+		msleep(10);
 		ppc_md.feature_call(PMAC_FTR_IDE_RESET, pmif->node, pmif->aapl_bus_id, 0);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(IDE_WAKEUP_DELAY);
+		msleep(jiffies_to_msecs(IDE_WAKEUP_DELAY));
 	}
 
 	/* Sanitize drive timings */
@@ -1208,11 +1206,9 @@ pmac_ide_setup_device(pmac_ide_hwif_t *p
  		/* This is necessary to enable IDE when net-booting */
 		ppc_md.feature_call(PMAC_FTR_IDE_RESET, np, pmif->aapl_bus_id, 1);
 		ppc_md.feature_call(PMAC_FTR_IDE_ENABLE, np, pmif->aapl_bus_id, 1);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/100);
+		msleep(10);
 		ppc_md.feature_call(PMAC_FTR_IDE_RESET, np, pmif->aapl_bus_id, 0);
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(IDE_WAKEUP_DELAY);		
+		msleep(jiffies_to_msecs(IDE_WAKEUP_DELAY));
 	}
 
 	/* Setup MMIO ops */

--===============17803280992441106==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17803280992441106==--
