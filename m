From: DingXiang <dingxiang@huawei.com>
Date: Fri, 10 Apr 2015 08:45:58 +0000
Subject: [PATCH] Bluetooth:deltele some unuseful comments
Message-Id: <1428655558-6300-1-git-send-email-dingxiang@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: dingxiang <dingxiang@huawei.com>

From: dingxiang <dingxiang@huawei.com>

I think the comments are used to debug, and we don't need them in
mainline code

Signed-off-by: DingXiang <dingxiang@huawei.com>
---
 drivers/bluetooth/bt3c_cs.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/bt3c_cs.c b/drivers/bluetooth/bt3c_cs.c
index 4f7e8d4..6de97b3 100644
--- a/drivers/bluetooth/bt3c_cs.c
+++ b/drivers/bluetooth/bt3c_cs.c
@@ -227,7 +227,6 @@ static void bt3c_receive(struct bt3c_info *info)
 	iobase = info->p_dev->resource[0]->start;
 
 	avail = bt3c_read(iobase, 0x7006);
-	//printk("bt3c_cs: receiving %d bytes\n", avail);
 
 	bt3c_address(iobase, 0x7480);
 	while (size < avail) {
@@ -250,7 +249,6 @@ static void bt3c_receive(struct bt3c_info *info)
 
 			bt_cb(info->rx_skb)->pkt_type = inb(iobase + DATA_L);
 			inb(iobase + DATA_H);
-			//printk("bt3c: PACKET_TYPE=%02x\n", bt_cb(info->rx_skb)->pkt_type);
 
 			switch (bt_cb(info->rx_skb)->pkt_type) {
 
@@ -364,7 +362,6 @@ static irqreturn_t bt3c_interrupt(int irq, void *dev_inst)
 			if (stat & 0x0001)
 				bt3c_receive(info);
 			if (stat & 0x0002) {
-				//BT_ERR("Ack (stat=0x%04x)", stat);
 				clear_bit(XMIT_SENDING, &(info->tx_state));
 				bt3c_write_wakeup(info);
 			}
-- 
1.7.1


