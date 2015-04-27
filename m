From: green@linuxhacker.ru
Date: Mon, 27 Apr 2015 15:36:46 +0000
Subject: [PATCH v2] drm: fix a memleak on mutex failure path
Message-Id: <1430149006-3753-1-git-send-email-green@linuxhacker.ru>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, Oleg Drokin <green@linuxhacker.ru>, Daniel Vetter <daniel.vetter@ffwll.ch>

From: Oleg Drokin <green@linuxhacker.ru>

Need to free just allocated ctx allocation if we cannot
get our config mutex.

This one has been flagged by kbuild bot all the way back in August,
but somehow nobody picked it up:
https://lists.01.org/pipermail/kbuild/2014-August/001691.html

In addition there is another failure path that leaks the same
ctx reference that is fixed.

Found with smatch.

Signed-off-by: Oleg Drokin <green@linuxhacker.ru>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_modeset_lock.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/drm_modeset_lock.c
index 51cc47d..c0a5cd8 100644
--- a/drivers/gpu/drm/drm_modeset_lock.c
+++ b/drivers/gpu/drm/drm_modeset_lock.c
@@ -80,8 +80,10 @@ int __drm_modeset_lock_all(struct drm_device *dev,
 		return -ENOMEM;
 
 	if (trylock) {
-		if (!mutex_trylock(&config->mutex))
-			return -EBUSY;
+		if (!mutex_trylock(&config->mutex)) {
+			ret = -EBUSY;
+			goto out;
+		}
 	} else {
 		mutex_lock(&config->mutex);
 	}
@@ -114,6 +116,8 @@ fail:
 		goto retry;
 	}
 
+out:
+	kfree(ctx);
 	return ret;
 }
 EXPORT_SYMBOL(__drm_modeset_lock_all);
-- 
2.1.0

