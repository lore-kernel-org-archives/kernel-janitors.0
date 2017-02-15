From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Feb 2017 12:25:23 +0000
Subject: [patch] staging: bcm2835-camera: free first element in array
Message-Id: <20170215122523.GA12198@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Eric Anholt <eric@anholt.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-rpi-kernel@lists.infradead.org, kernel-janitors@vger.kernel.org

We should free gdev[0] so the > should be >=.

Fixes: 7b3ad5abf027 ("staging: Import the BCM2835 MMAL-based V4L2 camera driver.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/media/platform/bcm2835/bcm2835-camera.c b/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
index ca15a698e018..9bcd8e546a14 100644
--- a/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
+++ b/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
@@ -1998,7 +1998,7 @@ static int __init bm2835_mmal_init(void)
 free_dev:
 	kfree(dev);
 
-	for ( ; camera > 0; camera--) {
+	for ( ; camera >= 0; camera--) {
 		bcm2835_cleanup_instance(gdev[camera]);
 		gdev[camera] = NULL;
 	}
