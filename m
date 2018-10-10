From: Colin King <colin.king@canonical.com>
Date: Wed, 10 Oct 2018 14:37:31 +0000
Subject: [PATCH] Bluetooth: Remove redundant check on status
Message-Id: <20181010143731.16451-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check on statis is redundant as a status has to be zero at
the point it is being checked because of a previous check and return
path via label 'unlock'.  Remove the redundant check and the deadcode
that can never be reached.

Detected by CoverityScan, CID#1471710 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/bluetooth/hci_event.c | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index f47f8fad757a..ef9928d7b4fb 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4937,31 +4937,27 @@ static void le_conn_complete_evt(struct hci_dev *hdev, u8 status,
 	hci_debugfs_create_conn(conn);
 	hci_conn_add_sysfs(conn);
 
-	if (!status) {
-		/* The remote features procedure is defined for master
-		 * role only. So only in case of an initiated connection
-		 * request the remote features.
-		 *
-		 * If the local controller supports slave-initiated features
-		 * exchange, then requesting the remote features in slave
-		 * role is possible. Otherwise just transition into the
-		 * connected state without requesting the remote features.
-		 */
-		if (conn->out ||
-		    (hdev->le_features[0] & HCI_LE_SLAVE_FEATURES)) {
-			struct hci_cp_le_read_remote_features cp;
+	/* The remote features procedure is defined for master
+	 * role only. So only in case of an initiated connection
+	 * request the remote features.
+	 *
+	 * If the local controller supports slave-initiated features
+	 * exchange, then requesting the remote features in slave
+	 * role is possible. Otherwise just transition into the
+	 * connected state without requesting the remote features.
+	 */
+	if (conn->out ||
+	    (hdev->le_features[0] & HCI_LE_SLAVE_FEATURES)) {
+		struct hci_cp_le_read_remote_features cp;
 
-			cp.handle = __cpu_to_le16(conn->handle);
+		cp.handle = __cpu_to_le16(conn->handle);
 
-			hci_send_cmd(hdev, HCI_OP_LE_READ_REMOTE_FEATURES,
-				     sizeof(cp), &cp);
+		hci_send_cmd(hdev, HCI_OP_LE_READ_REMOTE_FEATURES,
+			     sizeof(cp), &cp);
 
-			hci_conn_hold(conn);
-		} else {
-			conn->state = BT_CONNECTED;
-			hci_connect_cfm(conn, status);
-		}
+		hci_conn_hold(conn);
 	} else {
+		conn->state = BT_CONNECTED;
 		hci_connect_cfm(conn, status);
 	}
 
-- 
2.17.1
