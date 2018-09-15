From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 15 Sep 2018 01:53:19 +0000
Subject: [PATCH -next] drm/vkms: Fix possible memory leak in _vkms_get_crc()
Message-Id: <1536976399-1295-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>, Sean Paul <seanpaul@chromium.org>, Mahesh Kumar <mahesh1.kumar@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

'vaddr_out' is malloced in _vkms_get_crc() and should be freed before
leaving from the error handling cases, otherwise it will cause memory
leak.

Fixes: db7f419c06d7 ("drm/vkms: Compute CRC with Cursor Plane")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/vkms/vkms_crc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vkms/vkms_crc.c b/drivers/gpu/drm/vkms/vkms_crc.c
index 0a27456..9d9e814 100644
--- a/drivers/gpu/drm/vkms/vkms_crc.c
+++ b/drivers/gpu/drm/vkms/vkms_crc.c
@@ -125,6 +125,7 @@ static uint32_t _vkms_get_crc(struct vkms_crc_data *primary_crc,
 	mutex_lock(&vkms_obj->pages_lock);
 	if (WARN_ON(!vkms_obj->vaddr)) {
 		mutex_unlock(&vkms_obj->pages_lock);
+		kfree(vaddr_out);
 		return crc;
 	}
