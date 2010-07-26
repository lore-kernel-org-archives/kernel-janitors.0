From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon, 26 Jul 2010 08:23:54 +0000
Subject: [PATCH] drm: nouveau: set TASK_(UN)INTERRUPTIBLE before schedule_timeout()
Message-Id: <1280132635-7961-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, Francisco Jerez <currojerez@riseup.net>, Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

set_current_state() is called only once before the first iteration.
After return from schedule_timeout() current state is TASK_RUNNING. If
we are going to wait again, set_current_state() must be called.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 813d853..b7777ae 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -186,7 +186,6 @@ nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
 	unsigned long timeout = jiffies + (3 * DRM_HZ);
 	int ret = 0;
 
-	__set_current_state(intr ? TASK_INTERRUPTIBLE : TASK_UNINTERRUPTIBLE);
 
 	while (1) {
 		if (nouveau_fence_signalled(sync_obj, sync_arg))
@@ -197,6 +196,8 @@ nouveau_fence_wait(void *sync_obj, void *sync_arg, bool lazy, bool intr)
 			break;
 		}
 
+		__set_current_state(intr ? TASK_INTERRUPTIBLE
+			: TASK_UNINTERRUPTIBLE);
 		if (lazy)
 			schedule_timeout(1);
 
-- 
1.7.0.4

