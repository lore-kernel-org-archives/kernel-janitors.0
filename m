From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Oct 2011 14:34:53 +0000
Subject: [patch] drm/nva3: checking the wrong variable
Message-Id: <20111011143453.GA29096@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

"id" is unsigned here and it's never less than zero.  I believe the
intent was to check the return value from nva3_pm_pll_offset().
Also I've changed it to pass on the -ENOENT error code from the lower
levels instead of returning -EINVAL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nva3_pm.c b/drivers/gpu/drm/nouveau/nva3_pm.c
index e4b2b9e..0be517d 100644
--- a/drivers/gpu/drm/nouveau/nva3_pm.c
+++ b/drivers/gpu/drm/nouveau/nva3_pm.c
@@ -112,8 +112,8 @@ nva3_pm_clock_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl,
 		return (ret = -ENOENT) ? NULL : ERR_PTR(ret);
 
 	off = nva3_pm_pll_offset(id);
-	if (id < 0)
-		return ERR_PTR(-EINVAL);
+	if (off < 0)
+		return ERR_PTR(off);
 
 
 	pll = kzalloc(sizeof(*pll), GFP_KERNEL);
