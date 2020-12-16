From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Dec 2020 08:32:52 +0000
Subject: [PATCH] Input: da7280 - delete a stray tab
Message-Id: <X9nGNJjFi9AaBBwX@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Support Opensource <support.opensource@diasemi.com>, Roy Im <roy.im.opensource@diasemi.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

This line is indented one tab too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/input/misc/da7280.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/da7280.c b/drivers/input/misc/da7280.c
index 37568b00873d..fe06693579ca 100644
--- a/drivers/input/misc/da7280.c
+++ b/drivers/input/misc/da7280.c
@@ -863,7 +863,7 @@ static void da7280_parse_properties(struct device *dev,
 		gpi_str3[7] = '0' + i;
 		haptics->gpi_ctl[i].polarity = 0;
 		error = device_property_read_string(dev, gpi_str3, &str);
-			haptics->gpi_ctl[i].polarity +		haptics->gpi_ctl[i].polarity  				da7280_haptic_of_gpi_pol_str(dev, str);
 	}
 
-- 
2.29.2
