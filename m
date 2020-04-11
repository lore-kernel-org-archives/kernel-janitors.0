From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 11 Apr 2020 14:27:29 +0000
Subject: [PATCH] media: m88ds3103: Add missing '\n' in log messages
Message-Id: <20200411142729.28699-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: crope@iki.fi, mchehab@kernel.org, sean@mess.org, brad@nextdimension.cc
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

While at it, change the log level from 'err' to 'debug'.

Fixes: e6089feca460 ("media: m88ds3103: Add support for ds3103b demod")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/dvb-frontends/m88ds3103.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/m88ds3103.c b/drivers/media/dvb-frontends/m88ds3103.c
index d2c28dcf6b42..bc356ac4fe5e 100644
--- a/drivers/media/dvb-frontends/m88ds3103.c
+++ b/drivers/media/dvb-frontends/m88ds3103.c
@@ -1898,7 +1898,7 @@ static int m88ds3103_probe(struct i2c_client *client,
 		if (ret)
 			goto err_kfree;
 		dev->dt_addr = ((utmp & 0x80) = 0) ? 0x42 >> 1 : 0x40 >> 1;
-		dev_err(&client->dev, "dt addr is 0x%02x", dev->dt_addr);
+		dev_dbg(&client->dev, "dt addr is 0x%02x\n", dev->dt_addr);
 
 		dev->dt_client = i2c_new_dummy_device(client->adapter,
 						      dev->dt_addr);
-- 
2.20.1
