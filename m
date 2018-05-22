From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 22 May 2018 11:49:55 +0000
Subject: [PATCH -next] USB: dwc3: make function dwc3_get_extcon() static
Message-Id: <1526989795-140120-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

drivers/usb/dwc3/drd.c:443:19: warning:
 symbol 'dwc3_get_extcon' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/dwc3/drd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index 2706824..218371f 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -440,7 +440,7 @@ static int dwc3_drd_notifier(struct notifier_block *nb,
 	return NOTIFY_DONE;
 }
 
-struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
+static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
 {
 	struct device *dev = dwc->dev;
 	struct device_node *np_phy, *np_conn;

