From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Wed, 30 Dec 2009 01:23:55 +0000
Subject: [PATCH] drm/radeon/radeon_cp.c: check for invalid radeon family
Message-Id: <1262136235.8733.33.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

If there is an invalid radeon family the fw_name is NULL and causes an
NULL pointer dereference.
This just adds a check for something unexpected.

Coverity CID: 13252


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

diff --git drivers/gpu/drm/radeon/radeon_cp.c drivers/gpu/drm/radeon/radeon_cp.c
index 0b2f9c2..1e66337 100644
--- drivers/gpu/drm/radeon/radeon_cp.c
+++ drivers/gpu/drm/radeon/radeon_cp.c
@@ -531,6 +531,8 @@ static int radeon_cp_init_microcode(drm_radeon_private_t *dev_priv)
 		   ((dev_priv->flags & RADEON_FAMILY_MASK) = CHIP_RV570)) {
 		DRM_INFO("Loading R500 Microcode\n");
 		fw_name = FIRMWARE_R520;
+	} else {
+		return -EINVAL;
 	}
 
 	err = request_firmware(&dev_priv->me_fw, fw_name, &pdev->dev);


