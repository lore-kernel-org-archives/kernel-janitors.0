From: Antti Palosaari <crope@iki.fi>
Date: Fri, 05 Oct 2012 21:56:00 +0000
Subject: [PATCH] cxd2820r: silence compiler warning
Message-Id: <1349474160-1976-1-git-send-email-crope@iki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org
Cc: Fengguang Wu <fengguang.wu@intel.com>, Yuanhan Liu <yuanhan.liu@intel.com>, kernel-janitors@vger.kernel.org, Antti Palosaari <crope@iki.fi>

drivers/media/dvb-frontends/cxd2820r_core.c: In function 'cxd2820r_attach':
drivers/media/dvb-frontends/cxd2820r_core.c:691:10: warning: unused variable 'gpio' [-Wunused-variable]

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Antti Palosaari <crope@iki.fi>
---
 drivers/media/dvb-frontends/cxd2820r_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cxd2820r_core.c b/drivers/media/dvb-frontends/cxd2820r_core.c
index 4264864..9b658c1 100644
--- a/drivers/media/dvb-frontends/cxd2820r_core.c
+++ b/drivers/media/dvb-frontends/cxd2820r_core.c
@@ -688,7 +688,7 @@ struct dvb_frontend *cxd2820r_attach(const struct cxd2820r_config *cfg,
 {
 	struct cxd2820r_priv *priv;
 	int ret;
-	u8 tmp, gpio[GPIO_COUNT];
+	u8 tmp;
 
 	priv = kzalloc(sizeof(struct cxd2820r_priv), GFP_KERNEL);
 	if (!priv) {
@@ -735,6 +735,7 @@ struct dvb_frontend *cxd2820r_attach(const struct cxd2820r_config *cfg,
 		 * Use static GPIO configuration if GPIOLIB is undefined.
 		 * This is fallback condition.
 		 */
+		u8 gpio[GPIO_COUNT];
 		gpio[0] = (*gpio_chip_base >> 0) & 0x07;
 		gpio[1] = (*gpio_chip_base >> 3) & 0x07;
 		gpio[2] = 0;
-- 
1.7.11.4

