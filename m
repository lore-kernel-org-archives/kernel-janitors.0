From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 11 Dec 2020 18:12:36 +0000
Subject: [PATCH] block: drop dead assignments in loop_init()
Message-Id: <20201211181236.25755-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: Hannes Reinecke <hare@suse.de>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit 8410d38c2552 ("loop: use __register_blkdev to allocate devices on
demand") simplified loop_init(); so computing the range of the block region
is not required anymore and can be dropped.

Drop dead assignments in loop_init().

As compilers will detect these unneeded assignments and optimize this,
the resulting object code is identical before and after this change.

No functional change. No change in object code.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Christoph, please ack.

Jens, please pick this minor non-urgent clean-up patch on your
block -next tree on top of Christoph's commit above.

 drivers/block/loop.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index d2ce1ddc192d..eed4bc5ef5c5 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -2304,7 +2304,6 @@ MODULE_ALIAS("devname:loop-control");
 static int __init loop_init(void)
 {
 	int i, nr;
-	unsigned long range;
 	struct loop_device *lo;
 	int err;
 
@@ -2343,10 +2342,8 @@ static int __init loop_init(void)
 	 */
 	if (max_loop) {
 		nr = max_loop;
-		range = max_loop << part_shift;
 	} else {
 		nr = CONFIG_BLK_DEV_LOOP_MIN_COUNT;
-		range = 1UL << MINORBITS;
 	}
 
 	err = misc_register(&loop_misc);
-- 
2.17.1
