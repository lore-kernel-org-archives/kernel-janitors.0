From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Jan 2020 18:00:13 +0000
Subject: [PATCH] Bluetooth: remove redundant assignment to variable icid
Message-Id: <20200107180013.124501-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable icid is being rc is assigned with a value that is never
read. The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 net/bluetooth/l2cap_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 1bca608e0170..195459a1e53e 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -5081,7 +5081,6 @@ static inline int l2cap_move_channel_req(struct l2cap_conn *conn,
 	chan->move_role = L2CAP_MOVE_ROLE_RESPONDER;
 	l2cap_move_setup(chan);
 	chan->move_id = req->dest_amp_id;
-	icid = chan->dcid;
 
 	if (req->dest_amp_id = AMP_ID_BREDR) {
 		/* Moving to BR/EDR */
-- 
2.24.0
