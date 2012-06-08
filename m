From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Jun 2012 06:52:58 +0000
Subject: staging: comedi: amplc_pci230: add a missing unlock
Message-Id: <20120608065258.GA26673@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This side of the if else statement returned with the lock held and IRQs
disabled.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/comedi/drivers/amplc_pci230.c b/drivers/staging/comedi/drivers/amplc_pci230.c
index 30487be..f2ad35c 100644
--- a/drivers/staging/comedi/drivers/amplc_pci230.c
+++ b/drivers/staging/comedi/drivers/amplc_pci230.c
@@ -1387,6 +1387,8 @@ static int pci230_ao_inttrig_scan_begin(struct comedi_device *dev,
 		/* Delay.  Should driver be responsible for this? */
 		/* XXX TODO: See if DAC busy bit can be used. */
 		udelay(8);
+	} else {
+		spin_unlock_irqrestore(&devpriv->ao_stop_spinlock, irqflags);
 	}
 
 	return 1;
