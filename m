From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 31 Aug 2019 12:29:11 +0000
Subject: [PATCH net-next] net: hns3: remove set but not used variable 'qos'
Message-Id: <20190831122911.181336-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, "David S . Miller" <davem@davemloft.net>, Salil Mehta <salil.mehta@huawei.com>, Yunsheng Lin <linyunsheng@huawei.com>, Zhongzhu Liu <liuzhongzhu@huawei.com>, Guangbin Huang <huangguangbin2@huawei.com>, Peng Li <lipeng321@huawei.com>, Huazhong Tan <tanhuazhong@huawei.com>, Jian Shen <shenjian15@huawei.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c: In function 'hclge_restore_vlan_table':
drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:8016:18: warning:
 variable 'qos' set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 70a214903da9 ("net: hns3: reduce the parameters of some functions")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index ce4b2280a8b0..2b65f2799846 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -8013,7 +8013,7 @@ static void hclge_restore_vlan_table(struct hnae3_handle *handle)
 	struct hclge_vport *vport = hclge_get_vport(handle);
 	struct hclge_vport_vlan_cfg *vlan, *tmp;
 	struct hclge_dev *hdev = vport->back;
-	u16 vlan_proto, qos;
+	u16 vlan_proto;
 	u16 state, vlan_id;
 	int i;
 
@@ -8022,7 +8022,6 @@ static void hclge_restore_vlan_table(struct hnae3_handle *handle)
 		vport = &hdev->vport[i];
 		vlan_proto = vport->port_base_vlan_cfg.vlan_info.vlan_proto;
 		vlan_id = vport->port_base_vlan_cfg.vlan_info.vlan_tag;
-		qos = vport->port_base_vlan_cfg.vlan_info.qos;
 		state = vport->port_base_vlan_cfg.state;
 
 		if (state != HNAE3_PORT_BASE_VLAN_DISABLE) {
