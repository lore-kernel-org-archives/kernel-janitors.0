From: Vasiliy Kulikov <segooon@gmail.com>
Date: Thu, 04 Nov 2010 14:48:15 +0000
Subject: [PATCH] block: ioctl: fix information leak to userland
Message-Id: <1288882096-13456-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org

Structure hd_geometry is copied to userland with 4 padding bytes
between cylinders and start fields uninitialized on 64-bit platforms.
It leads to leaking of contents of kernel stack memory.

Currently there is no memset() in real implementations of getgeo()
in drivers/block/, so it makes sense to have memset() in blkdev_ioctl().

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 block/ioctl.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/block/ioctl.c b/block/ioctl.c
index d724ceb..60bae81 100644
--- a/block/ioctl.c
+++ b/block/ioctl.c
@@ -242,6 +242,7 @@ int blkdev_ioctl(struct block_device *bdev, fmode_t mode, unsigned cmd,
 		 * We need to set the startsect first, the driver may
 		 * want to override it.
 		 */
+		memset(&geo, 0, sizeof(geo));
 		geo.start = get_start_sect(bdev);
 		ret = disk->fops->getgeo(bdev, &geo);
 		if (ret)
-- 
1.7.0.4

