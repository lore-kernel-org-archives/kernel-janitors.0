From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Fri, 07 Sep 2012 15:24:42 +0000
Subject: [PATCH 4/10] drivers/bluetooth/hci_ll.c: removes unnecessary semicolon
Message-Id: <1347031488-26598-4-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>
Cc: kernel-janitors@vger.kernel.org, Julia.Lawall@lip6.fr, Gustavo Padovan <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/bluetooth/hci_ll.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/bluetooth/hci_ll.c b/drivers/bluetooth/hci_ll.c
--- a/drivers/bluetooth/hci_ll.c
+++ b/drivers/bluetooth/hci_ll.c
@@ -481,7 +481,7 @@ static int ll_recv(struct hci_uart *hu,
 			hu->hdev->stat.err_rx++;
 			ptr++; count--;
 			continue;
-		};
+		}
 
 		ptr++; count--;
 

