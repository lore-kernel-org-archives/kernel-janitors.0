From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Thu, 08 Mar 2018 02:03:34 +0000
Subject: [PATCH 5/5] drm/vgem: Remove '(' from the end of line
Message-Id: <58bfa1f547c18bf8d145b1a8500f3a5f6df3704e.1520474055.git.rodrigosiqueiramelo@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1520474055.git.rodrigosiqueiramelo@gmail.com>
In-Reply-To: <cover.1520474055.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

This patch fixes the checkpatch.pl check:

vgem_drv.c:91: CHECK: Lines should not end with a '('

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 6e6084e3204a..4ddf3b8c3875 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -87,10 +87,10 @@ static int vgem_gem_fault(struct vm_fault *vmf)
 	mutex_unlock(&obj->pages_lock);
 	if (ret) {
 		struct page *page;
+		struct address_space *mapping;
 
-		page = shmem_read_mapping_page(
-					file_inode(obj->base.filp)->i_mapping,
-					page_offset);
+		mapping = file_inode(obj->base.filp)->i_mapping;
+		page = shmem_read_mapping_page(mapping, page_offset);
 		if (!IS_ERR(page)) {
 			vmf->page = page;
 			ret = 0;
-- 
2.16.2

