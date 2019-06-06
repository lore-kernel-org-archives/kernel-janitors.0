From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Jun 2019 12:38:56 +0000
Subject: [PATCH] hwmon: nct7904: fix comparison of u8 variable ret with less than zero
Message-Id: <20190606123856.18531-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "amy . shih" <amy.shih@advantech.com.tw>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently u8 variable tmp is being checked for negative error returns
however this will be false since tmp is unsigned. Fix this by making
tmp an int.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: af55ab0b0792 ("hwmon: (nct7904) Add extra sysfs support for fan, voltage and temperature.")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/nct7904.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
index 5fa69898674c..b63f51d0378e 100644
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@ -567,8 +567,7 @@ static int nct7904_write_in(struct device *dev, u32 attr, int channel,
 			    long val)
 {
 	struct nct7904_data *data = dev_get_drvdata(dev);
-	int ret, index;
-	u8 tmp;
+	int ret, index, tmp;
 
 	index = nct7904_chan_to_index[channel];
 
-- 
2.20.1
