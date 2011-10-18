From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:14:09 +0000
Subject: [patch 2/4] mwifiex: remove an unneeded NULL check
Message-Id: <20111018061409.GH27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We dereference adapter in the error handling code so this needed to
be fixed.  This function is always called like:
	adapter->if_ops.host_to_card(adapter, ...);
so adapter can never be NULL and I've removed the NULL check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/mwifiex/pcie.c b/drivers/net/wireless/mwifiex/pcie.c
index 4466976..d12d440 100644
--- a/drivers/net/wireless/mwifiex/pcie.c
+++ b/drivers/net/wireless/mwifiex/pcie.c
@@ -1671,9 +1671,8 @@ static int mwifiex_pcie_host_to_card(struct mwifiex_adapter *adapter, u8 type,
 				     struct sk_buff *skb,
 				     struct mwifiex_tx_param *tx_param)
 {
-	if (!adapter || !skb) {
-		dev_err(adapter->dev, "Invalid parameter in %s <%p, %p>\n",
-				__func__, adapter, skb);
+	if (!skb) {
+		dev_err(adapter->dev, "Passed NULL skb to %s\n", __func__);
 		return -1;
 	}
 
