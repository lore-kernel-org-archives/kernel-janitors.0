From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Sep 2019 17:45:12 +0000
Subject: [PATCH] media: cxd2820r: make array tab static const, makes object smaller
Message-Id: <20190905174512.8126-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array tab on the stack but instead make it
static const. Makes the object code smaller by 53 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
   7045	   1736	      0	   8781	   224d	media/dvb-frontends/cxd2820r_c.o

After:
   text	   data	    bss	    dec	    hex	filename
   6896	   1832	      0	   8728	   2218	media/dvb-frontends/cxd2820r_c.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/cxd2820r_c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cxd2820r_c.c b/drivers/media/dvb-frontends/cxd2820r_c.c
index 6f7eedb4c00e..0ba382948c51 100644
--- a/drivers/media/dvb-frontends/cxd2820r_c.c
+++ b/drivers/media/dvb-frontends/cxd2820r_c.c
@@ -298,7 +298,7 @@ int cxd2820r_sleep_c(struct dvb_frontend *fe)
 	struct cxd2820r_priv *priv = fe->demodulator_priv;
 	struct i2c_client *client = priv->client[0];
 	int ret;
-	struct reg_val_mask tab[] = {
+	static const struct reg_val_mask tab[] = {
 		{ 0x000ff, 0x1f, 0xff },
 		{ 0x00085, 0x00, 0xff },
 		{ 0x00088, 0x01, 0xff },
-- 
2.20.1
