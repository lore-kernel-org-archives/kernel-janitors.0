From: Dan Carpenter <error27@gmail.com>
Date: Tue, 25 May 2010 09:52:27 +0000
Subject: [patch] drm/nouveau: off by one in init_i2c_device_find()
Message-Id: <20100525095227.GH22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

dcb->i2c[] has DCB_MAX_NUM_I2C_ENTRIES entries.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index e7e69cc..bf92a1e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -814,7 +814,7 @@ init_i2c_device_find(struct drm_device *dev, int i2c_index)
 	if (i2c_index = 0x81)
 		i2c_index = (dcb->i2c_default_indices & 0xf0) >> 4;
 
-	if (i2c_index > DCB_MAX_NUM_I2C_ENTRIES) {
+	if (i2c_index >= DCB_MAX_NUM_I2C_ENTRIES) {
 		NV_ERROR(dev, "invalid i2c_index 0x%x\n", i2c_index);
 		return NULL;
 	}
