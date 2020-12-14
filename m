From: Colin King <colin.king@canonical.com>
Date: Mon, 14 Dec 2020 22:28:13 +0000
Subject: [PATCH][next] usb: cdnsp: fix spelling mistake "delagete" -> "delegate"
Message-Id: <20201214222813.82727-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pawel Laszczak <pawell@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a trace message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/cdns3/cdnsp-ep0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdnsp-ep0.c b/drivers/usb/cdns3/cdnsp-ep0.c
index d55b59ed7381..b6a06e6210ba 100644
--- a/drivers/usb/cdns3/cdnsp-ep0.c
+++ b/drivers/usb/cdns3/cdnsp-ep0.c
@@ -45,7 +45,7 @@ static int cdnsp_ep0_delegate_req(struct cdnsp_device *pdev,
 {
 	int ret;
 
-	trace_cdnsp_ep0_request("delagete");
+	trace_cdnsp_ep0_request("delegate");
 
 	spin_unlock(&pdev->lock);
 	ret = pdev->gadget_driver->setup(&pdev->gadget, ctrl);
-- 
2.29.2
