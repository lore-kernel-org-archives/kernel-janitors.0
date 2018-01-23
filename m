From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 23 Jan 2018 02:10:27 +0000
Subject: [PATCH net-next] nfp: fix error return code in nfp_pci_probe()
Message-Id: <1516673427-170584-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jakub Kicinski <jakub.kicinski@netronome.com>, Simon Horman <simon.horman@netronome.com>, David Brunecz <david.brunecz@netronome.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, oss-drivers@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return error code -EINVAL instead of 0 when num_vfs above
limit_vfs, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/netronome/nfp/nfp_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_main.c b/drivers/net/ethernet/netronome/nfp/nfp_main.c
index c5b9104..cc570bb 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_main.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_main.c
@@ -518,6 +518,7 @@ static int nfp_pci_probe(struct pci_dev *pdev,
 		dev_err(&pdev->dev,
 			"Error: %d VFs already enabled, but loaded FW can only support %d\n",
 			pf->num_vfs, pf->limit_vfs);
+		err = -EINVAL;
 		goto err_fw_unload;
 	}

