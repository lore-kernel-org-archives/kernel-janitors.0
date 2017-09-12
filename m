From: Colin King <colin.king@canonical.com>
Date: Tue, 12 Sep 2017 17:34:22 +0000
Subject: [PATCH][V2] drm: qxl: remove pr_info message, stops log spamming
Message-Id: <20170912173422.14062-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, David Airlie <airlied@linux.ie>, virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Simply mmap'ing /dev/dri/card0 repeatedly will spam the kernel
log with qxl_mmap information messages. The following example code
illustrates this:

int main(void)
{
	int fd = open("/dev/dri/card0", O_RDONLY);
	if (fd = -1)
		err(1, "open failed");

	for (;;) {
		void *m = mmap(NULL, 4096, PROT_READ,
			MAP_SHARED, fd, 0);
		if (m != MAP_FAILED)
			munmap(m, 4096);
	}
}

Stop the spamming by removing the pr_info message. Since the mmap'ing
returns -EINVAL there is no need for the pr_info message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/qxl/qxl_ttm.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
index 7ecf8a4b9fe6..0f50c0b25a58 100644
--- a/drivers/gpu/drm/qxl/qxl_ttm.c
+++ b/drivers/gpu/drm/qxl/qxl_ttm.c
@@ -123,11 +123,8 @@ int qxl_mmap(struct file *filp, struct vm_area_struct *vma)
 	struct qxl_device *qdev;
 	int r;
 
-	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET)) {
-		pr_info("%s: vma->vm_pgoff (%ld) < DRM_FILE_PAGE_OFFSET\n",
-			__func__, vma->vm_pgoff);
+	if (unlikely(vma->vm_pgoff < DRM_FILE_PAGE_OFFSET))
 		return -EINVAL;
-	}
 
 	file_priv = filp->private_data;
 	qdev = file_priv->minor->dev->dev_private;
-- 
2.14.1

