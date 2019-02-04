From: Colin King <colin.king@canonical.com>
Date: Mon, 04 Feb 2019 19:03:10 +0000
Subject: [PATCH] Bluetooth: remove redundant zero check on count
Message-Id: <20190204190310.24179-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable count is never zero inside the loop so the check if count is
zero is redundant and can be removed. Fix this.

Detected by CoverityScan, CID#1466880 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/bluetooth/h4_recv.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/bluetooth/h4_recv.h b/drivers/bluetooth/h4_recv.h
index 307d82166f48..87ccaceadba7 100644
--- a/drivers/bluetooth/h4_recv.h
+++ b/drivers/bluetooth/h4_recv.h
@@ -67,9 +67,6 @@ static inline struct sk_buff *h4_recv_buf(struct hci_dev *hdev,
 	while (count) {
 		int i, len;
 
-		if (!count)
-			break;
-
 		if (!skb) {
 			for (i = 0; i < pkts_count; i++) {
 				if (buffer[0] != (&pkts[i])->type)
-- 
2.20.1
