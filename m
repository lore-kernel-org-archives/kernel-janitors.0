From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Dec 2020 08:38:04 +0000
Subject: [PATCH net] qlcnic: Fix error code in probe
Message-Id: <X9nHbMqEyI/xPfGd@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shahed Shaikh <shshaikh@marvell.com>, Sony Chacko <sony.chacko@qlogic.com>
Cc: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Sucheta Chakraborty <sucheta.chakraborty@qlogic.com>, Sritej Velaga <sritej.velaga@qlogic.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Return -EINVAL if we can't find the correct device.  Currently it
returns success.

Fixes: 13159183ec7a ("qlcnic: 83xx base driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
index 5a7e240fd469..c2faf96fcade 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_main.c
@@ -2492,6 +2492,7 @@ qlcnic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		qlcnic_sriov_vf_register_map(ahw);
 		break;
 	default:
+		err = -EINVAL;
 		goto err_out_free_hw_res;
 	}
 
-- 
2.29.2
