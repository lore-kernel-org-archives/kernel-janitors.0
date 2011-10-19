From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Oct 2011 07:32:28 +0000
Subject: [patch 3/4 v2] mwifiex: prevent corruption instead of just warning
Message-Id: <20111019073228.GS30887@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111018061514.GI27732@elgon.mountain>
 <477F20668A386D41ADCC57781B1F70430817F59764@SC-VEXCH1.marvell.com>
In-Reply-To: <477F20668A386D41ADCC57781B1F70430817F59764@SC-VEXCH1.marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Probably we never hit this condition, but in case we do, we may as
well put a return here instead of just printing a warning message and
then corrupting memory.  The caller doesn't check the return code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Use the error handling code to free the skb before returning.

diff --git a/drivers/net/wireless/mwifiex/pcie.c b/drivers/net/wireless/mwifiex/pcie.c
index d12d440..a2f3200 100644
--- a/drivers/net/wireless/mwifiex/pcie.c
+++ b/drivers/net/wireless/mwifiex/pcie.c
@@ -1228,9 +1228,12 @@ static int mwifiex_pcie_event_complete(struct mwifiex_adapter *adapter,
 	if (!skb)
 		return 0;
 
-	if (rdptr >= MWIFIEX_MAX_EVT_BD)
+	if (rdptr >= MWIFIEX_MAX_EVT_BD) {
 		dev_err(adapter->dev, "event_complete: Invalid rdptr 0x%x\n",
 					rdptr);
+		ret = -EINVAL;
+		goto done;
+	}
 
 	/* Read the event ring write pointer set by firmware */
 	if (mwifiex_read_reg(adapter, REG_EVTBD_WRPTR, &wrptr)) {
