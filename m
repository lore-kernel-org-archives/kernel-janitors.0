From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 10:17:05 +0000
Subject: [PATCH 1/5] gtp: Use kmalloc_array() in gtp_hashtable_new()
Message-Id: <b723e4d3-222b-6dd1-0223-2398536e4d1c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <698070a4-e08e-78e5-0214-df69783cce22@users.sourceforge.net>
In-Reply-To: <698070a4-e08e-78e5-0214-df69783cce22@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, "David S. Miller" <davem@davemloft.net>, Harald Welte <laforge@gnumonks.org>, Johannes Berg <johannes.berg@intel.com>, Pablo Neira <pablo@netfilter.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 25 Jan 2017 22:01:00 +0100

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data structures by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/gtp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/gtp.c b/drivers/net/gtp.c
index 8b6810bad54b..5d0d520ae40f 100644
--- a/drivers/net/gtp.c
+++ b/drivers/net/gtp.c
@@ -783,11 +783,13 @@ static int gtp_hashtable_new(struct gtp_dev *gtp, int hsize)
 {
 	int i;
 
-	gtp->addr_hash = kmalloc(sizeof(struct hlist_head) * hsize, GFP_KERNEL);
+	gtp->addr_hash = kmalloc_array(hsize, sizeof(*gtp->addr_hash),
+				       GFP_KERNEL);
 	if (gtp->addr_hash = NULL)
 		return -ENOMEM;
 
-	gtp->tid_hash = kmalloc(sizeof(struct hlist_head) * hsize, GFP_KERNEL);
+	gtp->tid_hash = kmalloc_array(hsize, sizeof(*gtp->tid_hash),
+				      GFP_KERNEL);
 	if (gtp->tid_hash = NULL)
 		goto err1;
 
-- 
2.11.0

