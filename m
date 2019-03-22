From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Mar 2019 06:41:25 +0000
Subject: [PATCH] drm: shmem: Off by one in drm_gem_shmem_fault()
Message-Id: <20190322064125.GA12551@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>

The shmem->pages[] array has "num_pages" elements so the > should be >to prevent reading beyond the end of the array.  The shmem->pages[]
array is allocated in drm_gem_shmem_prime_import_sg_table().

Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 3750a982aaf6..1ee208c2c85e 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -408,7 +408,7 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 	loff_t num_pages = obj->size >> PAGE_SHIFT;
 	struct page *page;
 
-	if (vmf->pgoff > num_pages || WARN_ON_ONCE(!shmem->pages))
+	if (vmf->pgoff >= num_pages || WARN_ON_ONCE(!shmem->pages))
 		return VM_FAULT_SIGBUS;
 
 	page = shmem->pages[vmf->pgoff];
-- 
2.17.1
