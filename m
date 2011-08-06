From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Aug 2011 08:00:34 +0000
Subject: [patch] [media] dib7000p: return error code on allocation failure
Message-Id: <20110806080033.GA28348@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Patrick Boettcher <patrick.boettcher@dibcom.fr>, Olivier Grenie <olivier.grenie@dibcom.fr>, Devin Heitmueller <dheitmueller@kernellabs.com>, "open list:MEDIA INPUT INFRA..." <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org

The goto needs to be moved after the assignment.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/dvb/frontends/dib7000p.c b/drivers/media/dvb/frontends/dib7000p.c
index a64a538..9c40267 100644
--- a/drivers/media/dvb/frontends/dib7000p.c
+++ b/drivers/media/dvb/frontends/dib7000p.c
@@ -1577,8 +1577,8 @@ int dib7000pc_detection(struct i2c_adapter *i2c_adap)
 		return -ENOMEM;
 	rx = kzalloc(2*sizeof(u8), GFP_KERNEL);
 	if (!rx) {
-		goto rx_memory_error;
 		ret = -ENOMEM;
+		goto rx_memory_error;
 	}
 
 	msg[0].buf = tx;
