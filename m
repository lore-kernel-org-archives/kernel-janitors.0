From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Aug 2020 10:16:45 +0000
Subject: [PATCH] md-cluster: Fix potential error pointer dereference in resize_bitmaps()
Message-Id: <20200804101645.GB392148@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Song Liu <song@kernel.org>, Guoqing Jiang <gqjiang@suse.com>
Cc: Shaohua Li <shli@fb.com>, NeilBrown <neilb@suse.com>, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

The error handling calls md_bitmap_free(bitmap) which checks for NULL
but will Oops if we pass an error pointer.  Let's set "bitmap" to NULL
on this error path.

Fixes: afd756286083 ("md-cluster/raid10: resize all the bitmaps before start reshape")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/md/md-cluster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/md/md-cluster.c b/drivers/md/md-cluster.c
index 73fd50e77975..d50737ec4039 100644
--- a/drivers/md/md-cluster.c
+++ b/drivers/md/md-cluster.c
@@ -1139,6 +1139,7 @@ static int resize_bitmaps(struct mddev *mddev, sector_t newsize, sector_t oldsiz
 		bitmap = get_bitmap_from_slot(mddev, i);
 		if (IS_ERR(bitmap)) {
 			pr_err("can't get bitmap from slot %d\n", i);
+			bitmap = NULL;
 			goto out;
 		}
 		counts = &bitmap->counts;
-- 
2.27.0
