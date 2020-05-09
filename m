From: Colin King <colin.king@canonical.com>
Date: Sat, 09 May 2020 21:48:03 +0000
Subject: [PATCH] net: huawei_cdc_ncm: remove redundant assignment to variable ret
Message-Id: <20200509214803.506276-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, open <linux-usb@vger.kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initializeed with a value that is never read
and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/usb/huawei_cdc_ncm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/huawei_cdc_ncm.c b/drivers/net/usb/huawei_cdc_ncm.c
index 099d84827004..a87f0dabcdb7 100644
--- a/drivers/net/usb/huawei_cdc_ncm.c
+++ b/drivers/net/usb/huawei_cdc_ncm.c
@@ -67,7 +67,7 @@ static int huawei_cdc_ncm_bind(struct usbnet *usbnet_dev,
 {
 	struct cdc_ncm_ctx *ctx;
 	struct usb_driver *subdriver = ERR_PTR(-ENODEV);
-	int ret = -ENODEV;
+	int ret;
 	struct huawei_cdc_ncm_state *drvstate = (void *)&usbnet_dev->data;
 	int drvflags = 0;
 
-- 
2.25.1
