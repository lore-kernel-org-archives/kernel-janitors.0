From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 27 Feb 2016 10:46:16 +0000
Subject: [patch] [media] saa7134: Fix analog TV demod detection.
Message-Id: <20160227104616.GB14086@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Geunyoung Kim <nenggun.kim@samsung.com>, Hans Verkuil <hansverk@cisco.com>, Junghak Sung <jh1009.sung@samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a missing curly brace so we only look at the first item in the
list and then exit.

Fixes: ac90aa02d5b9 ('[media] saa7134: add media controller support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/pci/saa7134/saa7134-core.c b/drivers/media/pci/saa7134/saa7134-core.c
index 42bc417..8f3ba40 100644
--- a/drivers/media/pci/saa7134/saa7134-core.c
+++ b/drivers/media/pci/saa7134/saa7134-core.c
@@ -838,9 +838,10 @@ static void saa7134_create_entities(struct saa7134_dev *dev)
 
 	/* Check if it is using an external analog TV demod */
 	media_device_for_each_entity(entity, dev->media_dev) {
-		if (entity->function = MEDIA_ENT_F_ATV_DECODER)
+		if (entity->function = MEDIA_ENT_F_ATV_DECODER) {
 			decoder = entity;
 			break;
+		}
 	}
 
 	/*
