From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Jan 2012 06:23:28 +0000
Subject: [patch] [media] af9013: change & to &&
Message-Id: <20120105062328.GA25744@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Antti Palosaari <crope@iki.fi>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This is just a cleanup, it doesn't change how the code works.  These
are compound conditions and not bitwise operations so it should be &&
and not &.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb/frontends/af9013.c b/drivers/media/dvb/frontends/af9013.c
index e6ba3e0..1413c51 100644
--- a/drivers/media/dvb/frontends/af9013.c
+++ b/drivers/media/dvb/frontends/af9013.c
@@ -120,8 +120,8 @@ static int af9013_wr_regs(struct af9013_state *priv, u16 reg, const u8 *val,
 	int ret, i;
 	u8 mbox = (0 << 7)|(0 << 6)|(1 << 1)|(1 << 0);
 
-	if ((priv->config.ts_mode = AF9013_TS_USB) &
-		((reg & 0xff00) != 0xff00) & ((reg & 0xff00) != 0xae00)) {
+	if ((priv->config.ts_mode = AF9013_TS_USB) &&
+		((reg & 0xff00) != 0xff00) && ((reg & 0xff00) != 0xae00)) {
 		mbox |= ((len - 1) << 2);
 		ret = af9013_wr_regs_i2c(priv, mbox, reg, val, len);
 	} else {
@@ -142,8 +142,8 @@ static int af9013_rd_regs(struct af9013_state *priv, u16 reg, u8 *val, int len)
 	int ret, i;
 	u8 mbox = (0 << 7)|(0 << 6)|(1 << 1)|(0 << 0);
 
-	if ((priv->config.ts_mode = AF9013_TS_USB) &
-		((reg & 0xff00) != 0xff00) & ((reg & 0xff00) != 0xae00)) {
+	if ((priv->config.ts_mode = AF9013_TS_USB) &&
+		((reg & 0xff00) != 0xff00) && ((reg & 0xff00) != 0xae00)) {
 		mbox |= ((len - 1) << 2);
 		ret = af9013_rd_regs_i2c(priv, mbox, reg, val, len);
 	} else {
