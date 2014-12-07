From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 07 Dec 2014 19:21:02 +0000
Subject: [PATCH 20/20] drm/radeon: fix misspelling of current function in string
Message-Id: <1417980062-25151-21-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>
Cc: kernel-janitors@vger.kernel.org, linux@rasmusvillemoes.dk, joe@perches.com, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Replace a misspelled function name by %s and then __func__.

This was done using Coccinelle, including the use of Levenshtein distance,
as proposed by Rasmus Villemoes.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
The semantic patch is difficult to summarize, but is available in the cover
letter of this patch series.

 drivers/gpu/drm/radeon/cik.c |   16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
index 6dcde37..24d5e43 100644
--- a/drivers/gpu/drm/radeon/cik.c
+++ b/drivers/gpu/drm/radeon/cik.c
@@ -7367,34 +7367,38 @@ int cik_irq_set(struct radeon_device *rdev)
 	}
 	if (atomic_read(&rdev->irq.ring_int[CAYMAN_RING_TYPE_CP1_INDEX])) {
 		struct radeon_ring *ring = &rdev->ring[CAYMAN_RING_TYPE_CP1_INDEX];
-		DRM_DEBUG("si_irq_set: sw int cp1\n");
+		DRM_DEBUG("%s: sw int cp1\n", __func__);
 		if (ring->me = 1) {
 			switch (ring->pipe) {
 			case 0:
 				cp_m1p0 |= TIME_STAMP_INT_ENABLE;
 				break;
 			default:
-				DRM_DEBUG("si_irq_set: sw int cp1 invalid pipe %d\n", ring->pipe);
+				DRM_DEBUG("%s: sw int cp1 invalid pipe %d\n",
+					  __func__, ring->pipe);
 				break;
 			}
 		} else {
-			DRM_DEBUG("si_irq_set: sw int cp1 invalid me %d\n", ring->me);
+			DRM_DEBUG("%s: sw int cp1 invalid me %d\n", __func__,
+				  ring->me);
 		}
 	}
 	if (atomic_read(&rdev->irq.ring_int[CAYMAN_RING_TYPE_CP2_INDEX])) {
 		struct radeon_ring *ring = &rdev->ring[CAYMAN_RING_TYPE_CP2_INDEX];
-		DRM_DEBUG("si_irq_set: sw int cp2\n");
+		DRM_DEBUG("%s: sw int cp2\n", __func__);
 		if (ring->me = 1) {
 			switch (ring->pipe) {
 			case 0:
 				cp_m1p0 |= TIME_STAMP_INT_ENABLE;
 				break;
 			default:
-				DRM_DEBUG("si_irq_set: sw int cp2 invalid pipe %d\n", ring->pipe);
+				DRM_DEBUG("%s: sw int cp2 invalid pipe %d\n",
+					  __func__, ring->pipe);
 				break;
 			}
 		} else {
-			DRM_DEBUG("si_irq_set: sw int cp2 invalid me %d\n", ring->me);
+			DRM_DEBUG("%s: sw int cp2 invalid me %d\n", __func__,
+				  ring->me);
 		}
 	}
 

