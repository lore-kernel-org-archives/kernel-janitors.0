From: Emil Goode <emilgoode@gmail.com>
Date: Thu, 09 May 2013 20:39:26 +0000
Subject: [PATCH] bcache: Fix incompatible pointer type warning
Message-Id: <1368131966-17512-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: koverstreet@google.com, neilb@suse.de
Cc: linux-bcache@vger.kernel.org, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The function pointer release in struct block_device_operations
should point to functions declared as void.

Sparse warnings:

drivers/md/bcache/super.c:656:27: warning:
	incorrect type in initializer (different base types)
	drivers/md/bcache/super.c:656:27:
	expected void ( *release )( ... )
	drivers/md/bcache/super.c:656:27:
	got int ( static [toplevel] *<noident> )( ... )

drivers/md/bcache/super.c:656:2: warning:
	initialization from incompatible pointer type [enabled by default]

drivers/md/bcache/super.c:656:2: warning:
	(near initialization for ‘bcache_ops.release’) [enabled by default]

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/md/bcache/super.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
index 76c7f6c..938bbff 100644
--- a/drivers/md/bcache/super.c
+++ b/drivers/md/bcache/super.c
@@ -637,11 +637,10 @@ static int open_dev(struct block_device *b, fmode_t mode)
 	return 0;
 }
 
-static int release_dev(struct gendisk *b, fmode_t mode)
+static void release_dev(struct gendisk *b, fmode_t mode)
 {
 	struct bcache_device *d = b->private_data;
 	closure_put(&d->cl);
-	return 0;
 }
 
 static int ioctl_dev(struct block_device *b, fmode_t mode,
-- 
1.7.10.4

