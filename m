From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Sep 2016 16:56:30 +0000
Subject: [PATCH 09/16] md/bitmap: Rename a jump label in bitmap_copy_from_slot()
Message-Id: <d30a040c-4abd-d980-9c9c-7693738f36b3@users.sourceforge.net>
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
Date: Tue, 27 Sep 2016 15:55:01 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/bitmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
index 22fa09a..5125186 100644
--- a/drivers/md/bitmap.c
+++ b/drivers/md/bitmap.c
@@ -1910,7 +1910,7 @@ int bitmap_copy_from_slot(struct mddev *mddev, int slot,
 
 	rv = bitmap_init_from_disk(bitmap, 0);
 	if (rv)
-		goto err;
+		goto free_bitmap;
 
 	counts = &bitmap->counts;
 	for (j = 0; j < counts->chunks; j++) {
@@ -1937,7 +1937,7 @@ int bitmap_copy_from_slot(struct mddev *mddev, int slot,
 	bitmap_unplug(mddev->bitmap);
 	*low = lo;
 	*high = hi;
-err:
+free_bitmap:
 	bitmap_free(bitmap);
 	return rv;
 }
-- 
2.10.0

