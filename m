From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 30 May 2020 13:35:37 +0000
Subject: [PATCH v2] crypto: cavium/nitrox - Fix 'nitrox_get_first_device()' when ndevlist is fully iterated
Message-Id: <20200530133537.582843-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: herbert@gondor.apana.org.au, davem@davemloft.net, phemadri@marvell.com, jsrikanth@marvell.com, horia.geanta@nxp.com, gustavo@embeddedor.com
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

When a list is completely iterated with 'list_for_each_entry(x, ...)', x is
not NULL at the end.

While at it, remove a useless initialization of the ndev variable. It
is overridden by 'list_for_each_entry'.

Fixes: f2663872f073 ("crypto: cavium - Register the CNN55XX supported crypto algorithms.")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: Do not introduce an extra variable to check if the list has been fully
    iterated. Test with "if (&ndev->list = &ndevlist)" instead
---
 drivers/crypto/cavium/nitrox/nitrox_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/cavium/nitrox/nitrox_main.c b/drivers/crypto/cavium/nitrox/nitrox_main.c
index 788c6607078b..cee2a2713038 100644
--- a/drivers/crypto/cavium/nitrox/nitrox_main.c
+++ b/drivers/crypto/cavium/nitrox/nitrox_main.c
@@ -278,7 +278,7 @@ static void nitrox_remove_from_devlist(struct nitrox_device *ndev)
 
 struct nitrox_device *nitrox_get_first_device(void)
 {
-	struct nitrox_device *ndev = NULL;
+	struct nitrox_device *ndev;
 
 	mutex_lock(&devlist_lock);
 	list_for_each_entry(ndev, &ndevlist, list) {
@@ -286,7 +286,7 @@ struct nitrox_device *nitrox_get_first_device(void)
 			break;
 	}
 	mutex_unlock(&devlist_lock);
-	if (!ndev)
+	if (&ndev->list = &ndevlist)
 		return NULL;
 
 	refcount_inc(&ndev->refcnt);
-- 
2.25.1
