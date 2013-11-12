From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Nov 2013 10:25:26 +0000
Subject: [patch v2] drm/tegra: fix small leak on error in tegra_fb_alloc()
Message-Id: <20131112102526.GA10651@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Terje =?iso-8859-1?Q?Bergstr=F6m?= <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org

If we don't have enough memory for ->planes then we leak "fb".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: tiny style changes

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index 490f771..f9d2de6 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -98,8 +98,10 @@ static struct tegra_fb *tegra_fb_alloc(struct drm_device *drm,
 		return ERR_PTR(-ENOMEM);
 
 	fb->planes = kzalloc(num_planes * sizeof(*planes), GFP_KERNEL);
-	if (!fb->planes)
+	if (!fb->planes) {
+		kfree(fb);
 		return ERR_PTR(-ENOMEM);
+	}
 
 	fb->num_planes = num_planes;
 
