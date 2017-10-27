From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Oct 2017 15:59:06 +0000
Subject: [PATCH] md: remove redundant variable q
Message-Id: <20171027155906.13126-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaohua Li <shli@kernel.org>, linux-raid@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer q is assigned but never read; it is redundant and can
be removed.  Cleans up clang warning:

drivers/md/md-multipath.c:260:4: warning: Value stored to 'q' is
never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/md/md-multipath.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/md/md-multipath.c b/drivers/md/md-multipath.c
index 5c70176fa24d..e40065bdbfc8 100644
--- a/drivers/md/md-multipath.c
+++ b/drivers/md/md-multipath.c
@@ -243,7 +243,6 @@ static void print_multipath_conf (struct mpconf *conf)
 static int multipath_add_disk(struct mddev *mddev, struct md_rdev *rdev)
 {
 	struct mpconf *conf = mddev->private;
-	struct request_queue *q;
 	int err = -EEXIST;
 	int path;
 	struct multipath_info *p;
@@ -257,7 +256,6 @@ static int multipath_add_disk(struct mddev *mddev, struct md_rdev *rdev)
 
 	for (path = first; path <= last; path++)
 		if ((p=conf->multipaths+path)->rdev = NULL) {
-			q = rdev->bdev->bd_disk->queue;
 			disk_stack_limits(mddev->gendisk, rdev->bdev,
 					  rdev->data_offset << 9);
 
-- 
2.14.1

