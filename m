From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 14 Jul 2018 11:04:13 +0000
Subject: [PATCH] drm/vkms: off by one in vkms_gem_fault()
Message-Id: <20180714104951.akt34gkcq54d5pvl@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

The > should be >= so that we don't read one page beyond the end of the
obj->pages[] array.

Fixes: 559e50fd34d1 ("drm/vkms: Add dumb operations")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
index c7e38368602b..2cca8c2f260f 100644
--- a/drivers/gpu/drm/vkms/vkms_gem.c
+++ b/drivers/gpu/drm/vkms/vkms_gem.c
@@ -55,7 +55,7 @@ int vkms_gem_fault(struct vm_fault *vmf)
 	page_offset = (vaddr - vma->vm_start) >> PAGE_SHIFT;
 	num_pages = DIV_ROUND_UP(obj->gem.size, PAGE_SIZE);
 
-	if (page_offset > num_pages)
+	if (page_offset >= num_pages)
 		return VM_FAULT_SIGBUS;
 
 	ret = -ENOENT;
