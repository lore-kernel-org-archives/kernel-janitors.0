From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Apr 2017 19:48:28 +0000
Subject: [PATCH] drm/i915/gvt: fix a bounds check in ring_id_to_context_switch_event()
Message-Id: <20170413194828.GF591@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>, intel-gvt-dev@lists.freedesktop.org

There are two bugs here.  The && should be || and the > is off by one so
it should be >= ARRAY_SIZE().

Fixes: 8453d674ae7e ("drm/i915/gvt: vGPU execlist virtualization")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/gvt/execlist.c b/drivers/gpu/drm/i915/gvt/execlist.c
index 536bde8638c8..026c491716d5 100644
--- a/drivers/gpu/drm/i915/gvt/execlist.c
+++ b/drivers/gpu/drm/i915/gvt/execlist.c
@@ -56,8 +56,8 @@ static int context_switch_events[] = {
 
 static int ring_id_to_context_switch_event(int ring_id)
 {
-	if (WARN_ON(ring_id < RCS && ring_id >
-				ARRAY_SIZE(context_switch_events)))
+	if (WARN_ON(ring_id < RCS ||
+		    ring_id >= ARRAY_SIZE(context_switch_events)))
 		return -EINVAL;
 
 	return context_switch_events[ring_id];
