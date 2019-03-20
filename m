From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 20 Mar 2019 01:54:29 +0000
Subject: [PATCH -next] drm/vboxvideo: Remove unused including <linux/version.h>
Message-Id: <20190320015429.86347-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/vboxvideo/vbox_drv.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_drv.h b/drivers/gpu/drm/vboxvideo/vbox_drv.h
index 6dea8bf5f045..ece31f395540 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_drv.h
+++ b/drivers/gpu/drm/vboxvideo/vbox_drv.h
@@ -14,7 +14,6 @@
 #include <linux/io.h>
 #include <linux/irqreturn.h>
 #include <linux/string.h>
-#include <linux/version.h>
 
 #include <drm/drm_encoder.h>
 #include <drm/drm_fb_helper.h>
