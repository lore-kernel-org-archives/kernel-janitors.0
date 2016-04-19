From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Apr 2016 14:21:58 +0000
Subject: [patch 1/2] mwifiex: missing error code on allocation failure
Message-Id: <20160419142158.GA4876@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <akarwar@marvell.com>
Cc: Nishant Sarmukadam <nishants@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally return success instead of -ENOMEM.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/marvell/mwifiex/usb.c b/drivers/net/wireless/marvell/mwifiex/usb.c
index 0510861..cdd8f9a 100644
--- a/drivers/net/wireless/marvell/mwifiex/usb.c
+++ b/drivers/net/wireless/marvell/mwifiex/usb.c
@@ -1017,8 +1017,10 @@ static int mwifiex_prog_fw_w_helper(struct mwifiex_adapter *adapter,
 
 	/* Allocate memory for receive */
 	recv_buff = kzalloc(FW_DNLD_RX_BUF_SIZE, GFP_KERNEL);
-	if (!recv_buff)
+	if (!recv_buff) {
+		ret = -ENOMEM;
 		goto cleanup;
+	}
 
 	do {
 		/* Send pseudo data to check winner status first */
