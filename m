From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 May 2020 11:29:55 +0000
Subject: [PATCH] drm/etnaviv: Fix a leak in submit_pin_objects()
Message-Id: <20200518112955.GA48709@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lucas Stach <l.stach@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>, Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, kernel-janitors@vger.kernel.org, etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>

If the mapping address is wrong then we have to release the reference to
it before returning -EINVAL.

Fixes: 088880ddc0b2 ("drm/etnaviv: implement softpin")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Untested.

 drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
index 3b0afa156d92..54def341c1db 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
@@ -238,8 +238,10 @@ static int submit_pin_objects(struct etnaviv_gem_submit *submit)
 		}
 
 		if ((submit->flags & ETNA_SUBMIT_SOFTPIN) &&
-		     submit->bos[i].va != mapping->iova)
+		     submit->bos[i].va != mapping->iova) {
+			etnaviv_gem_mapping_unreference(mapping);
 			return -EINVAL;
+		}
 
 		atomic_inc(&etnaviv_obj->gpu_active);
 
-- 
2.26.2
