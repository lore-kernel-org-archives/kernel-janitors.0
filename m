From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Sep 2019 17:57:26 +0000
Subject: [PATCH][V2] media: cxd2820r: make arrays tab static const, makes object smaller
Message-Id: <20190905175726.11805-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti Palosaari <crope@iki.fi>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array tab on the stack but instead make it
static const. Makes the object size smaller by 170 bytes in total.

Before:
   text    data     bss     dec     hex filename
   7045    1736       0    8781    224d media/dvb-frontends/cxd2820r_c.o
   8800	   2216	      0	  11016	   2b08	media/dvb-frontends/cxd2820r_t.o
   8981	   2120	      0	  11101	   2b5d	media/dvb-frontends/cxd2820r_t2.o

After:
   text    data     bss     dec     hex filename
   6896    1832       0    8728    2218 media/dvb-frontends/cxd2820r_c.o
   8651	   2312	      0	  10963	   2ad3	media/dvb-frontends/cxd2820r_t.o
   8853	   2184	      0	  11037	   2b1d	media/dvb-frontends/cxd2820r_t2.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: also make same change to cxd2820r_t.c and cxd2820r_t2.c

---
 drivers/media/dvb-frontends/cxd2820r_c.c  | 2 +-
 drivers/media/dvb-frontends/cxd2820r_t.c  | 2 +-
 drivers/media/dvb-frontends/cxd2820r_t2.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
diff --git a/drivers/media/dvb-frontends/cxd2820r_t.c b/drivers/media/dvb-frontends/cxd2820r_t.c
index d56c6f788196..fbdfa6bf38dc 100644
--- a/drivers/media/dvb-frontends/cxd2820r_t.c
+++ b/drivers/media/dvb-frontends/cxd2820r_t.c
@@ -392,7 +392,7 @@ int cxd2820r_sleep_t(struct dvb_frontend *fe)
 	struct cxd2820r_priv *priv = fe->demodulator_priv;
 	struct i2c_client *client = priv->client[0];
 	int ret;
-	struct reg_val_mask tab[] = {
+	static struct reg_val_mask tab[] = {
 		{ 0x000ff, 0x1f, 0xff },
 		{ 0x00085, 0x00, 0xff },
 		{ 0x00088, 0x01, 0xff },
diff --git a/drivers/media/dvb-frontends/cxd2820r_t2.c b/drivers/media/dvb-frontends/cxd2820r_t2.c
index f924a80b968a..34ef2bb2de34 100644
--- a/drivers/media/dvb-frontends/cxd2820r_t2.c
+++ b/drivers/media/dvb-frontends/cxd2820r_t2.c
@@ -386,7 +386,7 @@ int cxd2820r_sleep_t2(struct dvb_frontend *fe)
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
