From: Colin King <colin.king@canonical.com>
Date: Fri, 09 Jun 2017 15:54:25 +0000
Subject: [PATCH][-next] loop: fix incorrect nesting levels on braces in nested if statements
Message-Id: <20170609155425.21260-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@fb.com>, Ming Lei <tom.leiming@gmail.com>, Hannes Reinecke <hare@suse.de>, Omar Sandoval <osandov@fb.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Adding another set of braces clarifies the block and ensures that
both the setting of err and the error exit are executed on the
deepest nested if statement.

Detected by CoverityScan, CID#1440959 ("Nesting level does not
match indentation")

Fixes: f2c6df7dbf9a60 ("loop: support 4k physical blocksize")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/loop.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 4d376c10a97a..e288fb30100f 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1147,10 +1147,11 @@ loop_set_status(struct loop_device *lo, const struct loop_info64 *info)
 	    ((lo->lo_flags & LO_FLAGS_BLOCKSIZE) &&
 	     lo->lo_logical_blocksize != LO_INFO_BLOCKSIZE(info))) {
 		if (figure_loop_size(lo, info->lo_offset, info->lo_sizelimit,
-				     LO_INFO_BLOCKSIZE(info)))
+				     LO_INFO_BLOCKSIZE(info))) {
 			err = -EFBIG;
 			goto exit;
 		}
+	}
 
 	loop_config_discard(lo);
 
-- 
2.11.0

