From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Mar 2013 11:41:51 +0000
Subject: [patch] pata_legacy: bogus clock in opti82c46x_set_piomode()
Message-Id: <20130311114151.GB8235@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

"sysclk" is used as an index into a 4 element array.  My static
checker complains because it can be out of bounds.  From the
context, it looks like there is a right bit shift missing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have the hardware to test this.

diff --git a/drivers/ata/pata_legacy.c b/drivers/ata/pata_legacy.c
index 4fe9d21..be81642 100644
--- a/drivers/ata/pata_legacy.c
+++ b/drivers/ata/pata_legacy.c
@@ -542,7 +542,7 @@ static void opti82c46x_set_piomode(struct ata_port *ap, struct ata_device *adev)
 	u8 sysclk;
 
 	/* Get the clock */
-	sysclk = opti_syscfg(0xAC) & 0xC0;	/* BIOS set */
+	sysclk = (opti_syscfg(0xAC) & 0xC0) >> 6;	/* BIOS set */
 
 	/* Enter configuration mode */
 	ioread16(ap->ioaddr.error_addr);
