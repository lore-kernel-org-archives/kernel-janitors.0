From: Julia Lawall <julia@diku.dk>
Date: Tue, 20 Nov 2007 20:52:37 +0000
Subject: [PATCH] drivers/bluetooth: Convert kfree to kfree_skb
Message-Id: <Pine.LNX.4.64.0711202151430.25786@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: marcel@holtmann.org, maxk@qualcomm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

kfree_skb rather than kfree should be used for values of type struct
sk_buff *.

This was fixed using the following semantic patch
(http://www.emn.fr/x-info/coccinelle/).

// <smpl>
@@
struct sk_buff *skb;
@@

- kfree(skb)
+ kfree_skb(skb)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---

diff -u -p a/drivers/bluetooth/bpa10x.c b/drivers/bluetooth/bpa10x.c
--- a/drivers/bluetooth/bpa10x.c 2007-11-01 10:30:39.000000000 +0100
+++ b/drivers/bluetooth/bpa10x.c 2007-11-20 21:07:42.000000000 +0100
@@ -446,8 +446,8 @@ static void bpa10x_destruct(struct hci_d
 
 	BT_DBG("%s", hdev->name);
 
-	kfree(data->rx_skb[0]);
-	kfree(data->rx_skb[1]);
+	kfree_skb(data->rx_skb[0]);
+	kfree_skb(data->rx_skb[1]);
 	kfree(data);
 }
 
diff -u -p a/drivers/bluetooth/btsdio.c b/drivers/bluetooth/btsdio.c
--- a/drivers/bluetooth/btsdio.c 2007-11-01 10:30:39.000000000 +0100
+++ b/drivers/bluetooth/btsdio.c 2007-11-20 21:07:44.000000000 +0100
@@ -152,7 +152,7 @@ static int btsdio_rx_packet(struct btsdi
 
 	err = sdio_readsb(data->func, skb->data, REG_RDAT, len - 4);
 	if (err < 0) {
-		kfree(skb);
+		kfree_skb(skb);
 		return err;
 	}
 
@@ -163,7 +163,7 @@ static int btsdio_rx_packet(struct btsdi
 
 	err = hci_recv_frame(skb);
 	if (err < 0) {
-		kfree(skb);
+		kfree_skb(skb);
 		return err;
 	}
 
