From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Thu, 12 Feb 2015 14:56:07 +0000
Subject: [PATCH 1/1] staging: lustre: llite: Remove unnecessary OOM message
Message-Id: <20150212145607.GA12973@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This patch reduces the kernel size by removing error messages that duplicate
the normal OOM message.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/lustre/lustre/llite/llite_close.c | 4 +---
 drivers/staging/lustre/lustre/llite/xattr_cache.c | 5 +----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/lustre/lustre/llite/llite_close.c b/drivers/staging/lustre/lustre/llite/llite_close.c
index 21b4a50..a94ba02 100644
--- a/drivers/staging/lustre/lustre/llite/llite_close.c
+++ b/drivers/staging/lustre/lustre/llite/llite_close.c
@@ -284,10 +284,8 @@ static void ll_done_writing(struct inode *inode)
 	LASSERT(exp_connect_som(ll_i2mdexp(inode)));
 
 	op_data = kzalloc(sizeof(*op_data), GFP_NOFS);
-	if (!op_data) {
-		CERROR("can't allocate op_data\n");
+	if (!op_data)
 		return;
-	}
 
 	ll_prepare_done_writing(inode, op_data, &och);
 	/* If there is no @och, we do not do D_W yet. */
diff --git a/drivers/staging/lustre/lustre/llite/xattr_cache.c b/drivers/staging/lustre/lustre/llite/xattr_cache.c
index e2badf1..7e2fcfe 100644
--- a/drivers/staging/lustre/lustre/llite/xattr_cache.c
+++ b/drivers/staging/lustre/lustre/llite/xattr_cache.c
@@ -133,11 +133,8 @@ static int ll_xattr_cache_add(struct list_head *cache,
 		goto err_name;
 	}
 	xattr->xe_value = kzalloc(xattr_val_len, GFP_NOFS);
-	if (!xattr->xe_value) {
-		CDEBUG(D_CACHE, "failed to alloc xattr value %d\n",
-		       xattr_val_len);
+	if (!xattr->xe_value)
 		goto err_value;
-	}
 
 	memcpy(xattr->xe_value, xattr_val, xattr_val_len);
 	xattr->xe_vallen = xattr_val_len;
-- 
1.9.1

