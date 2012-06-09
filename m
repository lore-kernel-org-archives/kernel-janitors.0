From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Jun 2012 07:47:32 +0000
Subject: [patch RFC] [media] staging: solo6x10: fix | vs &
Message-Id: <20120609074732.GA30709@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Collins <bcollins@bluecherry.net>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

The test here is never true because '&' was used instead of '|'.  It was
the same as:

	if (status & ((1<<16) & (1<<17)) ...

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have this hardware and this one really should be tested or
checked by someone who knows the spec.  It could be that the intent was
to do:

	if ((status & SOLO_IIC_STATE_TRNS) &&
	    (status & SOLO_IIC_STATE_SIG_ERR) || ...

diff --git a/drivers/staging/media/solo6x10/i2c.c b/drivers/staging/media/solo6x10/i2c.c
index ef95a50..398070a 100644
--- a/drivers/staging/media/solo6x10/i2c.c
+++ b/drivers/staging/media/solo6x10/i2c.c
@@ -175,7 +175,7 @@ int solo_i2c_isr(struct solo_dev *solo_dev)
 
 	solo_reg_write(solo_dev, SOLO_IRQ_STAT, SOLO_IRQ_IIC);
 
-	if (status & (SOLO_IIC_STATE_TRNS & SOLO_IIC_STATE_SIG_ERR) ||
+	if (status & (SOLO_IIC_STATE_TRNS | SOLO_IIC_STATE_SIG_ERR) ||
 	    solo_dev->i2c_id < 0) {
 		solo_i2c_stop(solo_dev);
 		return -ENXIO;
