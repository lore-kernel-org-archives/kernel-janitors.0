From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 30 Apr 2020 07:05:23 +0000
Subject: [PATCH -next] drm/vboxvideo: Fix a NULL vs IS_ERR() check in vbox_hw_init()
Message-Id: <20200430070523.185584-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

The devm_gen_pool_create() function returns ERR_PTR() on error, it
doesn't return NULL so this check doesn't work.

Fixes: 4cc9b565454b ("drm/vboxvideo: Use devm_gen_pool_create")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/vboxvideo/vbox_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index d68d9bad7674..c5ea880d17b2 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -123,8 +123,8 @@ int vbox_hw_init(struct vbox_private *vbox)
 	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
 	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
 						"vboxvideo-accel");
-	if (!vbox->guest_pool)
-		return -ENOMEM;
+	if (IS_ERR(vbox->guest_pool))
+		return PTR_ERR(vbox->guest_pool);
 
 	ret = gen_pool_add_virt(vbox->guest_pool,
 				(unsigned long)vbox->guest_heap,
