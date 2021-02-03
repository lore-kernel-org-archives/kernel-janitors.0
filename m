From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Feb 2021 14:17:01 +0000
Subject: [PATCH][next] drm/nouveau/fifo/tu102: Fix potential array out of bounds access error
Message-Id: <20210203141701.23342-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the for_each_set_bit loop is iterating index engn from 0..31 and
calls to tu102_fifo_recover_engn can potentiall access fifo->engine[engn]
where engn is larger than the array engine (which is currently hard coded
as 16 elements).  Avoid any potential array out of bounds accesses by
replacing the hard coded value 32 with the number of elements in the array.

Addresses-Coverity: ("Out-of-bounds access")
Fixes: 26a0cfc163ab ("drm/nouveau/fifo/tu102: FIFO interrupt fixes for Turing")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
index 14e5b70e0255..1f33f8c757bf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/tu102.c
@@ -366,7 +366,7 @@ tu102_fifo_intr_ctxsw_timeout(struct gk104_fifo *fifo)
 	engm = nvkm_rd32(device, 0x2a30);
 	nvkm_wr32(device, 0x2a30, engm);
 
-	for_each_set_bit(engn, &engm, 32)
+	for_each_set_bit(engn, &engm, ARRAY_SIZE(fifo->engine))
 		tu102_fifo_recover_engn(fifo, engn);
 
 	spin_unlock_irqrestore(&fifo->base.lock, flags);
-- 
2.29.2
