From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 19 Jul 2004 21:38:33 +0000
Subject: [Kernel-janitors] [PATCH] cciss: replace schedule_timeout() with
Message-Id: <20040719213833.GA5372@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81171696425487094=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============81171696425487094==
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
the task delays at least the desired time amount.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-vanilla/drivers/block/cciss.c	2004-06-16 05:20:04.000000000 +0000
+++ linux-dev/drivers/block/cciss.c	2004-07-10 18:19:33.000000000 +0000
@@ -2242,8 +2242,7 @@ static int cciss_pci_init(ctlr_info_t *c
 		scratchpad = readl(c->vaddr + SA5_SCRATCHPAD_OFFSET);
 		if (scratchpad == CCISS_FIRMWARE_READY)
 			break;
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ / 10); /* wait 100ms */
+		msleep(100);
 	}
 	if (scratchpad != CCISS_FIRMWARE_READY) {
 		printk(KERN_WARNING "cciss: Board not ready.  Timed out.\n");

--===============81171696425487094==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81171696425487094==--
