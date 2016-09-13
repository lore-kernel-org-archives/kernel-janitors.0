From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 20:47:33 +0000
Subject: [PATCH 5/7] AGPGART-UniNorth: Use kmalloc_array() in uninorth_create_gatt_table()
Message-Id: <f112cc49-d8f4-a682-6817-87cdb5bed176@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5204ca92-2cdf-8115-567c-4ac29816fcec@users.sourceforge.net>
In-Reply-To: <5204ca92-2cdf-8115-567c-4ac29816fcec@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 21:50:44 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/agp/uninorth-agp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/char/agp/uninorth-agp.c b/drivers/char/agp/uninorth-agp.c
index fdced54..8d144cd 100644
--- a/drivers/char/agp/uninorth-agp.c
+++ b/drivers/char/agp/uninorth-agp.c
@@ -402,7 +402,9 @@ static int uninorth_create_gatt_table(struct agp_bridge_data *bridge)
 	if (table = NULL)
 		return -ENOMEM;
 
-	uninorth_priv.pages_arr = kmalloc((1 << page_order) * sizeof(struct page*), GFP_KERNEL);
+	uninorth_priv.pages_arr = kmalloc_array(1 << page_order,
+						sizeof(*uninorth_priv.pages_arr),
+						GFP_KERNEL);
 	if (uninorth_priv.pages_arr = NULL)
 		goto enomem;
 
-- 
2.10.0

