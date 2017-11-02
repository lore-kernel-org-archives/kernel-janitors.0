From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Nov 2017 09:33:45 +0000
Subject: [PATCH] drm/msm: fix spelling mistake: "ringubffer" -> "ringbuffer"
Message-Id: <20171102093345.17133-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DRM_DEV_ERROR error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index e2ffecce59a3..2f0610f8fc8d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -461,7 +461,7 @@ void adreno_wait_ring(struct msm_ringbuffer *ring, uint32_t ndwords)
 {
 	if (spin_until(ring_freewords(ring) >= ndwords))
 		DRM_DEV_ERROR(ring->gpu->dev->dev,
-			"timeout waiting for space in ringubffer %d\n",
+			"timeout waiting for space in ringbuffer %d\n",
 			ring->id);
 }
 
-- 
2.14.1

