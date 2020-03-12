From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Mar 2020 11:33:09 +0000
Subject: [PATCH] Bluetooth: L2CAP: Fix a condition in l2cap_sock_recvmsg()
Message-Id: <20200312113309.GE20562@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains about the indenting:

    net/bluetooth/l2cap_sock.c:1027 l2cap_sock_recvmsg()
    warn: inconsistent indenting

It looks like this is supposed to be an "else if" condition.

Fixes: 15f02b910562 ("Bluetooth: L2CAP: Add initial code for Enhanced Credit Based Mode")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/bluetooth/l2cap_sock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index 0c636be3469e..40fb10b591bd 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1024,7 +1024,7 @@ static int l2cap_sock_recvmsg(struct socket *sock, struct msghdr *msg,
 			sk->sk_state = BT_CONNECTED;
 			pi->chan->state = BT_CONNECTED;
 			__l2cap_ecred_conn_rsp_defer(pi->chan);
-		} if (bdaddr_type_is_le(pi->chan->src_type)) {
+		} else if (bdaddr_type_is_le(pi->chan->src_type)) {
 			sk->sk_state = BT_CONNECTED;
 			pi->chan->state = BT_CONNECTED;
 			__l2cap_le_connect_rsp_defer(pi->chan);
-- 
2.20.1
