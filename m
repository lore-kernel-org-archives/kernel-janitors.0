From: Colin King <colin.king@canonical.com>
Date: Sat, 11 May 2019 13:48:13 +0000
Subject: [PATCH] staging: vc04_services: bcm2835-camera: remove redundant assignment to variable ret
Message-Id: <20190511134813.5645-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized however this is never read and later
it is being reassigned to a new value. The initialization is redundant and
hence can be removed.

Addresses-Coverity: ("Unused Value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/vc04_services/bcm2835-camera/controls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
index 9841c30450ce..74410fedffad 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -579,7 +579,7 @@ static int ctrl_set_colfx(struct bm2835_mmal_dev *dev,
 			  struct v4l2_ctrl *ctrl,
 			  const struct bm2835_mmal_v4l2_ctrl *mmal_ctrl)
 {
-	int ret = -EINVAL;
+	int ret;
 	struct vchiq_mmal_port *control;
 
 	control = &dev->component[MMAL_COMPONENT_CAMERA]->control;
-- 
2.20.1
