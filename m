From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 08:06:27 +0000
Subject: [PATCH] net: hinic: remove redundant pointer pfhwdev
Message-Id: <20180704080627.16393-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aviad Krawczyk <aviad.krawczyk@huawei.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer pfhwdev is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'pfhwdev' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c b/drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c
index 79b567447084..6b19607a4caa 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_hw_dev.c
@@ -264,7 +264,6 @@ static int init_fw_ctxt(struct hinic_hwdev *hwdev)
 	struct hinic_hwif *hwif = hwdev->hwif;
 	struct pci_dev *pdev = hwif->pdev;
 	struct hinic_cmd_fw_ctxt fw_ctxt;
-	struct hinic_pfhwdev *pfhwdev;
 	u16 out_size;
 	int err;
 
@@ -276,8 +275,6 @@ static int init_fw_ctxt(struct hinic_hwdev *hwdev)
 	fw_ctxt.func_idx = HINIC_HWIF_FUNC_IDX(hwif);
 	fw_ctxt.rx_buf_sz = HINIC_RX_BUF_SZ;
 
-	pfhwdev = container_of(hwdev, struct hinic_pfhwdev, hwdev);
-
 	err = hinic_port_msg_cmd(hwdev, HINIC_PORT_CMD_FWCTXT_INIT,
 				 &fw_ctxt, sizeof(fw_ctxt),
 				 &fw_ctxt, &out_size);
-- 
2.17.1

