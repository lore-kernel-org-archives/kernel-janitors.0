From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 08 Dec 2016 11:33:02 +0000
Subject: [PATCH 1/5] staging: comedi: serial2002: Combine four kcalloc() calls into one in serial2002_setup_s
Message-Id: <011f1cb9-481c-9d9c-bcf5-8373f1796a0a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
In-Reply-To: <8cddc37d-4529-ada4-ac21-20e09e888d0d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Chris Cesare <chris.cesare@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, Ian Abbott <abbotti@mev.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 8 Dec 2016 07:37:29 +0100

The function "kcalloc" was called in three cases by the function
"serial2002_setup_subdevs" without checking immediately if it failed.
This issue was detected by using the Coccinelle software.

* Perform the desired memory allocation (and release at the end) by a single
  function call instead.

* Adjust a jump target so that a redundant check is avoided.

Fixes: 623a73926c7012e3bb132e225621890207f5c611 ("staging: comedi: serial2002: split up serial_2002_open()")

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/comedi/drivers/serial2002.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/comedi/drivers/serial2002.c b/drivers/staging/comedi/drivers/serial2002.c
index 0d33e520f635..9542f4f8afe0 100644
--- a/drivers/staging/comedi/drivers/serial2002.c
+++ b/drivers/staging/comedi/drivers/serial2002.c
@@ -392,6 +392,7 @@ static int serial2002_setup_subdevice(struct comedi_subdevice *s,
 static int serial2002_setup_subdevs(struct comedi_device *dev)
 {
 	struct serial2002_private *devpriv = dev->private;
+	struct config_t *array;
 	struct config_t *di_cfg;
 	struct config_t *do_cfg;
 	struct config_t *ai_cfg;
@@ -402,15 +403,17 @@ static int serial2002_setup_subdevs(struct comedi_device *dev)
 	int i;
 
 	/* Allocate the temporary structs to hold the configuration data */
-	di_cfg = kcalloc(32, sizeof(*cfg), GFP_KERNEL);
-	do_cfg = kcalloc(32, sizeof(*cfg), GFP_KERNEL);
-	ai_cfg = kcalloc(32, sizeof(*cfg), GFP_KERNEL);
-	ao_cfg = kcalloc(32, sizeof(*cfg), GFP_KERNEL);
-	if (!di_cfg || !do_cfg || !ai_cfg || !ao_cfg) {
+	array = kcalloc(4 * 32, sizeof(*cfg), GFP_KERNEL);
+	if (!array) {
 		result = -ENOMEM;
-		goto err_alloc_configs;
+		goto check_tty;
 	}
 
+	di_cfg = array;
+	do_cfg = array + 1 * 32;
+	ai_cfg = array + 2 * 32;
+	ao_cfg = array + 3 * 32;
+
 	/* Read the configuration from the connected device */
 	serial2002_tty_setspeed(devpriv->tty, devpriv->speed);
 	serial2002_poll_channel(devpriv->tty, 31);
@@ -534,13 +537,10 @@ static int serial2002_setup_subdevs(struct comedi_device *dev)
 		}
 	}
 
-err_alloc_configs:
-	kfree(di_cfg);
-	kfree(do_cfg);
-	kfree(ai_cfg);
-	kfree(ao_cfg);
+	kfree(array);
 
 	if (result) {
+check_tty:
 		if (devpriv->tty) {
 			filp_close(devpriv->tty, NULL);
 			devpriv->tty = NULL;
-- 
2.11.0

