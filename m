From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Jun 2015 10:20:00 +0000
Subject: [patch] [media] m88ds3103: a couple missing error codes
Message-Id: <20150602102000.GD11247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti Palosaari <crope@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to set some error codes here.

Fixes: f01919e8f54f ('[media] m88ds3103: add I2C client binding')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index 01b9ded..7b21f1a 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1563,6 +1563,7 @@ static int m88ds3103_probe(struct i2c_client *client,
 		u8tmp = 0x10;
 		break;
 	default:
+		ret = -EINVAL;
 		goto err_kfree;
 	}
 
@@ -1590,8 +1591,10 @@ static int m88ds3103_probe(struct i2c_client *client,
 	dev->i2c_adapter = i2c_add_mux_adapter(client->adapter, &client->dev,
 					       dev, 0, 0, 0, m88ds3103_select,
 					       m88ds3103_deselect);
-	if (dev->i2c_adapter = NULL)
+	if (dev->i2c_adapter = NULL) {
+		ret = -ENOMEM;
 		goto err_kfree;
+	}
 
 	/* create dvb_frontend */
 	memcpy(&dev->fe.ops, &m88ds3103_ops, sizeof(struct dvb_frontend_ops));
