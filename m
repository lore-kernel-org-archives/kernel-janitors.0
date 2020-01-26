From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 26 Jan 2020 10:25:40 +0000
Subject: [PATCH] ionic: Fix rx queue allocation in 'ionic_lif_alloc()'
Message-Id: <20200126102540.14812-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: snelson@pensando.io, drivers@pensando.io, jakub.kicinski@netronome.com, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The 'struct ionic' has a 'nrxqs_per_lif' field. So use it instead of
using two times the value of 'ntxqs_per_lif'.

Note that with the current implementation, this patch is a no-op because
both fields are set to the same value in 'ionic_lifs_size()' which
is called before reaching 'ionic_lif_alloc()'.

However, it is more future-proof.

Fixes: 1a58e196467f ("ionic: Add basic lif support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Another alternative could be to use 'alloc_etherdev_mq()' if really using
the same value for both fields is what is expected.
---
 drivers/net/ethernet/pensando/ionic/ionic_lif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_lif.c b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
index 60fd14df49d7..96d3b3e993ad 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_lif.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_lif.c
@@ -1663,7 +1663,7 @@ static struct ionic_lif *ionic_lif_alloc(struct ionic *ionic, unsigned int index
 	int err;
 
 	netdev = alloc_etherdev_mqs(sizeof(*lif),
-				    ionic->ntxqs_per_lif, ionic->ntxqs_per_lif);
+				    ionic->ntxqs_per_lif, ionic->nrxqs_per_lif);
 	if (!netdev) {
 		dev_err(dev, "Cannot allocate netdev, aborting\n");
 		return ERR_PTR(-ENOMEM);
-- 
2.20.1
