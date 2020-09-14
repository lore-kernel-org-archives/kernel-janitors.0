From: Colin King <colin.king@canonical.com>
Date: Mon, 14 Sep 2020 13:56:46 +0000
Subject: [PATCH][next] misc: hisi_hikey_usb: fix return of uninitialized ret status variable
Message-Id: <20200914135646.99334-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Stultz <john.stultz@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the return value from ret is uninitialized so the function
hisi_hikey_usb_parse_kirin970 is returning a garbage value when
succeeding. Since ret is not used anywhere else in the function, remove
it and just return 0 success at the end of the function.

Addresses-Coverity: ("Uninitialixed scalar variable")
Fixes: d210a0023590 ("misc: hisi_hikey_usb: add support for Hikey 970")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/hisi_hikey_usb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/hisi_hikey_usb.c b/drivers/misc/hisi_hikey_usb.c
index 2ddd4072788d..5759e7209023 100644
--- a/drivers/misc/hisi_hikey_usb.c
+++ b/drivers/misc/hisi_hikey_usb.c
@@ -151,7 +151,6 @@ static int hisi_hikey_usb_parse_kirin970(struct platform_device *pdev,
 					 struct hisi_hikey_usb *hisi_hikey_usb)
 {
 	struct regulator *regulator;
-	int ret;
 
 	regulator = devm_regulator_get(&pdev->dev, "hub-vdd");
 	if (IS_ERR(regulator)) {
@@ -172,7 +171,7 @@ static int hisi_hikey_usb_parse_kirin970(struct platform_device *pdev,
 	if (IS_ERR(hisi_hikey_usb->reset))
 		return PTR_ERR(hisi_hikey_usb->reset);
 
-	return ret;
+	return 0;
 }
 
 static int hisi_hikey_usb_probe(struct platform_device *pdev)
-- 
2.27.0
