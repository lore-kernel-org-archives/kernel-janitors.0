From: Julia Lawall <julia@diku.dk>
Date: Sat, 15 May 2010 21:17:40 +0000
Subject: [PATCH 15/37] drivers/gpu/drm: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005152317190.21345@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use kmemdup when some other buffer is immediately copied into the
allocated region.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
statement S;
@@

-  to = \(kmalloc\|kzalloc\)(size,flag);
+  to = kmemdup(from,size,flag);
   if (to=NULL || ...) S
-  memcpy(to, from, size);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpu/drm/nouveau/nouveau_grctx.c |    6 ++----
 drivers/gpu/drm/radeon/radeon_bios.c    |    3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff -u -p a/drivers/gpu/drm/nouveau/nouveau_grctx.c b/drivers/gpu/drm/nouveau/nouveau_grctx.c
--- a/drivers/gpu/drm/nouveau/nouveau_grctx.c
+++ b/drivers/gpu/drm/nouveau/nouveau_grctx.c
@@ -68,13 +68,12 @@ nouveau_grctx_prog_load(struct drm_devic
 			return ret;
 		}
 
-		pgraph->ctxprog = kmalloc(fw->size, GFP_KERNEL);
+		pgraph->ctxprog = kmemdup(fw->data, fw->size, GFP_KERNEL);
 		if (!pgraph->ctxprog) {
 			NV_ERROR(dev, "OOM copying ctxprog\n");
 			release_firmware(fw);
 			return -ENOMEM;
 		}
-		memcpy(pgraph->ctxprog, fw->data, fw->size);
 
 		cp = pgraph->ctxprog;
 		if (le32_to_cpu(cp->signature) != 0x5043564e ||
@@ -97,14 +96,13 @@ nouveau_grctx_prog_load(struct drm_devic
 			return ret;
 		}
 
-		pgraph->ctxvals = kmalloc(fw->size, GFP_KERNEL);
+		pgraph->ctxvals = kmemdup(fw->data, fw->size, GFP_KERNEL);
 		if (!pgraph->ctxvals) {
 			NV_ERROR(dev, "OOM copying ctxvals\n");
 			release_firmware(fw);
 			nouveau_grctx_fini(dev);
 			return -ENOMEM;
 		}
-		memcpy(pgraph->ctxvals, fw->data, fw->size);
 
 		cv = (void *)pgraph->ctxvals;
 		if (le32_to_cpu(cv->signature) != 0x5643564e ||
diff -u -p a/drivers/gpu/drm/radeon/radeon_bios.c b/drivers/gpu/drm/radeon/radeon_bios.c
--- a/drivers/gpu/drm/radeon/radeon_bios.c
+++ b/drivers/gpu/drm/radeon/radeon_bios.c
@@ -85,12 +85,11 @@ static bool radeon_read_bios(struct rade
 		pci_unmap_rom(rdev->pdev, bios);
 		return false;
 	}
-	rdev->bios = kmalloc(size, GFP_KERNEL);
+	rdev->bios = kmemdup(bios, size, GFP_KERNEL);
 	if (rdev->bios = NULL) {
 		pci_unmap_rom(rdev->pdev, bios);
 		return false;
 	}
-	memcpy(rdev->bios, bios, size);
 	pci_unmap_rom(rdev->pdev, bios);
 	return true;
 }
