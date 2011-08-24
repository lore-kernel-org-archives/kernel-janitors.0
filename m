From: Dan Carpenter <error27@gmail.com>
Date: Wed, 24 Aug 2011 11:29:22 +0000
Subject: [patch -next] bna: unlock on error path in pnad_pci_probe()
Message-Id: <20110824112922.GC5975@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasesh Mody <rmody@brocade.com>
Cc: Debashis Dutt <ddutt@brocade.com>, "open list:BROCADE BNA 10 GI..." <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

We introduced a new lock here, so there was error path which needs
an unlock now.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/ethernet/brocade/bna/bnad.c b/drivers/net/ethernet/brocade/bna/bnad.c
index bdfda07..6ad4b47 100644
--- a/drivers/net/ethernet/brocade/bna/bnad.c
+++ b/drivers/net/ethernet/brocade/bna/bnad.c
@@ -3167,7 +3167,7 @@ bnad_pci_probe(struct pci_dev *pdev,
 	 */
 	err = bnad_pci_init(bnad, pdev, &using_dac);
 	if (err)
-		goto free_netdev;
+		goto unlock_mutex;
 
 	/*
 	 * Initialize bnad structure
@@ -3296,9 +3296,9 @@ drv_uninit:
 	bnad_uninit(bnad);
 pci_uninit:
 	bnad_pci_uninit(pdev);
+unlock_mutex:
 	mutex_unlock(&bnad->conf_mutex);
 	bnad_lock_uninit(bnad);
-free_netdev:
 	free_netdev(netdev);
 	return err;
 }
