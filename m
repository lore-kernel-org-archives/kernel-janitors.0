From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Apr 2016 09:34:07 +0000
Subject: [patch] regulator: lp3972: Silence uninitialized variable warning
Message-Id: <20160414093407.GE16549@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is harmless but my static checker complains that "tmp" is
uninitialized if lp3972_i2c_read() fails.  I have moved the line of code
below the error handling to silence the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/regulator/lp3972.c b/drivers/regulator/lp3972.c
index 3a7e96e..ff0c275 100644
--- a/drivers/regulator/lp3972.c
+++ b/drivers/regulator/lp3972.c
@@ -211,8 +211,8 @@ static int lp3972_set_bits(struct lp3972 *lp3972, u8 reg, u16 mask, u16 val)
 	mutex_lock(&lp3972->io_lock);
 
 	ret = lp3972_i2c_read(lp3972->i2c, reg, 1, &tmp);
-	tmp = (tmp & ~mask) | val;
 	if (ret = 0) {
+		tmp = (tmp & ~mask) | val;
 		ret = lp3972_i2c_write(lp3972->i2c, reg, 1, &tmp);
 		dev_dbg(lp3972->dev, "reg write 0x%02x -> 0x%02x\n", (int)reg,
 			(unsigned)val & 0xff);
