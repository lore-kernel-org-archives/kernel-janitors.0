From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 13:08:31 +0000
Subject: [PATCH] net: hns3: typo in the name of a constant
Message-Id: <20190721130831.16330-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yisen.zhuang@huawei.com, salil.mehta@huawei.com, davem@davemloft.net, tanhuazhong@huawei.com, lipeng321@huawei.com, shenjian15@huawei.com, liuzhongzhu@huawei.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

All constant in 'enum HCLGE_MBX_OPCODE' start with HCLGE, except
'HLCGE_MBX_PUSH_VLAN_INFO' (C and L switched)

s/HLC/HCL/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/hisilicon/hns3/hclge_mbx.h          | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c   | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hclge_mbx.h b/drivers/net/ethernet/hisilicon/hns3/hclge_mbx.h
index 8ad5292eebbe..75329ab775a6 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hclge_mbx.h
+++ b/drivers/net/ethernet/hisilicon/hns3/hclge_mbx.h
@@ -43,7 +43,7 @@ enum HCLGE_MBX_OPCODE {
 	HCLGE_MBX_GET_QID_IN_PF,	/* (VF -> PF) get queue id in pf */
 	HCLGE_MBX_LINK_STAT_MODE,	/* (PF -> VF) link mode has changed */
 	HCLGE_MBX_GET_LINK_MODE,	/* (VF -> PF) get the link mode of pf */
-	HLCGE_MBX_PUSH_VLAN_INFO,	/* (PF -> VF) push port base vlan */
+	HCLGE_MBX_PUSH_VLAN_INFO,	/* (PF -> VF) push port base vlan */
 	HCLGE_MBX_GET_MEDIA_TYPE,       /* (VF -> PF) get media type */
 
 	HCLGE_MBX_GET_VF_FLR_STATUS = 200, /* (M7 -> PF) get vf reset status */
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c
index 64578e96b2e2..d1f5ccee79d3 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_mbx.c
@@ -300,7 +300,7 @@ int hclge_push_vf_port_base_vlan_info(struct hclge_vport *vport, u8 vfid,
 	memcpy(&msg_data[6], &vlan_tag, sizeof(u16));
 
 	return hclge_send_mbx_msg(vport, msg_data, sizeof(msg_data),
-				  HLCGE_MBX_PUSH_VLAN_INFO, vfid);
+				  HCLGE_MBX_PUSH_VLAN_INFO, vfid);
 }
 
 static int hclge_set_vf_vlan_cfg(struct hclge_vport *vport,
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c
index 30f2e9352cf3..2bf6ace289ff 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_mbx.c
@@ -203,7 +203,7 @@ void hclgevf_mbx_handler(struct hclgevf_dev *hdev)
 		case HCLGE_MBX_LINK_STAT_CHANGE:
 		case HCLGE_MBX_ASSERTING_RESET:
 		case HCLGE_MBX_LINK_STAT_MODE:
-		case HLCGE_MBX_PUSH_VLAN_INFO:
+		case HCLGE_MBX_PUSH_VLAN_INFO:
 			/* set this mbx event as pending. This is required as we
 			 * might loose interrupt event when mbx task is busy
 			 * handling. This shall be cleared when mbx task just
@@ -306,7 +306,7 @@ void hclgevf_mbx_async_handler(struct hclgevf_dev *hdev)
 			hclgevf_reset_task_schedule(hdev);
 
 			break;
-		case HLCGE_MBX_PUSH_VLAN_INFO:
+		case HCLGE_MBX_PUSH_VLAN_INFO:
 			state = le16_to_cpu(msg_q[1]);
 			vlan_info = &msg_q[1];
 			hclgevf_update_port_base_vlan_info(hdev, state,
-- 
2.20.1
