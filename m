From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 15 Feb 2020 07:17:28 +0000
Subject: [PATCH] NFC: pn544: Fix a typo in a debug message
Message-Id: <20200215071728.302-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sameo@linux.intel.com, joe@perches.com, davem@davemloft.net, gregkh@linuxfoundation.org, allison@lohutok.net, tglx@linutronix.de, kstewart@linuxfoundation.org, natechancellor@gmail.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The ending character of the string shoulb be \n, not \b.

Fixes: 17936b43f0fd ("NFC: Standardize logging style")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/nfc/pn544/pn544.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nfc/pn544/pn544.c b/drivers/nfc/pn544/pn544.c
index 2b83156efe3f..b788870473e8 100644
--- a/drivers/nfc/pn544/pn544.c
+++ b/drivers/nfc/pn544/pn544.c
@@ -682,7 +682,7 @@ static int pn544_hci_tm_send(struct nfc_hci_dev *hdev, struct sk_buff *skb)
 static int pn544_hci_check_presence(struct nfc_hci_dev *hdev,
 				   struct nfc_target *target)
 {
-	pr_debug("supported protocol %d\b", target->supported_protocols);
+	pr_debug("supported protocol %d\n", target->supported_protocols);
 	if (target->supported_protocols & (NFC_PROTO_ISO14443_MASK |
 					NFC_PROTO_ISO14443_B_MASK)) {
 		return nfc_hci_send_cmd(hdev, target->hci_reader_gate,
-- 
2.20.1
