From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Tue, 10 Feb 2015 11:09:45 +0000
Subject: [PATCH 1/1] staging: android: Remove allocation from declaration line
Message-Id: <20150210110945.GA17910@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arve =?utf-8?B?SGrvv71ubmV277+9Zw==?= <arve@android.com>, Riley Andrews <riandrews@android.com>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This patch removes allocation from declaration line because
people are known to gloss over declarations.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/android/ion/ion_page_pool.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/android/ion/ion_page_pool.c b/drivers/staging/android/ion/ion_page_pool.c
index 4b88f11..7643d83 100644
--- a/drivers/staging/android/ion/ion_page_pool.c
+++ b/drivers/staging/android/ion/ion_page_pool.c
@@ -148,8 +148,9 @@ int ion_page_pool_shrink(struct ion_page_pool *pool, gfp_t gfp_mask,
 
 struct ion_page_pool *ion_page_pool_create(gfp_t gfp_mask, unsigned int order)
 {
-	struct ion_page_pool *pool = kmalloc(sizeof(struct ion_page_pool),
-					     GFP_KERNEL);
+	struct ion_page_pool *pool;
+
+	pool = kmalloc(sizeof(struct ion_page_pool), GFP_KERNEL);
 	if (!pool)
 		return NULL;
 	pool->high_count = 0;
-- 
1.9.1

