From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Jan 2019 10:49:46 +0000
Subject: [PATCH] drm/etnaviv: NULL vs IS_ERR() buf in etnaviv_core_dump()
Message-Id: <20190114104946.GA22444@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lucas Stach <l.stach@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>

The etnaviv_gem_get_pages() never returns NULL.  It returns error
pointers on error.

Fixes: a8c21a5451d8 ("drm/etnaviv: add initial etnaviv DRM driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_dump.c b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
index 3fbb4855396c..33854c94cb85 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_dump.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_dump.c
@@ -215,7 +215,7 @@ void etnaviv_core_dump(struct etnaviv_gpu *gpu)
 		mutex_lock(&obj->lock);
 		pages = etnaviv_gem_get_pages(obj);
 		mutex_unlock(&obj->lock);
-		if (pages) {
+		if (!IS_ERR(pages)) {
 			int j;
 
 			iter.hdr->data[0] = bomap - bomap_start;
-- 
2.17.1
