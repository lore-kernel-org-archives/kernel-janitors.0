From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 23 Jan 2018 02:10:46 +0000
Subject: [PATCH net-next] net: aquantia: Fix error return code in aq_pci_probe()
Message-Id: <1516673446-170729-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Arcari <darcari@redhat.com>, Colin Ian King <colin.king@canonical.com>, David VomLehn <vomlehn@texas.net>, Igor Russkikh <igor.russkikh@aquantia.com>, Pavel Belous <pavel.belous@aquantia.com>, Dmitrii Tarakanov <Dmitrii.Tarakanov@aquantia.com>, Alexander Loktionov <Alexander.Loktionov@aquantia.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return error code -ENOMEM from the aq_ndev_alloc() error
handling case instead of 0, as done elsewhere in this function.

Fixes: 23ee07ad3c2f ("net: aquantia: Cleanup pci functions module")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
index f5dd5f7..5cf3542 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_pci_func.c
@@ -210,8 +210,10 @@ static int aq_pci_probe(struct pci_dev *pdev,
 		goto err_pci_func;
 
 	ndev = aq_ndev_alloc();
-	if (!ndev)
+	if (!ndev) {
+		err = -ENOMEM;
 		goto err_ndev;
+	}
 
 	self = netdev_priv(ndev);
 	self->pdev = pdev;

