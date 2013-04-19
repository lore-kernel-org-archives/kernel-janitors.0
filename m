From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Apr 2013 07:07:37 +0000
Subject: [patch] drm: add a couple __user annotations
Message-Id: <20130419070737.GA25750@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

"list" and "request" are already declared as __user pointers, it's just
this cast which is missing the annotation.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Sparse doesn't complain about this because it hits the "error: bad
integer constant expression" and stops printing warnings.

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index 2f4c434..764794b 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -457,7 +457,7 @@ static int compat_drm_infobufs(struct file *file, unsigned int cmd,
 	request = compat_alloc_user_space(nbytes);
 	if (!access_ok(VERIFY_WRITE, request, nbytes))
 		return -EFAULT;
-	list = (struct drm_buf_desc *) (request + 1);
+	list = (struct drm_buf_desc __user *) (request + 1);
 
 	if (__put_user(count, &request->count)
 	    || __put_user(list, &request->list))
@@ -518,7 +518,7 @@ static int compat_drm_mapbufs(struct file *file, unsigned int cmd,
 	request = compat_alloc_user_space(nbytes);
 	if (!access_ok(VERIFY_WRITE, request, nbytes))
 		return -EFAULT;
-	list = (struct drm_buf_pub *) (request + 1);
+	list = (struct drm_buf_pub __user *) (request + 1);
 
 	if (__put_user(count, &request->count)
 	    || __put_user(list, &request->list))
