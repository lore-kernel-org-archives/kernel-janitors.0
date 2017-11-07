From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Nov 2017 12:21:40 +0000
Subject: [PATCH] usb: host: isp1362-hcd: remove a couple of redundant assignments
Message-Id: <20171107122140.8948-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable index is being initialized and the value is never read,
it is being updated a few statements later, so remove the redundant
initialization.  Variable total is being updated but the value is
never read, so this is also redundant and can be removed. Cleans
up two clang warnings:

drivers/usb/host/isp1362-hcd.c:715:6: warning: Value stored to
'index' during its initialization is never read
drivers/usb/host/isp1362-hcd.c:2254:2: warning: Value stored to
'total' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/host/isp1362-hcd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/isp1362-hcd.c b/drivers/usb/host/isp1362-hcd.c
index c7e60b662e9b..b21c386e6a46 100644
--- a/drivers/usb/host/isp1362-hcd.c
+++ b/drivers/usb/host/isp1362-hcd.c
@@ -713,7 +713,7 @@ static inline void enable_istl_transfers(struct isp1362_hcd *isp1362_hcd, int fl
 static int submit_req(struct isp1362_hcd *isp1362_hcd, struct urb *urb,
 		      struct isp1362_ep *ep, struct isp1362_ep_queue *epq)
 {
-	int index = epq->free_ptd;
+	int index;
 
 	prepare_ptd(isp1362_hcd, urb, ep, epq, 0);
 	index = claim_ptd_buffers(epq, ep, ep->length);
@@ -2253,7 +2253,6 @@ static int isp1362_mem_config(struct usb_hcd *hcd)
 		return -ENOMEM;
 	}
 
-	total = istl_size + intl_size + atl_size;
 	spin_lock_irqsave(&isp1362_hcd->lock, flags);
 
 	for (i = 0; i < 2; i++) {
-- 
2.14.1

