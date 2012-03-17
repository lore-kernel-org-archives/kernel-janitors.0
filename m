From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 17 Mar 2012 17:03:29 +0000
Subject: [PATCH] drivers/gpu/drm/radeon/radeon_cs.c: eliminate possible double free
Message-Id: <1332003809-23269-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Jerome Glisse <jglisse@redhat.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The function radeon_cs_parser_init is only called from two places, in
drivers/gpu/drm/radeon/radeon_cs.c and drivers/gpu/drm/radeon/r600_cs.c.
In each case, if the call fails another function is called that frees all
of the kdata and dpage information in the chunks array.  So this
information should not be freed in radeon_cs_parser_init as well.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/radeon/radeon_cs.c |   16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 9b4124e..d9d9f5a 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -243,20 +243,11 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 	if ((p->cs_flags & RADEON_CS_USE_VM) &&
 	    !p->rdev->vm_manager.enabled) {
 		DRM_ERROR("VM not active on asic!\n");
-		if (p->chunk_relocs_idx != -1)
-			kfree(p->chunks[p->chunk_relocs_idx].kdata);
-		if (p->chunk_flags_idx != -1)
-			kfree(p->chunks[p->chunk_flags_idx].kdata);
 		return -EINVAL;
 	}
 
-	if (radeon_cs_get_ring(p, ring, priority)) {
-		if (p->chunk_relocs_idx != -1)
-			kfree(p->chunks[p->chunk_relocs_idx].kdata);
-		if (p->chunk_flags_idx != -1)
-			kfree(p->chunks[p->chunk_flags_idx].kdata);
+	if (radeon_cs_get_ring(p, ring, priority))
 		return -EINVAL;
-	}
 
 
 	/* deal with non-vm */
@@ -271,11 +262,8 @@ int radeon_cs_parser_init(struct radeon_cs_parser *p, void *data)
 		p->chunks[p->chunk_ib_idx].kpage[0] = kmalloc(PAGE_SIZE, GFP_KERNEL);
 		p->chunks[p->chunk_ib_idx].kpage[1] = kmalloc(PAGE_SIZE, GFP_KERNEL);
 		if (p->chunks[p->chunk_ib_idx].kpage[0] = NULL ||
-		    p->chunks[p->chunk_ib_idx].kpage[1] = NULL) {
-			kfree(p->chunks[p->chunk_ib_idx].kpage[0]);
-			kfree(p->chunks[p->chunk_ib_idx].kpage[1]);
+		    p->chunks[p->chunk_ib_idx].kpage[1] = NULL)
 			return -ENOMEM;
-		}
 		p->chunks[p->chunk_ib_idx].kpage_idx[0] = -1;
 		p->chunks[p->chunk_ib_idx].kpage_idx[1] = -1;
 		p->chunks[p->chunk_ib_idx].last_copied_page = -1;

