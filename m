From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Jul 2018 12:29:21 +0000
Subject: [PATCH] drm/vgem: off by one in vgem_gem_fault()
Message-Id: <20180703122921.brlfxl4vx2ybvrd2@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Laura Abbott <labbott@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Brian Norris <briannorris@chromium.org>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Cihangir Akturk <cakturk@gmail.com>, Souptick Joarder <jrdr.linux@gmail.com>

If page_offset is = num_pages then we end up reading beyond the end of
obj->pages[].

Fixes: af33a9190d02 ("drm/vgem: Enable dmabuf import interfaces")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  Not tested

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index c64a85950c82..0e5620f76ee0 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -74,7 +74,7 @@ static vm_fault_t vgem_gem_fault(struct vm_fault *vmf)
 
 	num_pages = DIV_ROUND_UP(obj->base.size, PAGE_SIZE);
 
-	if (page_offset > num_pages)
+	if (page_offset >= num_pages)
 		return VM_FAULT_SIGBUS;
 
 	mutex_lock(&obj->pages_lock);
