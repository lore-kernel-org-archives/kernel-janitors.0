From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:18:00 +0000
Subject: [KJ] [PATCH] scsi/ahci: replace schedule_timeout() with
Message-Id: <20041022231800.GF11126@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90312800337182275=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============90312800337182275==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Uses msleep() / ssleep() [as appropriate] instead of
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-bk7-vanilla/drivers/scsi/ahci.c	2004-10-22 10:41:31.000000000 -0700
+++ 2.6.9-bk7/drivers/scsi/ahci.c	2004-10-22 15:20:02.000000000 -0700
@@ -363,8 +363,7 @@ static void ahci_port_stop(struct ata_po
 	/* spec says 500 msecs for each PORT_CMD_{START,FIS_RX} bit, so
 	 * this is slightly incorrect.
 	 */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout((HZ / 2) + 1);
+	msleep(500);
 
 	ap->private_data = NULL;
 	pci_free_consistent(pdev, AHCI_PORT_PRIV_DMA_SZ,
@@ -719,8 +718,7 @@ static int ahci_host_init(struct ata_pro
 	/* reset must complete within 1 second, or
 	 * the hardware should be considered fried.
 	 */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ + 1);
+	ssleep(1);
 
 	tmp = readl(mmio + HOST_CTL);
 	if (tmp & HOST_RESET) {
@@ -798,8 +796,7 @@ static int ahci_host_init(struct ata_pro
 			/* spec says 500 msecs for each bit, so
 			 * this is slightly incorrect.
 			 */
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout((HZ / 2) + 1);
+			msleep(500);
 		}
 
 		writel(PORT_CMD_SPIN_UP, port_mmio + PORT_CMD);

--===============90312800337182275==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90312800337182275==--
