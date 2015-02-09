From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Feb 2015 13:58:16 +0000
Subject: [patch] drm/nouveau/mmu: shift wrapping bug in gf100_vm_map()
Message-Id: <20150209135816.GB26866@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

Since "1" is an int, then it means we can't use the high bits of this
u64.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c
index 294cda3..b10c90a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/gf100.c
@@ -106,7 +106,7 @@ static void
 gf100_vm_map(struct nvkm_vma *vma, struct nvkm_gpuobj *pgt,
 	     struct nvkm_mem *mem, u32 pte, u32 cnt, u64 phys, u64 delta)
 {
-	u64 next = 1 << (vma->node->type - 8);
+	u64 next = 1ULL << (vma->node->type - 8);
 
 	phys  = gf100_vm_addr(vma, phys, mem->memtype, 0);
 	pte <<= 3;
