From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Aug 2018 09:32:35 +0000
Subject: [PATCH] Bluetooth: mediatek: pass correct size to h4_recv_buf()
Message-Id: <20180813093235.hksi2c2ev37j4gji@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sean Wang <sean.wang@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

We're supposed to pass the number of elements in the mtk_recv_pkts, not
the number of bytes.

Fixes: 7237c4c9ec92 ("Bluetooth: mediatek: Add protocol support for MediaTek serial devices")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index e0571fe04d00..ed2a5c7cb77f 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -346,7 +346,7 @@ static int btmtkuart_recv(struct hci_dev *hdev, const u8 *data, size_t count)
 
 		bdev->rx_skb = h4_recv_buf(bdev->hdev, bdev->rx_skb, p_h4,
 					   sz_h4, mtk_recv_pkts,
-					   sizeof(mtk_recv_pkts));
+					   ARRAY_SIZE(mtk_recv_pkts));
 		if (IS_ERR(bdev->rx_skb)) {
 			err = PTR_ERR(bdev->rx_skb);
 			bt_dev_err(bdev->hdev,
