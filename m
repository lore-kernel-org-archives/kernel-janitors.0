From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Aug 2015 07:49:27 +0000
Subject: [patch] mwifiex: usb: return an error if kmalloc fails
Message-Id: <20150804074927.GD10867@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <akarwar@marvell.com>
Cc: Nishant Sarmukadam <nishants@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The current code returns success if kmalloc fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/mwifiex/usb.c b/drivers/net/wireless/mwifiex/usb.c
index fbad99c..f866d5d 100644
--- a/drivers/net/wireless/mwifiex/usb.c
+++ b/drivers/net/wireless/mwifiex/usb.c
@@ -870,8 +870,10 @@ static int mwifiex_prog_fw_w_helper(struct mwifiex_adapter *adapter,
 
 	/* Allocate memory for transmit */
 	fwdata = kzalloc(FW_DNLD_TX_BUF_SIZE, GFP_KERNEL);
-	if (!fwdata)
+	if (!fwdata) {
+		ret = -ENOMEM;
 		goto fw_exit;
+	}
 
 	/* Allocate memory for receive */
 	recv_buff = kzalloc(FW_DNLD_RX_BUF_SIZE, GFP_KERNEL);
