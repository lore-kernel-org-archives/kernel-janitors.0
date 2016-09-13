From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 20:50:01 +0000
Subject: [PATCH 7/7] AGPGART-UniNorth: Delete an unnecessary check in uninorth_create_gatt_table()
Message-Id: <6565fead-21c0-59d6-2a81-fd5084123d66@users.sourceforge.net>
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
Date: Tue, 13 Sep 2016 22:15:56 +0200

The check for the local variable "table" is unnecessary at the end
of this function because the corresponding source code place should only
be reached with a non-zero pointer for it after a failed call of the
function "kmalloc_array".
Thus remove it.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/agp/uninorth-agp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/char/agp/uninorth-agp.c b/drivers/char/agp/uninorth-agp.c
index 8b1eb72..657cf17 100644
--- a/drivers/char/agp/uninorth-agp.c
+++ b/drivers/char/agp/uninorth-agp.c
@@ -438,8 +438,7 @@ static int uninorth_create_gatt_table(struct agp_bridge_data *bridge)
 	return 0;
  free_page_array:
 	kfree(uninorth_priv.pages_arr);
-	if (table)
-		free_pages((unsigned long)table, page_order);
+	free_pages((unsigned long)table, page_order);
 	return -ENOMEM;
 }
 
-- 
2.10.0

