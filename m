From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Dec 2017 18:03:36 +0000
Subject: [PATCH] drm/ttm: fix double lock on glob->lru_lock
Message-Id: <20171222180336.4250-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Koenig <christian.koenig@amd.com>, Roger He <Hongbo.He@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Lock glob->lru_lock is locked before the while loop and also
locked again at the end of the while loop; it appears that the
lock at the end of the while loop is a double lock that should
be removed.  CoverityScan picked this up with the introduction
of the referenced commit inthe Fixes tag, however, it may have
existed before this.  I've not been able to test this, but it
does look incorrect to me.

Detected by CoverityScan, CID#1268846 ("Double lock")

Fixes: 827ed2b06b05 ("drm/ttm: use try_lock in ttm_bo_delayed_delete again")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 60bb5c12b568..fb8d13a4bc94 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -595,7 +595,6 @@ static bool ttm_bo_delayed_delete(struct ttm_bo_device *bdev, bool remove_all)
 		}
 
 		kref_put(&bo->list_kref, ttm_bo_release_list);
-		spin_lock(&glob->lru_lock);
 	}
 	list_splice_tail(&removed, &bdev->ddestroy);
 	empty = list_empty(&bdev->ddestroy);
-- 
2.14.1

