From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 26 Sep 2010 09:58:28 +0000
Subject: [PATCH 8/9] staging: slicoss: use free_netdev(netdev) instead of kfree()
Message-Id: <1285495108-22196-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Denis Kirjanov <dkirjanov@kernel.org>, Kulikov Vasiliy <segooon@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jiri Pirko <jpirko@redhat.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Freeing netdev without free_netdev() leads to net, tx leaks.
I might lead to dereferencing freed pointer.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

@@
struct net_device* dev;
@@

-kfree(dev)
+free_netdev(dev)
---
 Compile tested.

 drivers/staging/slicoss/slicoss.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/slicoss/slicoss.c b/drivers/staging/slicoss/slicoss.c
index 58ff123..18f1103 100644
--- a/drivers/staging/slicoss/slicoss.c
+++ b/drivers/staging/slicoss/slicoss.c
@@ -3233,7 +3233,7 @@ static void __devexit slic_entry_remove(struct pci_dev *pcidev)
 		slic_global.num_slic_cards--;
 		slic_card_cleanup(card);
 	}
-	kfree(dev);
+	free_netdev(dev);
 	pci_release_regions(pcidev);
 }
 
-- 
1.7.0.4

