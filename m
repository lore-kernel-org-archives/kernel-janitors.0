From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 10:15:53 +0000
Subject: [PATCH] hwmon: (pmbus/max31785) Remove a useless #define
Message-Id: <20190721101553.20911-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux@roeck-us.net, jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

There is a typo in MAX37185_NUM_FAN_PAGES. To be consistent, it should be
MAX31785_NUM_FAN_PAGES (1 and 7 switched).

At line 24, we already have:
   #define MAX31785_NR_FAN_PAGES		6
and MAX37185_NUM_FAN_PAGES seems to be unused.

It is likely that it is only a typo and/or a left-over.
So, axe it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/hwmon/pmbus/max31785.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 69d9029ea410..254b0f98c755 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -244,8 +244,6 @@ static int max31785_write_word_data(struct i2c_client *client, int page,
 #define MAX31785_VOUT_FUNCS \
 	(PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT)
 
-#define MAX37185_NUM_FAN_PAGES 6
-
 static const struct pmbus_driver_info max31785_info = {
 	.pages = MAX31785_NR_PAGES,
 
-- 
2.20.1
