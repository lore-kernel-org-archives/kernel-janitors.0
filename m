From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 05 Oct 2018 11:36:58 +0000
Subject: [PATCH -next] drm/vmwgfx: Remove set but not used variable 'file_priv'
Message-Id: <1538739418-151469-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Sinclair Yeh <syeh@vmware.com>, Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/vmwgfx/vmwgfx_fence.c: In function 'vmw_event_fence_action_seq_passed':
drivers/gpu/drm/vmwgfx/vmwgfx_fence.c:909:19: warning:
 variable 'file_priv' set but not used [-Wunused-but-set-variable]
  struct drm_file *file_priv;
  
It not used any more since 
commit fb740cf2492c ("drm: Create drm_send_event helpers")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
index f872615..301260e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fence.c
@@ -906,13 +906,10 @@ static void vmw_event_fence_action_seq_passed(struct vmw_fence_action *action)
 		container_of(action, struct vmw_event_fence_action, action);
 	struct drm_device *dev = eaction->dev;
 	struct drm_pending_event *event = eaction->event;
-	struct drm_file *file_priv;
-
 
 	if (unlikely(event = NULL))
 		return;
 
-	file_priv = event->file_priv;
 	spin_lock_irq(&dev->event_lock);
 
 	if (likely(eaction->tv_sec != NULL)) {
