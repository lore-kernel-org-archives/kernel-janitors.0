From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Mar 2020 13:21:17 +0000
Subject: [PATCH net] NFC: fdp: Fix a signedness bug in fdp_nci_send_patch()
Message-Id: <20200320132117.GA95012@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kate Stewart <kstewart@linuxfoundation.org>, Robert Dolca <robert.dolca@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Samuel Ortiz <sameo@linux.intel.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The nci_conn_max_data_pkt_payload_size() function sometimes returns
-EPROTO so "max_size" needs to be signed for the error handling to
work.  We can make "payload_size" an int as well.

Fixes: a06347c04c13 ("NFC: Add Intel Fields Peak NFC solution driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/nfc/fdp/fdp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nfc/fdp/fdp.c b/drivers/nfc/fdp/fdp.c
index 7c0b1e6b80ff..4dc7bd7e02b6 100644
--- a/drivers/nfc/fdp/fdp.c
+++ b/drivers/nfc/fdp/fdp.c
@@ -184,7 +184,7 @@ static int fdp_nci_send_patch(struct nci_dev *ndev, u8 conn_id, u8 type)
 	const struct firmware *fw;
 	struct sk_buff *skb;
 	unsigned long len;
-	u8 max_size, payload_size;
+	int max_size, payload_size;
 	int rc = 0;
 
 	if ((type = NCI_PATCH_TYPE_OTP && !info->otp_patch) ||
@@ -207,8 +207,7 @@ static int fdp_nci_send_patch(struct nci_dev *ndev, u8 conn_id, u8 type)
 
 	while (len) {
 
-		payload_size = min_t(unsigned long, (unsigned long) max_size,
-				     len);
+		payload_size = min_t(unsigned long, max_size, len);
 
 		skb = nci_skb_alloc(ndev, (NCI_CTRL_HDR_SIZE + payload_size),
 				    GFP_KERNEL);
-- 
2.20.1
