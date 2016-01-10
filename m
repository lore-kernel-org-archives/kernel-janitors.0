From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 10 Jan 2016 07:20:16 +0000
Subject: [PATCH] [media] netup_unidvb: Remove a useless memset
Message-Id: <1452410416-6362-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: serjk@netup.ru, mchehab@osg.samsung.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This memory is allocated using kzalloc so there is no need to call
memset(..., 0, ...)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
index 525ebfe..d919080 100644
--- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
+++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
@@ -774,7 +774,6 @@ static int netup_unidvb_initdev(struct pci_dev *pci_dev,
 
 	if (!ndev)
 		goto dev_alloc_err;
-	memset(ndev, 0, sizeof(*ndev));
 	ndev->old_fw = old_firmware;
 	ndev->wq = create_singlethread_workqueue(NETUP_UNIDVB_NAME);
 	if (!ndev->wq) {
-- 
2.5.0

