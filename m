From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Apr 2016 14:23:44 +0000
Subject: [patch 2/2] mwifiex: fix loop timeout in mwifiex_prog_fw_w_helper()
Message-Id: <20160419142344.GB4876@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <akarwar@marvell.com>
Cc: Nishant Sarmukadam <nishants@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

USB8XXX_FW_MAX_RETRY is 3.  We were using a post-op loop
"while (retries--) {" but then the lines after that assume the loop
exits with retries set to zero.

I've fixed this by changing to a pre-op loop.  I started with retries
set to 4 instead of 3 so that we still go through the loop the same
number of times.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/marvell/mwifiex/usb.c b/drivers/net/wireless/marvell/mwifiex/usb.c
index cdd8f9a..0857575 100644
--- a/drivers/net/wireless/marvell/mwifiex/usb.c
+++ b/drivers/net/wireless/marvell/mwifiex/usb.c
@@ -995,7 +995,8 @@ static int mwifiex_prog_fw_w_helper(struct mwifiex_adapter *adapter,
 {
 	int ret = 0;
 	u8 *firmware = fw->fw_buf, *recv_buff;
-	u32 retries = USB8XXX_FW_MAX_RETRY, dlen;
+	u32 retries = USB8XXX_FW_MAX_RETRY + 1;
+	u32 dlen;
 	u32 fw_seqnum = 0, tlen = 0, dnld_cmd = 0;
 	struct fw_data *fwdata;
 	struct fw_sync_header sync_fw;
@@ -1043,7 +1044,7 @@ static int mwifiex_prog_fw_w_helper(struct mwifiex_adapter *adapter,
 		}
 
 		/* If the send/receive fails or CRC occurs then retry */
-		while (retries--) {
+		while (--retries) {
 			u8 *buf = (u8 *)fwdata;
 			u32 len = FW_DATA_XMIT_SIZE;
 
@@ -1103,7 +1104,7 @@ static int mwifiex_prog_fw_w_helper(struct mwifiex_adapter *adapter,
 				continue;
 			}
 
-			retries = USB8XXX_FW_MAX_RETRY;
+			retries = USB8XXX_FW_MAX_RETRY + 1;
 			break;
 		}
 		fw_seqnum++;
