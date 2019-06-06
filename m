From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Jun 2019 12:27:07 +0000
Subject: [PATCH] hwmon: nct7904: fix error check on register read
Message-Id: <20190606122707.16107-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "amy . shih" <amy.shih@advantech.com.tw>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the return from the call to nct7904_read is being masked
and so and negative error returns are being stripped off and the
error check is always false.  Fix this by checking on err first and
then masking the return value in ret.

Addresses-Coverity: ("Logically dead code")
Fixes: af55ab0b0792 ("hwmon: (nct7904) Add extra sysfs support for fan, voltage and temperature.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/nct7904.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
index dd450dd29ac7..5fa69898674c 100644
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@ -928,10 +928,10 @@ static int nct7904_probe(struct i2c_client *client,
 
 	/* Check DTS enable status */
 	if (data->enable_dts) {
-		ret = nct7904_read_reg(data, BANK_0, DTS_T_CTRL0_REG) & 0xF;
+		ret = nct7904_read_reg(data, BANK_0, DTS_T_CTRL0_REG);
 		if (ret < 0)
 			return ret;
-		data->has_dts = ret;
+		data->has_dts = ret & 0xF;
 		if (data->enable_dts & ENABLE_TSI) {
 			ret = nct7904_read_reg(data, BANK_0, DTS_T_CTRL1_REG);
 			if (ret < 0)
-- 
2.20.1
