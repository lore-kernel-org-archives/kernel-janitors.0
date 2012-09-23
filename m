From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 23 Sep 2012 16:33:55 +0000
Subject: [patch] vmwgfx: corruption in vmw_event_fence_action_create()
Message-Id: <20120923163355.GC21396@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Dave Airlie <airlied@redhat.com>, Thomas Hellstrom <thellstrom@vmware.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We don't allocate enough data for this struct.  As soon as we start
modifying event->event on the next lines, then we're going beyond the
end of the memory we allocated.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker work.  Not tested.

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index f2fb8f1..7e07433 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -1018,7 +1018,7 @@ int vmw_event_fence_action_create(struct drm_file *file_priv,
 	}
 
 
-	event = kzalloc(sizeof(event->event), GFP_KERNEL);
+	event = kzalloc(sizeof(*event), GFP_KERNEL);
 	if (unlikely(event = NULL)) {
 		DRM_ERROR("Failed to allocate an event.\n");
 		ret = -ENOMEM;
