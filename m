From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Feb 2021 11:12:39 +0000
Subject: [PATCH][next] usb: cdnsp: Fix spelling mistake "delagete" -> "delegate"
Message-Id: <20210203111239.18313-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201214222813.82727-1-colin.king@canonical.com>
In-Reply-To: <20201214222813.82727-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pawel Laszczak <pawell@cadence.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a literal string. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/cdns3/cdnsp-ep0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/cdns3/cdnsp-ep0.c b/drivers/usb/cdns3/cdnsp-ep0.c
index e2b1bcb3f80e..e30931ebc870 100644
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
