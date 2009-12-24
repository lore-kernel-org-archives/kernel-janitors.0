From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Thu, 24 Dec 2009 13:21:36 +0000
Subject: drivers/gpu/drm/radeon/r100.c: check for invalid family
Message-Id: <1261660896.3546.43.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, dri-devel mailing list <dri-devel@lists.sourceforge.net>, Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

If there is an invalid family the fw_name is NULL and causes an
NULL pointer dereference.
This just adds a check for something unexpected.

Coverity CID: 13251

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
diff --git a/drivers/gpu/drm/radeon/r100.c
b/drivers/gpu/drm/radeon/r100.c
index 84e5df7..7d5de31 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -584,6 +584,8 @@ static int r100_cp_init_microcode(struct
radeon_device *rdev)
 		   (rdev->family = CHIP_RV570)) {
 		DRM_INFO("Loading R500 Microcode\n");
 		fw_name = FIRMWARE_R520;
+	} else {
+		return -EINVAL;
 	}
 
 	err = request_firmware(&rdev->me_fw, fw_name, &pdev->dev);


