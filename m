From: Dan Carpenter <error27@gmail.com>
Date: Mon, 23 Aug 2010 16:14:07 +0000
Subject: [patch] i915: signedness bugs in i915 ring buffer
Message-Id: <20100823161407.GB19909@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Eric Anholt <eric@anholt.net>, Chris Wilson <chris@chris-wilson.co.uk>, Zou Nan hai <nanhai.zou@intel.com>, Xiang Hai hao <haihao.xiang@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"ring->space" is unsigned so it's never less than zero.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/i915/intel_ringbuffer.c b/drivers/gpu/drm/i915/intel_ringbuffer.c
index 51e9c9e..a331898 100644
--- a/drivers/gpu/drm/i915/intel_ringbuffer.c
+++ b/drivers/gpu/drm/i915/intel_ringbuffer.c
@@ -208,9 +208,10 @@ static int init_ring_common(struct drm_device *dev,
 	else {
 		ring->head = ring->get_head(dev, ring);
 		ring->tail = ring->get_tail(dev, ring);
-		ring->space = ring->head - (ring->tail + 8);
-		if (ring->space < 0)
-			ring->space += ring->size;
+		if (ring->head >= ring->tail + 8)
+			ring->space = ring->head - (ring->tail + 8);
+		else
+			ring->space = ring->head - (ring->tail + 8) + ring->size;
 	}
 	return 0;
 }
@@ -666,9 +667,10 @@ int intel_init_ring_buffer(struct drm_device *dev,
 	else {
 		ring->head = ring->get_head(dev, ring);
 		ring->tail = ring->get_tail(dev, ring);
-		ring->space = ring->head - (ring->tail + 8);
-		if (ring->space < 0)
-			ring->space += ring->size;
+		if (ring->head >= ring->tail + 8)
+			ring->space = ring->head - (ring->tail + 8);
+		else
+			ring->space = ring->head - (ring->tail + 8) + ring->size;
 	}
 	INIT_LIST_HEAD(&ring->active_list);
 	INIT_LIST_HEAD(&ring->request_list);
@@ -735,9 +737,10 @@ int intel_wait_ring_buffer(struct drm_device *dev,
 	end = jiffies + 3 * HZ;
 	do {
 		ring->head = ring->get_head(dev, ring);
-		ring->space = ring->head - (ring->tail + 8);
-		if (ring->space < 0)
-			ring->space += ring->size;
+		if (ring->head >= ring->tail + 8)
+			ring->space = ring->head - (ring->tail + 8);
+		else
+			ring->space = ring->head - (ring->tail + 8) + ring->size;
 		if (ring->space >= n) {
 			trace_i915_ring_wait_end (dev);
 			return 0;
diff --git a/drivers/gpu/drm/i915/i915_dma.c b/drivers/gpu/drm/i915/i915_dma.c
index 44af317..707f32f 100644
--- a/drivers/gpu/drm/i915/i915_dma.c
+++ b/drivers/gpu/drm/i915/i915_dma.c
@@ -109,9 +109,10 @@ void i915_kernel_lost_context(struct drm_device * dev)
 
 	ring->head = I915_READ(PRB0_HEAD) & HEAD_ADDR;
 	ring->tail = I915_READ(PRB0_TAIL) & TAIL_ADDR;
-	ring->space = ring->head - (ring->tail + 8);
-	if (ring->space < 0)
-		ring->space += ring->size;
+	if (ring->head >= ring->tail + 8)
+		ring->space = ring->head - (ring->tail + 8);
+	else
+		ring->space = ring->head - (ring->tail + 8) + ring->size;
 
 	if (!dev->primary->master)
 		return;
