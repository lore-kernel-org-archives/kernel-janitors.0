From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Jul 2017 07:21:15 +0000
Subject: [PATCH] mwifiex: usb: unlock on error in mwifiex_usb_tx_aggr_tmo()
Message-Id: <20170710072115.2y4ukbl7x4rk4bac@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <amitkarwar@gmail.com>, Xinming Hu <huxm@marvell.com>
Cc: Nishant Sarmukadam <nishants@marvell.com>, Ganapathi Bhat <gbhat@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to unlock if mwifiex_usb_prepare_tx_aggr_skb() fails.

Fixes: a2ca85ad721d ("mwifiex: usb: add timer to flush aggregation packets")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/marvell/mwifiex/usb.c b/drivers/net/wireless/marvell/mwifiex/usb.c
index cb1753e43ef4..880ef1cb4088 100644
--- a/drivers/net/wireless/marvell/mwifiex/usb.c
+++ b/drivers/net/wireless/marvell/mwifiex/usb.c
@@ -1112,7 +1112,7 @@ static void mwifiex_usb_tx_aggr_tmo(unsigned long context)
 	if (err) {
 		mwifiex_dbg(adapter, ERROR,
 			    "prepare tx aggr skb failed, err=%d\n", err);
-		return;
+		goto unlock;
 	}
 
 	if (atomic_read(&port->tx_data_urb_pending) >@@ -1133,6 +1133,7 @@ static void mwifiex_usb_tx_aggr_tmo(unsigned long context)
 done:
 	if (err = -1)
 		mwifiex_write_data_complete(adapter, skb_send, 0, -1);
+unlock:
 	spin_unlock_irqrestore(&port->tx_aggr_lock, flags);
 }
 
