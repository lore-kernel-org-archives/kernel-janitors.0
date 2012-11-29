From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Nov 2012 14:17:25 +0000
Subject: [patch] staging: gdm72xx: unlock on error in init_usb()
Message-Id: <20121129141725.GB12199@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We recently added locking here and there was an error path which is
missing an unlock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gdm72xx/gdm_usb.c b/drivers/staging/gdm72xx/gdm_usb.c
index e434764..e0cb2ff 100644
--- a/drivers/staging/gdm72xx/gdm_usb.c
+++ b/drivers/staging/gdm72xx/gdm_usb.c
@@ -205,6 +205,7 @@ static int init_usb(struct usbwm_dev *udev)
 	for (i = 0; i < MAX_NR_SDU_BUF; i++) {
 		t = alloc_tx_struct(tx);
 		if (t = NULL) {
+			spin_unlock_irqrestore(&tx->lock, flags);
 			ret = -ENOMEM;
 			goto fail;
 		}
