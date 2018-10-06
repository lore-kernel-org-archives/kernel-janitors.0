From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 06 Oct 2018 02:23:01 +0000
Subject: [PATCH -next] usb/early: remove set but not used variable 'remain_length'
Message-Id: <1538792581-192494-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/early/xhci-dbc.c: In function 'xdbc_handle_tx_event':
drivers/usb/early/xhci-dbc.c:720:9: warning:
 variable 'remain_length' set but not used [-Wunused-but-set-variable]

It never be used since introduction in 
commit aeb9dd1de98c ("usb/early: Add driver for xhci debug capability")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/early/xhci-dbc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
index 9d4ee88..d2652dc 100644
--- a/drivers/usb/early/xhci-dbc.c
+++ b/drivers/usb/early/xhci-dbc.c
@@ -717,17 +717,14 @@ static void xdbc_handle_port_status(struct xdbc_trb *evt_trb)
 
 static void xdbc_handle_tx_event(struct xdbc_trb *evt_trb)
 {
-	size_t remain_length;
 	u32 comp_code;
 	int ep_id;
 
 	comp_code	= GET_COMP_CODE(le32_to_cpu(evt_trb->field[2]));
-	remain_length	= EVENT_TRB_LEN(le32_to_cpu(evt_trb->field[2]));
 	ep_id		= TRB_TO_EP_ID(le32_to_cpu(evt_trb->field[3]));
 
 	switch (comp_code) {
 	case COMP_SUCCESS:
-		remain_length = 0;
 	case COMP_SHORT_PACKET:
 		break;
 	case COMP_TRB_ERROR:
