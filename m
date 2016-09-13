From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 20:48:40 +0000
Subject: [PATCH 6/7] AGPGART-UniNorth: Rename a jump label in uninorth_create_gatt_table()
Message-Id: <80f991d3-895d-d737-c085-e1e93a44c8a4@users.sourceforge.net>
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
Date: Tue, 13 Sep 2016 22:00:19 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/char/agp/uninorth-agp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/char/agp/uninorth-agp.c b/drivers/char/agp/uninorth-agp.c
index 8d144cd..8b1eb72 100644
--- a/drivers/char/agp/uninorth-agp.c
+++ b/drivers/char/agp/uninorth-agp.c
@@ -406,7 +406,7 @@ static int uninorth_create_gatt_table(struct agp_bridge_data *bridge)
 						sizeof(*uninorth_priv.pages_arr),
 						GFP_KERNEL);
 	if (uninorth_priv.pages_arr = NULL)
-		goto enomem;
+		goto free_page_array;
 
 	table_end = table + ((PAGE_SIZE * (1 << page_order)) - 1);
 
@@ -436,8 +436,7 @@ static int uninorth_create_gatt_table(struct agp_bridge_data *bridge)
 		bridge->gatt_table[i] = scratch_value;
 
 	return 0;
-
-enomem:
+ free_page_array:
 	kfree(uninorth_priv.pages_arr);
 	if (table)
 		free_pages((unsigned long)table, page_order);
-- 
2.10.0

