From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jan 2016 09:06:46 +0000
Subject: [patch] drm/vmwgfx: fix a NULL dereference
Message-Id: <20160128090646.GA5824@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Daniel Stone <daniels@collabora.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>

We dereference "eaction->event" inside the call to drm_send_event_locked()
so should hold off on setting it to NULL until afterward.

Fixes: fb740cf2492c ("drm: Create drm_send_event helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index e0edf14..37c305b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -880,8 +880,8 @@ static void vmw_event_fence_action_seq_passed(struct vmw_fence_action *action)
 	}
 
 	list_del_init(&eaction->fpriv_head);
-	eaction->event = NULL;
 	drm_send_event_locked(dev, eaction->event);
+	eaction->event = NULL;
 	spin_unlock_irqrestore(&dev->event_lock, irq_flags);
 }
 
