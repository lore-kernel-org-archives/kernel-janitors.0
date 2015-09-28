From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2015 10:02:42 +0000
Subject: [patch] drm/mgag200: set an error code
Message-Id: <20150928100242.GD11367@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Archit Taneja <architt@codeaurora.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We need to set "ret" if vmalloc() fails.

Fixes: aec9e12953e7 ('drm/mgag200: Fix error handling paths in fbdev driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/mgag200/mgag200_fb.c b/drivers/gpu/drm/mgag200/mgag200_fb.c
index b35b5b2..2a1049e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_fb.c
+++ b/drivers/gpu/drm/mgag200/mgag200_fb.c
@@ -185,8 +185,10 @@ static int mgag200fb_create(struct drm_fb_helper *helper,
 	}
 
 	sysram = vmalloc(size);
-	if (!sysram)
+	if (!sysram) {
+		ret = -ENOMEM;
 		goto err_sysram;
+	}
 
 	info = drm_fb_helper_alloc_fbi(helper);
 	if (IS_ERR(info)) {
