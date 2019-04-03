From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Apr 2019 07:12:48 +0000
Subject: [PATCH 1/2 net] NFC: nci: Add some bounds checking in nci_hci_cmd_received()
Message-Id: <20190403071248.GA5758@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Christophe Ricard <christophe.ricard@gmail.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, Suren Baghdasaryan <surenb@google.com>

This is similar to commit 674d9de02aa7 ("NFC: Fix possible memory
corruption when handling SHDLC I-Frame commands").

I'm not totally sure, but I think that commit description may have
overstated the danger.  I was under the impression that this data came
from the firmware?  If you can't trust your networking firmware, then
you're already in trouble.

Anyway, these days we add bounds checking where ever we can and we call
it kernel hardening.  Better safe than sorry.

Fixes: 11f54f228643 ("NFC: nci: Add HCI over NCI protocol support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/nfc/nci/hci.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index ddfc52ac1f9b..c0d323b58e73 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -312,6 +312,10 @@ static void nci_hci_cmd_received(struct nci_dev *ndev, u8 pipe,
 		create_info = (struct nci_hci_create_pipe_resp *)skb->data;
 		dest_gate = create_info->dest_gate;
 		new_pipe = create_info->pipe;
+		if (new_pipe >= NCI_HCI_MAX_PIPES) {
+			status = NCI_HCI_ANY_E_NOK;
+			goto exit;
+		}
 
 		/* Save the new created pipe and bind with local gate,
 		 * the description for skb->data[3] is destination gate id
@@ -336,6 +340,10 @@ static void nci_hci_cmd_received(struct nci_dev *ndev, u8 pipe,
 			goto exit;
 		}
 		delete_info = (struct nci_hci_delete_pipe_noti *)skb->data;
+		if (delete_info->pipe >= NCI_HCI_MAX_PIPES) {
+			status = NCI_HCI_ANY_E_NOK;
+			goto exit;
+		}
 
 		ndev->hci_dev->pipes[delete_info->pipe].gate  						NCI_HCI_INVALID_GATE;
-- 
2.17.1
