From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 18:36:51 +0000
Subject: [Kernel-janitors] [PATCH 1/8] block/cciss: replace
Message-Id: <20040915183651.GI4363@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64545809903381168=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64545809903381168==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch I
submitted 19 July which hasn't been merged as of
2.6.9-rc1-mm5/2.6.9-rc2. 

Description: msleep_interruptible() is used instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc2-vanilla/drivers/block/cciss.c	2004-09-13 17:16:05.000000000 -0700
+++ 2.6.9-rc2/drivers/block/cciss.c	2004-09-14 11:38:01.000000000 -0700
@@ -2381,8 +2381,7 @@ static int cciss_pci_init(ctlr_info_t *c
 		scratchpad = readl(c->vaddr + SA5_SCRATCHPAD_OFFSET);
 		if (scratchpad == CCISS_FIRMWARE_READY)
 			break;
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ / 10); /* wait 100ms */
+		msleep_interruptible(100);
 	}
 	if (scratchpad != CCISS_FIRMWARE_READY) {
 		printk(KERN_WARNING "cciss: Board not ready.  Timed out.\n");

--===============64545809903381168==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64545809903381168==--
