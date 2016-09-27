From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Sep 2016 16:51:15 +0000
Subject: [PATCH 05/16] md/bitmap: Return directly after a failed bitmap_storage_alloc() in bitmap_resize()
Message-Id: <6971c808-fc6d-0d78-c672-7c63c043485b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <30938c84-20a7-0f13-bdda-a2d2109a6dac@users.sourceforge.net>
In-Reply-To: <30938c84-20a7-0f13-bdda-a2d2109a6dac@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.kernel.org, Shaohua Li <shli@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Sep 2016 14:47:29 +0200

Return directly after a memory allocation failed in this function
at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/bitmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
index c278865..5092bc0 100644
--- a/drivers/md/bitmap.c
+++ b/drivers/md/bitmap.c
@@ -2032,7 +2032,7 @@ int bitmap_resize(struct bitmap *bitmap, sector_t blocks,
 					   mddev_is_clustered(bitmap->mddev)
 					   ? bitmap->cluster_slot : 0);
 	if (ret)
-		goto err;
+		return ret;
 
 	pages = DIV_ROUND_UP(chunks, PAGE_COUNTER_RATIO);
 
-- 
2.10.0

