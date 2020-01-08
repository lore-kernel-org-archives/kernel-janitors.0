From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Jan 2020 05:43:12 +0000
Subject: [PATCH] gpu/drm: clean up white space in drm_legacy_lock_master_cleanup()
Message-Id: <20200108054312.yzlj5wmbdktejgob@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We moved this code to a different file and accidentally deleted a
newline.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/drm_lock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
index 2e8ce99d0baa..2c79e8199e3c 100644
--- a/drivers/gpu/drm/drm_lock.c
+++ b/drivers/gpu/drm/drm_lock.c
@@ -360,7 +360,8 @@ void drm_legacy_lock_master_cleanup(struct drm_device *dev, struct drm_master *m
 	/*
 	 * Since the master is disappearing, so is the
 	 * possibility to lock.
-	 */	mutex_lock(&dev->struct_mutex);
+	 */
+	mutex_lock(&dev->struct_mutex);
 	if (master->lock.hw_lock) {
 		if (dev->sigdata.lock = master->lock.hw_lock)
 			dev->sigdata.lock = NULL;
-- 
2.11.0
