From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Feb 2018 07:25:28 +0000
Subject: [PATCH 2/2] regmap-i2c: Off by one in regmap_i2c_smbus_i2c_read/write()
Message-Id: <20180208072528.GB18158@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20180208072344.GA18158@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The commit message says that we are allowed to read and write up to 32
bytes but the code only allows us to write 31 bytes.  In other words,
the ">=" should be changed to ">".  But this is already checked in
regmap_raw_read()/write() so we can just remove the if statemetents.

Fixes: 29332534e2b6 ("regmap-i2c: Add smbus i2c block support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

diff --git a/drivers/base/regmap/regmap-i2c.c b/drivers/base/regmap/regmap-i2c.c
index 4735318f4268..056acde5e7d3 100644
--- a/drivers/base/regmap/regmap-i2c.c
+++ b/drivers/base/regmap/regmap-i2c.c
@@ -217,8 +217,6 @@ static int regmap_i2c_smbus_i2c_write(void *context, const void *data,
 
 	if (count < 1)
 		return -EINVAL;
-	if (count >= I2C_SMBUS_BLOCK_MAX)
-		return -E2BIG;
 
 	--count;
 	return i2c_smbus_write_i2c_block_data(i2c, ((u8 *)data)[0], count,
@@ -235,8 +233,6 @@ static int regmap_i2c_smbus_i2c_read(void *context, const void *reg,
 
 	if (reg_size != 1 || val_size < 1)
 		return -EINVAL;
-	if (val_size >= I2C_SMBUS_BLOCK_MAX)
-		return -E2BIG;
 
 	ret = i2c_smbus_read_i2c_block_data(i2c, ((u8 *)reg)[0], val_size, val);
 	if (ret = val_size)
