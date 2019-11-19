From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Nov 2019 06:17:05 +0000
Subject: [PATCH] Bluetooth: delete a stray unlock
Message-Id: <20191119053710.eflgllzyoyglrrj7@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Andrei Emeltchenko <andrei.emeltchenko@intel.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

We used to take a lock in amp_physical_cfm() but then we moved it to
the caller function.  Unfortunately the unlock on this error path was
overlooked so it leads to a double unlock.

Fixes: a514b17fab51 ("Bluetooth: Refactor locking in amp_physical_cfm")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 net/bluetooth/l2cap_core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index da7fdbdf9c41..a845786258a0 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -4936,10 +4936,8 @@ void __l2cap_physical_cfm(struct l2cap_chan *chan, int result)
 	BT_DBG("chan %p, result %d, local_amp_id %d, remote_amp_id %d",
 	       chan, result, local_amp_id, remote_amp_id);
 
-	if (chan->state = BT_DISCONN || chan->state = BT_CLOSED) {
-		l2cap_chan_unlock(chan);
+	if (chan->state = BT_DISCONN || chan->state = BT_CLOSED)
 		return;
-	}
 
 	if (chan->state != BT_CONNECTED) {
 		l2cap_do_create(chan, result, local_amp_id, remote_amp_id);
-- 
2.11.0
