From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Sep 2013 11:20:18 +0000
Subject: [patch] drm/i915: cleanup a min_t() cast
Message-Id: <20130920112018.GA8655@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The lower layers of sysfs will not allow an "offset" of more than
GEN7_L3LOG_SIZE and also l3_access_valid() caps it a second time.  But
it's a little easier to audit if we don't have to worry that the
subtraction will result in negative values.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index d572435..b3f62b4 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -127,7 +127,7 @@ i915_l3_read(struct file *filp, struct kobject *kobj,
 	if (ret)
 		return ret;
 
-	count = min_t(int, GEN7_L3LOG_SIZE-offset, count);
+	count = min_t(size_t, GEN7_L3LOG_SIZE - offset, count);
 
 	ret = i915_mutex_lock_interruptible(drm_dev);
 	if (ret)
