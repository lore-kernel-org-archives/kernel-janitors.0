From: Colin King <colin.king@canonical.com>
Date: Wed, 21 Nov 2018 19:59:56 +0000
Subject: [PATCH][net-next] net: hinic: fix null pointer dereference on pointer hwdev
Message-Id: <20181121195956.2730-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aviad Krawczyk <aviad.krawczyk@huawei.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer hwdev is being dereferenced when declaring hwif , however, later
on hwdev is being null checked, hence we have dereference before null
check error. Fix this by assigning hwiw and pdef only once hwdev has
been null checked.

Detected by CoverityScan, CID#1485581 ("Dereference before null check")

Fixes: 4a61abb100c8 ("net-next/hinic:add rx checksum offload for HiNIC")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/huawei/hinic/hinic_port.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_port.c b/drivers/net/ethernet/huawei/hinic/hinic_port.c
index e9f76e904610..be2fdf3dfa87 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_port.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_port.c
@@ -414,14 +414,17 @@ int hinic_set_rx_csum_offload(struct hinic_dev *nic_dev, u32 en)
 {
 	struct hinic_checksum_offload rx_csum_cfg = {0};
 	struct hinic_hwdev *hwdev = nic_dev->hwdev;
-	struct hinic_hwif *hwif = hwdev->hwif;
-	struct pci_dev *pdev = hwif->pdev;
+	struct hinic_hwif *hwif;
+	struct pci_dev *pdev;
 	u16 out_size;
 	int err;
 
 	if (!hwdev)
 		return -EINVAL;
 
+	hwif = hwdev->hwif;
+	pdev = hwif->pdev;
+
 	rx_csum_cfg.func_id = HINIC_HWIF_FUNC_IDX(hwif);
 	rx_csum_cfg.rx_csum_offload = en;
 
-- 
2.19.1
