From: Colin King <colin.king@canonical.com>
Date: Fri, 26 Oct 2018 18:05:12 +0000
Subject: [PATCH] gpu: drm/lease: fix spelling mistake, EACCESS -> EACCES
Message-Id: <20181026180512.4908-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to a spelling mistake of the error access name EACCESS,
rename to EACCES

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/drm_lease.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
index 24a177ea5417..9ab88db8fad0 100644
--- a/drivers/gpu/drm/drm_lease.c
+++ b/drivers/gpu/drm/drm_lease.c
@@ -195,7 +195,7 @@ EXPORT_SYMBOL(drm_lease_filter_crtcs);
  * make sure all of the desired objects can be leased, atomically
  * leasing them to the new drmmaster.
  *
- * 	ERR_PTR(-EACCESS)	some other master holds the title to any object
+ * 	ERR_PTR(-EACCES)	some other master holds the title to any object
  * 	ERR_PTR(-ENOENT)	some object is not a valid DRM object for this device
  * 	ERR_PTR(-EBUSY)		some other lessee holds title to this object
  *	ERR_PTR(-EEXIST)	same object specified more than once in the provided list
-- 
2.19.1
