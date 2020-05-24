From: Colin King <colin.king@canonical.com>
Date: Sun, 24 May 2020 22:27:15 +0000
Subject: [PATCH][next] drm/auth: remove redundant assignment to variable ret
Message-Id: <20200524222715.27305-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/drm_auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 800ac39f3213..74ce0c29c960 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -282,7 +282,7 @@ static void drm_drop_master(struct drm_device *dev,
 int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
 			 struct drm_file *file_priv)
 {
-	int ret = -EINVAL;
+	int ret;
 
 	mutex_lock(&dev->master_mutex);
 
-- 
2.25.1
