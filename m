From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:26:32 +0000
Subject: [PATCH 18] drivers/md/dm-table.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311926.33125.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/md/dm-table.c | 21698 -> 21664 (-34 bytes)
 drivers/md/dm-table.o | 132153 -> 132093 (-60 bytes)

 drivers/md/dm-table.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/md/dm-table.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/md/dm-table.c	2007-07-31 13:19:43.000000000 +0200
@@ -213,12 +213,12 @@ static int alloc_targets(struct dm_table
 int dm_table_create(struct dm_table **result, int mode,
 		    unsigned num_targets, struct mapped_device *md)
 {
-	struct dm_table *t = kmalloc(sizeof(*t), GFP_KERNEL);
-
+	struct dm_table *t;
+
+	t = kzalloc(sizeof(*t), GFP_KERNEL);
 	if (!t)
 		return -ENOMEM;

-	memset(t, 0, sizeof(*t));
 	INIT_LIST_HEAD(&t->devices);
 	atomic_set(&t->holders, 1);

@@ -229,7 +229,6 @@ int dm_table_create(struct dm_table **re

 	if (alloc_targets(t, num_targets)) {
 		kfree(t);
-		t = NULL;
 		return -ENOMEM;
 	}

