From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 02 Feb 2018 18:13:19 +0000
Subject: [PATCH 2/2] i2c-bfin-twi: Improve a size determination in i2c_bfin_twi_probe()
Message-Id: <3a856fe7-5217-adcb-1da9-192a578b0422@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <740e31b4-79dd-a4bf-a2f5-001c44864b79@users.sourceforge.net>
In-Reply-To: <740e31b4-79dd-a4bf-a2f5-001c44864b79@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 2 Feb 2018 19:01:14 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/i2c/busses/i2c-bfin-twi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bfin-twi.c b/drivers/i2c/busses/i2c-bfin-twi.c
index ed596fd56b8b..f57e3247f717 100644
--- a/drivers/i2c/busses/i2c-bfin-twi.c
+++ b/drivers/i2c/busses/i2c-bfin-twi.c
@@ -619,8 +619,7 @@ static int i2c_bfin_twi_probe(struct platform_device *pdev)
 	int rc;
 	unsigned int clkhilow;
 
-	iface = devm_kzalloc(&pdev->dev, sizeof(struct bfin_twi_iface),
-			GFP_KERNEL);
+	iface = devm_kzalloc(&pdev->dev, sizeof(*iface), GFP_KERNEL);
 	if (!iface)
 		return -ENOMEM;
 
-- 
2.16.1

