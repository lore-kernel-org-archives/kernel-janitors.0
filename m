From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 24 Jun 2019 05:33:51 +0000
Subject: [PATCH] staging: bcm2835-camera: Avoid apotential sleep while holding a spin_lock
Message-Id: <20190624053351.5217-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eric@anholt.net, stefan.wahren@i2se.com, gregkh@linuxfoundation.org, f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, tuomas.tynkkynen@iki.fi, inf.braun@fau.de, tobias.buettner@fau.de, hofrat@osadl.org
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org

Do not allocate memory with GFP_KERNEL when holding a spin_lock, it may
sleep. Use GFP_NOWAIT instead.

Fixes: 950fd867c635 ("staging: bcm2835-camera: Replace open-coded idr with a struct idr.")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
index 16af735af5c3..438d548c6e24 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
@@ -186,7 +186,7 @@ get_msg_context(struct vchiq_mmal_instance *instance)
 	 */
 	spin_lock(&instance->context_map_lock);
 	handle = idr_alloc(&instance->context_map, msg_context,
-			   0, 0, GFP_KERNEL);
+			   0, 0, GFP_NOWAIT);
 	spin_unlock(&instance->context_map_lock);
 
 	if (handle < 0) {
-- 
2.20.1
