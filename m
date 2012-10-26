From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 26 Oct 2012 06:59:09 +0000
Subject: [patch] drm: potential NULL dereference with debugging enabled
Message-Id: <20121026065908.GA9284@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We check whether this pointer is NULL a few lines later in the function
so probably we should check here too.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker fix.

diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
index d752c96..036253e 100644
--- a/drivers/gpu/drm/drm_lock.c
+++ b/drivers/gpu/drm/drm_lock.c
@@ -68,7 +68,8 @@ int drm_lock(struct drm_device *dev, void *data, struct drm_file *file_priv)
 
 	DRM_DEBUG("%d (pid %d) requests lock (0x%08x), flags = 0x%08x\n",
 		  lock->context, task_pid_nr(current),
-		  master->lock.hw_lock->lock, lock->flags);
+		  master->lock.hw_lock ? master->lock.hw_lock->lock : -1,
+		  lock->flags);
 
 	add_wait_queue(&master->lock.lock_queue, &entry);
 	spin_lock_bh(&master->lock.spinlock);
