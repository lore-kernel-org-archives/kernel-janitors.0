From: Colin King <colin.king@canonical.com>
Date: Thu, 20 Jun 2019 13:27:51 +0000
Subject: [PATCH][net-next] hinic: fix dereference of pointer hwdev before it is null checked
Message-Id: <20190620132751.26438-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xue Chaojing <xuechaojing@huawei.com>, Aviad Krawczyk <aviad.krawczyk@huawei.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently pointer hwdev is dereferenced when assigning hwif before
hwdev is null checked.  Fix this by only derefencing hwdev after the
null check.

Addresses-Coverity: ("Dereference before null check")
Fixes: 4fdc51bb4e92 ("hinic: add support for rss parameters with ethtool")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../net/ethernet/huawei/hinic/hinic_port.c    | 21 +++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_port.c b/drivers/net/ethernet/huawei/hinic/hinic_port.c
index 6b933962de46..1c3b3c0d6298 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_port.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_port.c
@@ -711,14 +711,17 @@ int hinic_get_rss_type(struct hinic_dev *nic_dev, u32 tmpl_idx,
 {
 	struct hinic_rss_context_table ctx_tbl = { 0 };
 	struct hinic_hwdev *hwdev = nic_dev->hwdev;
-	struct hinic_hwif *hwif = hwdev->hwif;
-	struct pci_dev *pdev = hwif->pdev;
+	struct hinic_hwif *hwif;
+	struct pci_dev *pdev;
 	u16 out_size = sizeof(ctx_tbl);
 	int err;
 
 	if (!hwdev || !rss_type)
 		return -EINVAL;
 
+	hwif = hwdev->hwif;
+	pdev = hwif->pdev;
+
 	ctx_tbl.func_id = HINIC_HWIF_FUNC_IDX(hwif);
 	ctx_tbl.template_id = tmpl_idx;
 
@@ -776,14 +779,17 @@ int hinic_rss_get_template_tbl(struct hinic_dev *nic_dev, u32 tmpl_idx,
 {
 	struct hinic_rss_template_key temp_key = { 0 };
 	struct hinic_hwdev *hwdev = nic_dev->hwdev;
-	struct hinic_hwif *hwif = hwdev->hwif;
-	struct pci_dev *pdev = hwif->pdev;
+	struct hinic_hwif *hwif;
+	struct pci_dev *pdev;
 	u16 out_size = sizeof(temp_key);
 	int err;
 
 	if (!hwdev || !temp)
 		return -EINVAL;
 
+	hwif = hwdev->hwif;
+	pdev = hwif->pdev;
+
 	temp_key.func_id = HINIC_HWIF_FUNC_IDX(hwif);
 	temp_key.template_id = tmpl_idx;
 
@@ -832,14 +838,17 @@ int hinic_rss_get_hash_engine(struct hinic_dev *nic_dev, u8 tmpl_idx, u8 *type)
 {
 	struct hinic_rss_engine_type hash_type = { 0 };
 	struct hinic_hwdev *hwdev = nic_dev->hwdev;
-	struct hinic_hwif *hwif = hwdev->hwif;
-	struct pci_dev *pdev = hwif->pdev;
+	struct hinic_hwif *hwif;
+	struct pci_dev *pdev;
 	u16 out_size = sizeof(hash_type);
 	int err;
 
 	if (!hwdev || !type)
 		return -EINVAL;
 
+	hwif = hwdev->hwif;
+	pdev = hwif->pdev;
+
 	hash_type.func_id = HINIC_HWIF_FUNC_IDX(hwif);
 	hash_type.template_id = tmpl_idx;
 
-- 
2.20.1
