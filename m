From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Apr 2016 09:34:41 +0000
Subject: [patch] regulator: lp3971: Silence uninitialized variable warning
Message-Id: <20160414093441.GF16549@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is harmless but if lp3971_i2c_read() fails then "tmp" can be
uninitialized.  Silence the warning by moving the error handling up a
line.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/lp3971.c b/drivers/regulator/lp3971.c
index 15c25c6..204b5c5 100644
--- a/drivers/regulator/lp3971.c
+++ b/drivers/regulator/lp3971.c
@@ -365,8 +365,8 @@ static int lp3971_set_bits(struct lp3971 *lp3971, u8 reg, u16 mask, u16 val)
 	mutex_lock(&lp3971->io_lock);
 
 	ret = lp3971_i2c_read(lp3971->i2c, reg, 1, &tmp);
-	tmp = (tmp & ~mask) | val;
 	if (ret = 0) {
+		tmp = (tmp & ~mask) | val;
 		ret = lp3971_i2c_write(lp3971->i2c, reg, 1, &tmp);
 		dev_dbg(lp3971->dev, "reg write 0x%02x -> 0x%02x\n", (int)reg,
 			(unsigned)val&0xff);
