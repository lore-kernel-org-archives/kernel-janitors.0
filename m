From: Dan Carpenter <error27@gmail.com>
Date: Sat, 25 Jun 2011 05:53:24 +0000
Subject: [patch] nouveau: free the memory in nouveau_gart_manager_del()
Message-Id: <20110625055324.GS14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>
Cc: kernel-janitors@vger.kernel.org, Roy Spliet <r.spliet@student.tudelft.nl>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>

In the original code the kfree() doesn't do anything because
"mem->mm_node" has been set to NULL.  This was introduced in
d2f96666c56a "drm/nouveau: create temp vmas for both src and dst of
bo moves"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 765f0e5..ab79bf8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -846,8 +846,8 @@ nouveau_gart_manager_del(struct ttm_mem_type_manager *man,
 			 struct ttm_mem_reg *mem)
 {
 	nouveau_mem_node_cleanup(mem->mm_node);
-	mem->mm_node = NULL;
 	kfree(mem->mm_node);
+	mem->mm_node = NULL;
 }
 
 static int
