From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Mar 2014 08:27:33 +0000
Subject: [patch] rsi: rsi_91x: misleading debug printk
Message-Id: <20140328082733.GK25192@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Fariya Fatima <fariyaf@gmail.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a missing set of curly braces here so the debug output says
"Probe confirm received" unintentionally.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/rsi/rsi_91x_mgmt.c b/drivers/net/wireless/rsi/rsi_91x_mgmt.c
index ef37d4b..2361a68 100644
--- a/drivers/net/wireless/rsi/rsi_91x_mgmt.c
+++ b/drivers/net/wireless/rsi/rsi_91x_mgmt.c
@@ -1292,10 +1292,11 @@ int rsi_mgmt_pkt_recv(struct rsi_common *common, u8 *msg)
 			return -EINVAL;
 		}
 	} else if (msg_type = TX_STATUS_IND) {
-		if (msg[15] = PROBEREQ_CONFIRM)
+		if (msg[15] = PROBEREQ_CONFIRM) {
 			common->mgmt_q_block = false;
 			rsi_dbg(FSM_ZONE, "%s: Probe confirm received\n",
 				__func__);
+		}
 	} else {
 		return rsi_mgmt_pkt_to_core(common, msg, msg_len, msg_type);
 	}
