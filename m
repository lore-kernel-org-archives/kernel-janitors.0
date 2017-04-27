From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Apr 2017 09:12:56 +0000
Subject: [PATCH] drm/nouveau/fifo/gk104-: Silence a locking warning
Message-Id: <20170427091256.z3l3rp4fxjxcatnv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Presumably we can never actually hit this return, but static checkers
complain that we should unlock before we return.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
index 3a24788c3185..a7e55c422501 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -148,7 +148,7 @@ gk104_fifo_runlist_commit(struct gk104_fifo *fifo, int runl)
 	case NVKM_MEM_TARGET_NCOH: target = 3; break;
 	default:
 		WARN_ON(1);
-		return;
+		goto unlock;
 	}
 
 	nvkm_wr32(device, 0x002270, (nvkm_memory_addr(mem) >> 12) |
@@ -160,6 +160,7 @@ gk104_fifo_runlist_commit(struct gk104_fifo *fifo, int runl)
 				       & 0x00100000),
 			       msecs_to_jiffies(2000)) = 0)
 		nvkm_error(subdev, "runlist %d update timeout\n", runl);
+unlock:
 	mutex_unlock(&subdev->mutex);
 }
 
