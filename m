From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 29 Mar 2018 02:20:10 +0000
Subject: [PATCH -next] usb: dwc3: gadget: dwc3_gadget_del_and_unmap_request() can be static
Message-Id: <1522290010-64022-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/usb/dwc3/gadget.c:169:6: warning:
 symbol 'dwc3_gadget_del_and_unmap_request' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/dwc3/gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 8796a5ee..206ecc7 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -166,7 +166,7 @@ static void dwc3_ep_inc_deq(struct dwc3_ep *dep)
 	dwc3_ep_inc_trb(&dep->trb_dequeue);
 }
 
-void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
+static void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
 		struct dwc3_request *req, int status)
 {
 	struct dwc3			*dwc = dep->dwc;



