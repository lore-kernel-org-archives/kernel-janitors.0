From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 11 Jan 2020 07:42:06 +0000
Subject: [PATCH -next v2] drm/mgag200: Fix typo in module parameter description
Message-Id: <20200111074206.68290-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110012523.33053-1-weiyongjun1@huawei.com>
In-Reply-To: <20200110012523.33053-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Kate Stewart <kstewart@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

There was a typo in the MODULE_PARM_DESC(). It said that the
module parameter was "modeset" but it's actually the description
for "hw_bug_no_startadd".

Fixes: 3cacb2086e41 ("drm/mgag200: Add module parameter to pin all buffers at offset 0")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 -> v2: Fix the description
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 7a5bad2f57d7..2236f8ef20a4 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -28,7 +28,7 @@ MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
 int mgag200_hw_bug_no_startadd = -1;
-MODULE_PARM_DESC(modeset, "HW does not interpret scanout-buffer start address correctly");
+MODULE_PARM_DESC(hw_bug_no_startadd, "HW does not interpret scanout-buffer start address correctly");
 module_param_named(hw_bug_no_startadd, mgag200_hw_bug_no_startadd, int, 0400);
 
 static struct drm_driver driver;
