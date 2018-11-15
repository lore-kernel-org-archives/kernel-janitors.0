From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 15 Nov 2018 12:14:02 +0000
Subject: [PATCH -next] drm/nouveau: fix copy-paste error in nouveau_fence_wait_uevent_handler
Message-Id: <1542284042-153903-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/nouveau/nouveau_fence.c: In function 'nouveau_fence_wait_uevent_handler':
drivers/gpu/drm/nouveau/nouveau_fence.c:156:27: warning:
 variable 'chan' set but not used [-Wunused-but-set-variable]

nouveau_fence_update should use rcu protected 'chan'
rather than 'fence->channel'

Fixes: 0ec5f02f0e2c ("drm/nouveau: prevent stale fence->channel pointers, and protect with rcu")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index d4964f3..91286d0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -157,7 +157,7 @@
 
 		fence = list_entry(fctx->pending.next, typeof(*fence), head);
 		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
-		if (nouveau_fence_update(fence->channel, fctx))
+		if (nouveau_fence_update(chan, fctx))
 			ret = NVIF_NOTIFY_DROP;
 	}
 	spin_unlock_irqrestore(&fctx->lock, flags);
