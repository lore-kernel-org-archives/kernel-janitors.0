From: Emil Gedda <emil.gedda@emilgedda.se>
Date: Tue, 03 Jan 2017 20:25:20 +0000
Subject: [PATCH] staging: gdm724x: cleanup long lines to conform to kernel coding style
Message-Id: <20170103202520.GA20568@emilgedda.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170103201002.GA18938@emilgedda.se>
In-Reply-To: <20170103201002.GA18938@emilgedda.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Refactor code to remove multi-line derefs and code duplication

Signed-off-by: Emil Gedda <emil.gedda@emilgedda.se>
---

Tried contacting the mentioned people in the relevant TODO, but after 2
weeks I still haven't received a response, thus sending this to you
directly. Error messages still need to be changed to use netdev_err, but
that's for another patch. Sorry for the spam, still new to this.

 drivers/staging/gdm724x/gdm_lte.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_lte.c b/drivers/staging/gdm724x/gdm_lte.c
index e72dfa9..a182757 100644
--- a/drivers/staging/gdm724x/gdm_lte.c
+++ b/drivers/staging/gdm724x/gdm_lte.c
@@ -688,6 +688,7 @@ static void gdm_lte_multi_sdu_pkt(struct phy_dev *phy_dev, char *buf, int len)
 	struct net_device *dev;
 	struct multi_sdu *multi_sdu = (struct multi_sdu *)buf;
 	struct sdu *sdu = NULL;
+	struct gdm_endian *endian = phy_dev->get_endian(phy_dev->priv_dev);
 	u8 *data = (u8 *)multi_sdu->data;
 	u16 i = 0;
 	u16 num_packet;
@@ -696,20 +697,15 @@ static void gdm_lte_multi_sdu_pkt(struct phy_dev *phy_dev, char *buf, int len)
 	u32 nic_type;
 	u8 index;
 
-	hci_len = gdm_dev16_to_cpu(phy_dev->get_endian(phy_dev->priv_dev),
-				   multi_sdu->len);
-	num_packet = gdm_dev16_to_cpu(phy_dev->get_endian(phy_dev->priv_dev),
-				      multi_sdu->num_packet);
+	hci_len = gdm_dev16_to_cpu(endian, multi_sdu->len);
+	num_packet = gdm_dev16_to_cpu(endian, multi_sdu->num_packet);
 
 	for (i = 0; i < num_packet; i++) {
 		sdu = (struct sdu *)data;
 
-		cmd_evt = gdm_dev16_to_cpu(phy_dev->
-				get_endian(phy_dev->priv_dev), sdu->cmd_evt);
-		hci_len = gdm_dev16_to_cpu(phy_dev->
-				get_endian(phy_dev->priv_dev), sdu->len);
-		nic_type = gdm_dev32_to_cpu(phy_dev->
-				get_endian(phy_dev->priv_dev), sdu->nic_type);
+		cmd_evt  = gdm_dev16_to_cpu(endian, sdu->cmd_evt);
+		hci_len  = gdm_dev16_to_cpu(endian, sdu->len);
+		nic_type = gdm_dev32_to_cpu(endian, sdu->nic_type);
 
 		if (cmd_evt != LTE_RX_SDU) {
 			pr_err("rx sdu wrong hci %04x\n", cmd_evt);
@@ -761,6 +757,7 @@ static int gdm_lte_receive_pkt(struct phy_dev *phy_dev, char *buf, int len)
 {
 	struct hci_packet *hci = (struct hci_packet *)buf;
 	struct hci_pdn_table_ind *pdn_table = (struct hci_pdn_table_ind *)buf;
+	struct gdm_endian *endian = phy_dev->get_endian(phy_dev->priv_dev);
 	struct sdu *sdu;
 	struct net_device *dev;
 	int ret = 0;
@@ -771,8 +768,7 @@ static int gdm_lte_receive_pkt(struct phy_dev *phy_dev, char *buf, int len)
 	if (!len)
 		return ret;
 
-	cmd_evt = gdm_dev16_to_cpu(phy_dev->get_endian(phy_dev->priv_dev),
-				   hci->cmd_evt);
+	cmd_evt = gdm_dev16_to_cpu(endian, hci->cmd_evt);
 
 	dev = phy_dev->dev[0];
 	if (!dev)
@@ -781,8 +777,7 @@ static int gdm_lte_receive_pkt(struct phy_dev *phy_dev, char *buf, int len)
 	switch (cmd_evt) {
 	case LTE_RX_SDU:
 		sdu = (struct sdu *)hci->data;
-		nic_type = gdm_dev32_to_cpu(phy_dev->
-				get_endian(phy_dev->priv_dev), sdu->nic_type);
+		nic_type = gdm_dev32_to_cpu(endian, sdu->nic_type);
 		index = find_dev_index(nic_type);
 		dev = phy_dev->dev[index];
 		gdm_lte_netif_rx(dev, hci->data, len, nic_type);
@@ -797,9 +792,7 @@ static int gdm_lte_receive_pkt(struct phy_dev *phy_dev, char *buf, int len)
 		break;
 	case LTE_PDN_TABLE_IND:
 		pdn_table = (struct hci_pdn_table_ind *)buf;
-		nic_type = gdm_dev32_to_cpu(phy_dev->
-				get_endian(phy_dev->priv_dev),
-				pdn_table->nic_type);
+		nic_type = gdm_dev32_to_cpu(endian, pdn_table->nic_type);
 		index = find_dev_index(nic_type);
 		dev = phy_dev->dev[index];
 		gdm_lte_pdn_table(dev, buf, len);
-- 
2.10.2

