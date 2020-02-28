From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 28 Feb 2020 05:01:13 +0000
Subject: [PATCH] Bluetooth: hci_h4: Remove a redundant assignment in 'h4_flush()'
Message-Id: <20200228050113.25041-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: marcel@holtmann.org, johan.hedberg@gmail.com
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'hu->priv' is set twice to NULL in this function.
Axe one of these assignments.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/bluetooth/hci_h4.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bluetooth/hci_h4.c b/drivers/bluetooth/hci_h4.c
index 6dc1fbeb564b..0b84a05a730b 100644
--- a/drivers/bluetooth/hci_h4.c
+++ b/drivers/bluetooth/hci_h4.c
@@ -71,8 +71,6 @@ static int h4_close(struct hci_uart *hu)
 {
 	struct h4_struct *h4 = hu->priv;
 
-	hu->priv = NULL;
-
 	BT_DBG("hu %p", hu);
 
 	skb_queue_purge(&h4->txq);
-- 
2.20.1
