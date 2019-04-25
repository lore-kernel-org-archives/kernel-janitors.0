From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 25 Apr 2019 01:57:19 +0000
Subject: [PATCH -next] NFC: st95hf: remove set but not used variables 'dev, nfcddev'
Message-Id: <20190425020720.46560-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Daniel Mack <daniel@zonque.org>, "David S. Miller" <davem@davemloft.net>, Daniel Gomez <dagmcr@gmail.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/nfc/st95hf/core.c: In function 'st95hf_irq_thread_handler':
drivers/nfc/st95hf/core.c:786:26: warning:
 variable 'nfcddev' set but not used [-Wunused-but-set-variable]

drivers/nfc/st95hf/core.c:784:17: warning:
 variable 'dev' set but not used [-Wunused-but-set-variable]

They are never used since introduction in
commit cab47333f0f7 ("NFC: Add STMicroelectronics ST95HF driver")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/nfc/st95hf/core.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/nfc/st95hf/core.c b/drivers/nfc/st95hf/core.c
index 815194bfda8e..f3bec0a84595 100644
--- a/drivers/nfc/st95hf/core.c
+++ b/drivers/nfc/st95hf/core.c
@@ -781,9 +781,7 @@ static irqreturn_t st95hf_irq_thread_handler(int irq, void  *st95hfcontext)
 	int result = 0;
 	int res_len;
 	static bool wtx;
-	struct device *dev;
 	struct device *spidevice;
-	struct nfc_digital_dev *nfcddev;
 	struct sk_buff *skb_resp;
 	struct st95hf_context *stcontext   		(struct st95hf_context *)st95hfcontext;
@@ -828,8 +826,6 @@ static irqreturn_t st95hf_irq_thread_handler(int irq, void  *st95hfcontext)
 		goto end;
 	}
 
-	dev = &stcontext->nfcdev->dev;
-	nfcddev = stcontext->ddev;
 	if (skb_resp->data[2] = WTX_REQ_FROM_TAG) {
 		/* Request for new FWT from tag */
 		result = st95hf_handle_wtx(stcontext, true, skb_resp->data[3]);
