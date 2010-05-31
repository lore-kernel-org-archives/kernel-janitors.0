From: Dan Carpenter <error27@gmail.com>
Date: Mon, 31 May 2010 14:03:38 +0000
Subject: [patch] mtd: return success on blktrans_ioctl()
Message-Id: <20100531140337.GV5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>, linux-mtd@lists.infradead.org, Ben Hutchings <bhutchings@solarflare.com>

There was a break missing so we returned -ENOTTY on success instead of
zero.  This was introduced by 048d8719956: "mtd: blktrans: Hotplug fixes"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 03e19c1..a6bb586 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -245,6 +245,7 @@ static int blktrans_ioctl(struct block_device *bdev, fmode_t mode,
 	switch (cmd) {
 	case BLKFLSBUF:
 		ret = dev->tr->flush ? dev->tr->flush(dev) : 0;
+		break;
 	default:
 		ret = -ENOTTY;
 	}
