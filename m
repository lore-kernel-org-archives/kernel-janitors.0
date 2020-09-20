From: Colin King <colin.king@canonical.com>
Date: Sun, 20 Sep 2020 14:20:46 +0000
Subject: [PATCH] misc: hisi_hikey_usb: clean up indentation issue
Message-Id: <20200920142046.33123-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Stultz <john.stultz@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a return statement that is indented too deeply,
fix this by removing the extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/hisi_hikey_usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/hisi_hikey_usb.c b/drivers/misc/hisi_hikey_usb.c
index 5759e7209023..cc93569e601c 100644
--- a/drivers/misc/hisi_hikey_usb.c
+++ b/drivers/misc/hisi_hikey_usb.c
@@ -162,7 +162,7 @@ static int hisi_hikey_usb_parse_kirin970(struct platform_device *pdev,
 		dev_err(&pdev->dev,
 			"get hub-vdd-supply failed with error %ld\n",
 			PTR_ERR(regulator));
-			return PTR_ERR(regulator);
+		return PTR_ERR(regulator);
 	}
 	hisi_hikey_usb->regulator = regulator;
 
-- 
2.27.0
