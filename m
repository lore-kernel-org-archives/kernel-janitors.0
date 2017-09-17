From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 06:58:48 +0000
Subject: [PATCH 2/2] [media] si2157: Improve a size determination in two functions
Message-Id: <f49701b7-6dc2-71b8-6fe3-22efada4ea50@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87f4a386-ac11-87f5-2d22-7bfc0593de34@users.sourceforge.net>
In-Reply-To: <87f4a386-ac11-87f5-2d22-7bfc0593de34@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 17 Sep 2017 08:32:17 +0200

Replace the specification of data structures by variable references
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/tuners/si2157.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index aefa85718496..e3e2027a5027 100644
--- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -457,7 +457,7 @@ static int si2157_probe(struct i2c_client *client,
 	if (ret)
 		goto err_kfree;
 
-	memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(struct dvb_tuner_ops));
+	memcpy(&fe->ops.tuner_ops, &si2157_ops, sizeof(si2157_ops));
 	fe->tuner_priv = client;
 
 #ifdef CONFIG_MEDIA_CONTROLLER
@@ -514,7 +514,7 @@ static int si2157_remove(struct i2c_client *client)
 		media_device_unregister_entity(&dev->ent);
 #endif
 
-	memset(&fe->ops.tuner_ops, 0, sizeof(struct dvb_tuner_ops));
+	memset(&fe->ops.tuner_ops, 0, sizeof(fe->ops.tuner_ops));
 	fe->tuner_priv = NULL;
 	kfree(dev);
 
-- 
2.14.1

