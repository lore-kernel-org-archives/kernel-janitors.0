From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 09:24:33 +0000
Subject: [PATCH] usb: dwc3: gadget: remove redundant variable maxpacket
Message-Id: <20180713092433.10921-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable maxpacket is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'maxpacket' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/dwc3/ep0.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
index c77ff50a88a2..8efde178eef4 100644
--- a/drivers/usb/dwc3/ep0.c
+++ b/drivers/usb/dwc3/ep0.c
@@ -973,15 +973,12 @@ static void __dwc3_ep0_do_control_data(struct dwc3 *dwc,
 		ret = dwc3_ep0_start_trans(dep);
 	} else if (IS_ALIGNED(req->request.length, dep->endpoint.maxpacket) &&
 		   req->request.length && req->request.zero) {
-		u32	maxpacket;
 
 		ret = usb_gadget_map_request_by_dev(dwc->sysdev,
 				&req->request, dep->number);
 		if (ret)
 			return;
 
-		maxpacket = dep->endpoint.maxpacket;
-
 		/* prepare normal TRB */
 		dwc3_ep0_prepare_one_trb(dep, req->request.dma,
 					 req->request.length,
-- 
2.17.1

