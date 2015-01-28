From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Jan 2015 06:43:35 +0000
Subject: [patch] drm/bridge: checking the wrong variable
Message-Id: <20150128064335.GC30893@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We were supposed to check "fmts" here instead of "formats".  I suppose
it eventually leads to a NULL dereference.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 98fb640..8ae239f 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -783,7 +783,7 @@ int drm_display_info_set_bus_formats(struct drm_display_info *info,
 	if (formats && num_formats) {
 		fmts = kmemdup(formats, sizeof(*formats) * num_formats,
 			       GFP_KERNEL);
-		if (!formats)
+		if (!fmts)
 			return -ENOMEM;
 	}
 
