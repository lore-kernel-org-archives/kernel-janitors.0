From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:46:58 +0000
Subject: [PATCH] drm/ttm: Remove redundant unlikely()
Message-Id: <1291906018-363-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/gpu/drm/ttm/ttm_tt.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index af789dc..fb83a90 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -538,7 +538,7 @@ int ttm_tt_swapout(struct ttm_tt *ttm, struct file *persistant_swap_storage)
 		swap_storage = shmem_file_setup("ttm swap",
 						ttm->num_pages << PAGE_SHIFT,
 						0);
-		if (unlikely(IS_ERR(swap_storage))) {
+		if (IS_ERR(swap_storage)) {
 			printk(KERN_ERR "Failed allocating swap storage.\n");
 			return PTR_ERR(swap_storage);
 		}
@@ -552,7 +552,7 @@ int ttm_tt_swapout(struct ttm_tt *ttm, struct file *persistant_swap_storage)
 		if (unlikely(from_page = NULL))
 			continue;
 		to_page = read_mapping_page(swap_space, i, NULL);
-		if (unlikely(IS_ERR(to_page))) {
+		if (IS_ERR(to_page)) {
 			ret = PTR_ERR(to_page);
 			goto out_err;
 		}
-- 
1.7.0.4

