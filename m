From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 09:00:09 +0000
Subject: [PATCH 1/4] ATM-ZeitNet: Use kmalloc_array() in start_tx()
Message-Id: <4c3bc3b9-3bca-6a79-8093-1ee8d0c3ec8b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0b5381e1-d725-0706-1cc0-188df6c201f2@users.sourceforge.net>
In-Reply-To: <0b5381e1-d725-0706-1cc0-188df6c201f2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, Chas Williams <3chas3@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 09:55:53 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/atm/zatm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/atm/zatm.c b/drivers/atm/zatm.c
index cecfb94..d378ff2 100644
--- a/drivers/atm/zatm.c
+++ b/drivers/atm/zatm.c
@@ -998,8 +998,9 @@ static int start_tx(struct atm_dev *dev)
 
 	DPRINTK("start_tx\n");
 	zatm_dev = ZATM_DEV(dev);
-	zatm_dev->tx_map = kmalloc(sizeof(struct atm_vcc *)*
-	    zatm_dev->chans,GFP_KERNEL);
+	zatm_dev->tx_map = kmalloc_array(zatm_dev->chans,
+					 sizeof(*zatm_dev->tx_map),
+					 GFP_KERNEL);
 	if (!zatm_dev->tx_map) return -ENOMEM;
 	zatm_dev->tx_bw = ATM_OC3_PCR;
 	zatm_dev->free_shapers = (1 << NR_SHAPERS)-1;
-- 
2.10.0

