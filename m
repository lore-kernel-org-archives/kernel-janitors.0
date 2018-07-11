From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Jul 2018 10:40:05 +0000
Subject: [PATCH] staging: gasket: remove redundant pointer bar_data
Message-Id: <20180711104005.30356-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Springer <rspringer@google.com>, John Joseph <jnjoseph@google.com>, Ben Chan <benchan@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer bar_data is being assigned but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: variable 'bar_data' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/gasket/gasket_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/gasket/gasket_core.c b/drivers/staging/gasket/gasket_core.c
index ad9442a5bb9d..45914ebc8f44 100644
--- a/drivers/staging/gasket/gasket_core.c
+++ b/drivers/staging/gasket/gasket_core.c
@@ -1610,7 +1610,6 @@ static int gasket_mmap(struct file *filp, struct vm_area_struct *vma)
 	bool is_coherent_region;
 	const struct gasket_driver_desc *driver_desc;
 	struct gasket_dev *gasket_dev = (struct gasket_dev *)filp->private_data;
-	struct gasket_bar_data *bar_data;
 	const struct gasket_bar_desc *bar_desc;
 	struct gasket_mappable_region *map_regions = NULL;
 	int num_map_regions = 0;
@@ -1673,8 +1672,6 @@ static int gasket_mmap(struct file *filp, struct vm_area_struct *vma)
 	 * Subtract the base of the bar from the raw offset to get the
 	 * memory location within the bar to map.
 	 */
-	bar_data = &gasket_dev->bar_data[bar_index];
-
 	bar_desc = &driver_desc->bar_descriptions[bar_index];
 	permissions = bar_desc->permissions;
 	if (!gasket_mmap_has_permissions(gasket_dev, vma, permissions)) {
-- 
2.17.1

