From: Dan Carpenter <error27@gmail.com>
Date: Mon, 22 Feb 2010 04:54:45 +0000
Subject: [patch] mca: remove some dead code
Message-Id: <20100222045445.GA4853@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There are two return statements in a row.  The first return statement is
the correct one.  For the unused return statement, it is the 
mca_device_read_stored_pos() which returns mca_dev->pos[reg];

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mca/mca-device.c b/drivers/mca/mca-device.c
index e7adf89..ff078f4 100644
--- a/drivers/mca/mca-device.c
+++ b/drivers/mca/mca-device.c
@@ -65,8 +65,6 @@ unsigned char mca_device_read_pos(struct mca_device *mca_dev, int reg)
 	struct mca_bus *mca_bus = to_mca_bus(mca_dev->dev.parent);
 
 	return mca_bus->f.mca_read_pos(mca_dev, reg);
-
-	return 	mca_dev->pos[reg];
 }
 EXPORT_SYMBOL(mca_device_read_pos);
 
