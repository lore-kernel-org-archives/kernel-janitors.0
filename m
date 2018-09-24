From: Josh Abraham <j.abraham1776@gmail.com>
Date: Mon, 24 Sep 2018 01:41:35 +0000
Subject: [PATCH] usb: dwc2: remove set but unused variable
Message-Id: <20180924014135.GA27711@josh-ThinkPad-T460s>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180912181610.GA31006@josh-ThinkPad-T460s>
In-Reply-To: <20180912181610.GA31006@josh-ThinkPad-T460s>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: hminas@synopsys.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, j.abraham1776@gmail.com

This patch removes a set but unused variable in hcd.c.

Fixes gcc warning:
variable ‘data_fifo’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Joshua Abraham <j.abraham1776@gmail.com>
---
 drivers/usb/dwc2/hcd.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index 2bd6e6bfc241..5f23b933cafc 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -1328,14 +1328,11 @@ static void dwc2_hc_write_packet(struct dwc2_hsotg *hsotg,
 	u32 remaining_count;
 	u32 byte_count;
 	u32 dword_count;
-	u32 __iomem *data_fifo;
 	u32 *data_buf = (u32 *)chan->xfer_buf;
 
 	if (dbg_hc(chan))
 		dev_vdbg(hsotg->dev, "%s()\n", __func__);
 
-	data_fifo = (u32 __iomem *)(hsotg->regs + HCFIFO(chan->hc_num));
-
 	remaining_count = chan->xfer_len - chan->xfer_count;
 	if (remaining_count > chan->max_packet)
 		byte_count = chan->max_packet;
-- 
2.17.1
