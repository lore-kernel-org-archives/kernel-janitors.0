From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Feb 2017 07:18:08 +0000
Subject: [patch] staging: gdm724x: fix a couple array overflows
Message-Id: <20170208071808.GA12703@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The find_dev_index() function is frustrating.  If you give it an invalid
index then it returns 0.  That was the intent except there is an
off-by-one so it can return MAX_NIC_TYPE which is one higher than we
want.

There is one caller which had a sanity check to catch invalid returns,
but the other two callers assumed that index was valid.

My feeling is that when we are given invalid indexes, that should be
treated like an error and we abandon what we were doing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

diff --git a/drivers/staging/gdm724x/gdm_lte.c b/drivers/staging/gdm724x/gdm_lte.c
index a182757544c8..02b269ac25e5 100644
--- a/drivers/staging/gdm724x/gdm_lte.c
+++ b/drivers/staging/gdm724x/gdm_lte.c
@@ -560,13 +560,13 @@ void gdm_lte_event_exit(void)
 	}
 }
 
-static u8 find_dev_index(u32 nic_type)
+static int find_dev_index(u32 nic_type)
 {
 	u8 index;
 
 	index = (u8)(nic_type & 0x0000000f);
-	if (index > MAX_NIC_TYPE)
-		index = 0;
+	if (index >= MAX_NIC_TYPE)
+		return -EINVAL;
 
 	return index;
 }
@@ -695,7 +695,7 @@ static void gdm_lte_multi_sdu_pkt(struct phy_dev *phy_dev, char *buf, int len)
 	u16 hci_len;
 	u16 cmd_evt;
 	u32 nic_type;
-	u8 index;
+	int index;
 
 	hci_len = gdm_dev16_to_cpu(endian, multi_sdu->len);
 	num_packet = gdm_dev16_to_cpu(endian, multi_sdu->num_packet);
@@ -717,13 +717,13 @@ static void gdm_lte_multi_sdu_pkt(struct phy_dev *phy_dev, char *buf, int len)
 		}
 
 		index = find_dev_index(nic_type);
-		if (index < MAX_NIC_TYPE) {
-			dev = phy_dev->dev[index];
-			gdm_lte_netif_rx(dev, (char *)sdu->data,
-					 (int)(hci_len - 12), nic_type);
-		} else {
+		if (index < 0) {
 			pr_err("rx sdu invalid nic_type :%x\n", nic_type);
+			return;
 		}
+		dev = phy_dev->dev[index];
+		gdm_lte_netif_rx(dev, (char *)sdu->data,
+				 (int)(hci_len - 12), nic_type);
 
 		data += ((hci_len + 3) & 0xfffc) + HCI_HEADER_SIZE;
 	}
@@ -763,7 +763,7 @@ static int gdm_lte_receive_pkt(struct phy_dev *phy_dev, char *buf, int len)
 	int ret = 0;
 	u16 cmd_evt;
 	u32 nic_type;
-	u8 index;
+	int index;
 
 	if (!len)
 		return ret;
@@ -779,6 +779,8 @@ static int gdm_lte_receive_pkt(struct phy_dev *phy_dev, char *buf, int len)
 		sdu = (struct sdu *)hci->data;
 		nic_type = gdm_dev32_to_cpu(endian, sdu->nic_type);
 		index = find_dev_index(nic_type);
+		if (index < 0)
+			return index;
 		dev = phy_dev->dev[index];
 		gdm_lte_netif_rx(dev, hci->data, len, nic_type);
 		break;
@@ -794,6 +796,8 @@ static int gdm_lte_receive_pkt(struct phy_dev *phy_dev, char *buf, int len)
 		pdn_table = (struct hci_pdn_table_ind *)buf;
 		nic_type = gdm_dev32_to_cpu(endian, pdn_table->nic_type);
 		index = find_dev_index(nic_type);
+		if (index < 0)
+			return index;
 		dev = phy_dev->dev[index];
 		gdm_lte_pdn_table(dev, buf, len);
 		/* Fall through */
