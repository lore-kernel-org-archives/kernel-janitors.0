From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2018 11:44:29 +0000
Subject: [PATCH] drm/gma500: simplify a condition in psbfb_mmap()
Message-Id: <20180323114429.GE28518@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Since we enforce that "vma->vm_pgoff" has to be zero it means we don't
need an additional cap on the upper bound.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index cb0a2ae916e0..a6732bffb2e2 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -166,9 +166,7 @@ static int psbfb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	struct psb_fbdev *fbdev = info->par;
 	struct psb_framebuffer *psbfb = &fbdev->pfb;
 
-	if (vma->vm_pgoff != 0)
-		return -EINVAL;
-	if (vma->vm_pgoff > (~0UL >> PAGE_SHIFT))
+	if (vma->vm_pgoff)
 		return -EINVAL;
 
 	if (!psbfb->addr_space)
