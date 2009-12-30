From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Wed, 30 Dec 2009 01:20:05 +0000
Subject: [PATCH] drm/radeon/radeon_fence.c: move a dereference below the
Message-Id: <1262136005.8733.26.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

If a NULL value is possible, the dereference should only occur after the
NULL test.

Coverity CID: 13334

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

diff --git drivers/gpu/drm/radeon/radeon_fence.c drivers/gpu/drm/radeon/radeon_fence.c
index 4cdd8b4..f3a8380 100644
--- drivers/gpu/drm/radeon/radeon_fence.c
+++ drivers/gpu/drm/radeon/radeon_fence.c
@@ -140,14 +140,14 @@ int radeon_fence_create(struct radeon_device *rdev, struct radeon_fence **fence)
 
 bool radeon_fence_signaled(struct radeon_fence *fence)
 {
-	struct radeon_device *rdev = fence->rdev;
 	unsigned long irq_flags;
 	bool signaled = false;
 
-	if (rdev->gpu_lockup) {
+	if (fence = NULL) {
 		return true;
 	}
-	if (fence = NULL) {
+
+	if (fence->rdev->gpu_lockup) {
 		return true;
 	}
 	write_lock_irqsave(&fence->rdev->fence_drv.lock, irq_flags);


