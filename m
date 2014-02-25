From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Tue, 25 Feb 2014 23:04:45 +0000
Subject: [PATCH] staging: comedi: drivers: fix for a potential NULL pointer dereference
Message-Id: <1393369485-10801-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: abbotti@mev.co.uk
Cc: hsweeten@visionengravers.com, gregkh@linuxfoundation.org, chase.southwood@yahoo.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Return -ENOMEM in ni_E_init if ni_gpct_device_construct returns NULL

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 drivers/staging/comedi/drivers/ni_mio_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/comedi/drivers/ni_mio_common.c b/drivers/staging/comedi/drivers/ni_mio_common.c
index 8adb535..3a86d48 100644
--- a/drivers/staging/comedi/drivers/ni_mio_common.c
+++ b/drivers/staging/comedi/drivers/ni_mio_common.c
@@ -4407,6 +4407,9 @@ static int ni_E_init(struct comedi_device *dev)
 							&ni_gpct_read_register,
 							counter_variant,
 							NUM_GPCT);
+	if (!devpriv->counter_dev)
+		return -ENOMEM;
+
 	/* General purpose counters */
 	for (j = 0; j < NUM_GPCT; ++j) {
 		s = &dev->subdevices[NI_GPCT_SUBDEV(j)];
-- 
1.8.5.3

