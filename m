From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Sep 2020 14:34:05 +0000
Subject: [PATCH] misc: hisi_hikey_usb: delete a stray tab
Message-Id: <20200918143405.GF909725@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Stultz <john.stultz@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This return statement is indented one tab too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/misc/hisi_hikey_usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/hisi_hikey_usb.c b/drivers/misc/hisi_hikey_usb.c
index 2ddd4072788d..0913509d2628 100644
--- a/drivers/misc/hisi_hikey_usb.c
+++ b/drivers/misc/hisi_hikey_usb.c
@@ -163,7 +163,7 @@ static int hisi_hikey_usb_parse_kirin970(struct platform_device *pdev,
 		dev_err(&pdev->dev,
 			"get hub-vdd-supply failed with error %ld\n",
 			PTR_ERR(regulator));
-			return PTR_ERR(regulator);
+		return PTR_ERR(regulator);
 	}
 	hisi_hikey_usb->regulator = regulator;
 
-- 
2.28.0
