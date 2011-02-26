From: Dan Carpenter <error27@gmail.com>
Date: Sat, 26 Feb 2011 12:48:12 +0000
Subject: [patch] staging: gma500: fix some swapped gotos
Message-Id: <20110226124812.GH18043@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These gotos were swapped.  In the original code, the first would result
in a NULL dereference and the second would result in a memory leak.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/gma500/psb_fb.c b/drivers/staging/gma500/psb_fb.c
index 6585e88..9f4b570 100644
--- a/drivers/staging/gma500/psb_fb.c
+++ b/drivers/staging/gma500/psb_fb.c
@@ -458,7 +458,7 @@ static int psbfb_create(struct psb_fbdev *fbdev,
 	if (!fb) {
 		DRM_ERROR("failed to allocate fb.\n");
 		ret = -ENOMEM;
-		goto out_err0;
+		goto out_err1;
 	}
 	psbfb = to_psb_fb(fb);
 	psbfb->size = size;
@@ -466,7 +466,7 @@ static int psbfb_create(struct psb_fbdev *fbdev,
 	info = framebuffer_alloc(sizeof(struct psb_fbdev), device);
 	if (!info) {
 		ret = -ENOMEM;
-		goto out_err1;
+		goto out_err0;
 	}
 
 	info->par = fbdev;
