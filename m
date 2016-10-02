From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 02 Oct 2016 12:05:12 +0000
Subject: [PATCH 9/13] md/multipath: Adjust two function calls together with a variable assignment
Message-Id: <383b0acc-a093-fe89-c21d-d9a86761976b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4a31d7a7-f70c-12f7-202f-963bd8706066@users.sourceforge.net>
In-Reply-To: <4a31d7a7-f70c-12f7-202f-963bd8706066@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.kernel.org, Jens Axboe <axboe@fb.com>, NeilBrown <neilb@suse.com>, Shaohua Li <shli@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 2 Oct 2016 10:05:43 +0200

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/multipath.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/md/multipath.c b/drivers/md/multipath.c
index 0e8939f..a5a639d 100644
--- a/drivers/md/multipath.c
+++ b/drivers/md/multipath.c
@@ -258,8 +258,9 @@ static int multipath_add_disk(struct mddev *mddev, struct md_rdev *rdev)
 
 	print_multipath_conf(conf);
 
-	for (path = first; path <= last; path++)
-		if ((p=conf->multipaths+path)->rdev = NULL) {
+	for (path = first; path <= last; path++) {
+		p = conf->multipaths + path;
+		if (!p->rdev) {
 			q = rdev->bdev->bd_disk->queue;
 			disk_stack_limits(mddev->gendisk, rdev->bdev,
 					  rdev->data_offset << 9);
@@ -276,6 +277,7 @@ static int multipath_add_disk(struct mddev *mddev, struct md_rdev *rdev)
 			err = 0;
 			break;
 		}
+	}
 
 	print_multipath_conf(conf);
 
@@ -347,7 +349,8 @@ static void multipathd(struct md_thread *thread)
 		bio = &mp_bh->bio;
 		bio->bi_iter.bi_sector = mp_bh->master_bio->bi_iter.bi_sector;
 
-		if ((mp_bh->path = multipath_map (conf))<0) {
+		mp_bh->path = multipath_map(conf);
+		if (mp_bh->path < 0) {
 			printk(KERN_ALERT "multipath: %s: unrecoverable IO read"
 				" error for block %llu\n",
 				bdevname(bio->bi_bdev,b),
-- 
2.10.0

