From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 04 Sep 2017 20:08:38 +0000
Subject: [PATCH 3/6] [media] atmel-isc: Adjust three checks for null pointers
Message-Id: <fe343b19-3c18-16d0-8019-7999bf25f049@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <88d0739c-fdc1-9d7d-fe53-b7c2eeed1849@users.sourceforge.net>
In-Reply-To: <88d0739c-fdc1-9d7d-fe53-b7c2eeed1849@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-media@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Songjun Wu <songjun.wu@microchip.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 4 Sep 2017 20:54:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written !…

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/atmel/atmel-isc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/atmel/atmel-isc.c b/drivers/media/platform/atmel/atmel-isc.c
index f16bab0105c2..b6048cedb6cc 100644
--- a/drivers/media/platform/atmel/atmel-isc.c
+++ b/drivers/media/platform/atmel/atmel-isc.c
@@ -1590,7 +1590,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
 	spin_lock_init(&isc->dma_queue_lock);
 
 	sd_entity->config = v4l2_subdev_alloc_pad_config(sd_entity->sd);
-	if (sd_entity->config = NULL)
+	if (!sd_entity->config)
 		return -ENOMEM;
 
 	ret = isc_formats_init(isc);
@@ -1714,7 +1714,7 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		subdev_entity = devm_kzalloc(dev,
 					  sizeof(*subdev_entity), GFP_KERNEL);
-		if (subdev_entity = NULL) {
+		if (!subdev_entity) {
 			of_node_put(rem);
 			ret = -ENOMEM;
 			break;
@@ -1722,7 +1722,7 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		subdev_entity->asd = devm_kzalloc(dev,
 				     sizeof(*subdev_entity->asd), GFP_KERNEL);
-		if (subdev_entity->asd = NULL) {
+		if (!subdev_entity->asd) {
 			of_node_put(rem);
 			ret = -ENOMEM;
 			break;
-- 
2.14.1

