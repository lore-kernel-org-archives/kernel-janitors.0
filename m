From: Dan Carpenter <error27@gmail.com>
Date: Thu, 03 Jun 2010 09:57:55 +0000
Subject: [patch] drm/ttm: return -EFAULT on copy_to_user error
Message-Id: <20100603095755.GQ5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Jerome Glisse <jglisse@redhat.com>, Michel =?iso-8859-1?Q?D=E4nzer?= <daenzer@vmware.com>, Dave Airlie <airlied@redhat.com>

copy_to/from_user() returns the number of bytes remaining and this
function normally returns negative error codes.  No one uses the
ttm_bo_fbdev_io() function so this change has no impact.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index fe6cb77..fe4a25a 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -444,7 +444,7 @@ ssize_t ttm_bo_fbdev_io(struct ttm_buffer_object *bo, const char __user *wbuf,
 	ttm_bo_unref(&bo);
 
 	if (unlikely(ret != 0))
-		return ret;
+		return -EFAULT;
 
 	*f_pos += io_size;
 
