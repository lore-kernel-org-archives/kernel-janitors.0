From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Sat, 09 Jul 2005 00:13:24 +0000
Subject: [KJ] [PATCH 9/14] block/cciss: use msleep() instead of
Message-Id: <20050709001324.GO2596@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============040853514473583541=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============040853514473583541==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Nishanth Aravamudan <nacc@us.ibm.com>

Description: Use msleep() instead of schedule_timeout() to guarantee the
task delays as expected. This change was ACK'ed before, but there were
multiple versions floating around and this hunk got lost, it seems.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

---

 cciss.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)

diff -urp 2.6.13-rc2-kj/drivers/block/cciss.c 2.6.13-rc2-kj-dev/drivers/block/cciss.c
--- 2.6.13-rc2-kj/drivers/block/cciss.c	2005-07-08 13:01:09.000000000 -0700
+++ 2.6.13-rc2-kj-dev/drivers/block/cciss.c	2005-07-06 13:40:00.000000000 -0700
@@ -2439,8 +2439,7 @@ static int cciss_pci_init(ctlr_info_t *c
 		scratchpad = readl(c->vaddr + SA5_SCRATCHPAD_OFFSET);
 		if (scratchpad == CCISS_FIRMWARE_READY)
 			break;
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ / 10); /* wait 100ms */
+		msleep(100);
 	}
 	if (scratchpad != CCISS_FIRMWARE_READY) {
 		printk(KERN_WARNING "cciss: Board not ready.  Timed out.\n");

--===============040853514473583541==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============040853514473583541==--
