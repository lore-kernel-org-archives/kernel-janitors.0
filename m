From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 24 Feb 2017 18:09:42 +0000
Subject: [PATCH v2] staging: bcm2835-camera: Fix a memory leak in error handling path in 'bm2835_mmal_init()'
Message-Id: <20170224180942.17048-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170217232015.GA26717@mwanda>
In-Reply-To: <20170217232015.GA26717@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

If 'kzalloc()' fails, we should release resources allocated so far, just as
done in all other cases in this function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure that the error handling path is correct.
Is 'gdev[0]' freed? Should it be?


v2: Rename patch to include '-camera' in the subject
---
 drivers/staging/media/platform/bcm2835/bcm2835-camera.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/platform/bcm2835/bcm2835-camera.c b/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
index ca15a698e018..9651b9bc3439 100644
--- a/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
+++ b/drivers/staging/media/platform/bcm2835/bcm2835-camera.c
@@ -1914,8 +1914,10 @@ static int __init bm2835_mmal_init(void)
 
 	for (camera = 0; camera < num_cameras; camera++) {
 		dev = kzalloc(sizeof(struct bm2835_mmal_dev), GFP_KERNEL);
-		if (!dev)
-			return -ENOMEM;
+		if (!dev) {
+			ret = -ENOMEM;
+			goto free_dev;
+		}
 
 		dev->camera_num = camera;
 		dev->max_width = resolutions[camera][0];
-- 
2.9.3

