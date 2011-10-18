From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:13:06 +0000
Subject: [patch 1/4] mwifiex: remove unneeded kfree(NULL);
Message-Id: <20111018061306.GG27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The previous if statement means this that pointer is NULL so there
is no need to free it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/mwifiex/pcie.c b/drivers/net/wireless/mwifiex/pcie.c
index d34acf0..4466976 100644
--- a/drivers/net/wireless/mwifiex/pcie.c
+++ b/drivers/net/wireless/mwifiex/pcie.c
@@ -386,7 +386,6 @@ static int mwifiex_pcie_create_txbd_ring(struct mwifiex_adapter *adapter)
 	card->txbd_ring_vbase = kzalloc(card->txbd_ring_size, GFP_KERNEL);
 	if (!card->txbd_ring_vbase) {
 		dev_err(adapter->dev, "Unable to allocate buffer for txbd ring.\n");
-		kfree(card->txbd_ring_vbase);
 		return -1;
 	}
 	card->txbd_ring_pbase = virt_to_phys(card->txbd_ring_vbase);
