From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 12:00:34 +0000
Subject: [patch] [media] tda10071: remove a duplicative test
Message-Id: <20140130120034.GA13267@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti Palosaari <crope@iki.fi>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

"ret" is an error code here, we already tested that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb-frontends/tda10071.c b/drivers/media/dvb-frontends/tda10071.c
index 8ad3a57cf640..a76df29c4973 100644
--- a/drivers/media/dvb-frontends/tda10071.c
+++ b/drivers/media/dvb-frontends/tda10071.c
@@ -1006,8 +1006,7 @@ static int tda10071_init(struct dvb_frontend *fe)
 				dev_err(&priv->i2c->dev, "%s: firmware " \
 						"download failed=%d\n",
 						KBUILD_MODNAME, ret);
-				if (ret)
-					goto error_release_firmware;
+				goto error_release_firmware;
 			}
 		}
 		release_firmware(fw);
