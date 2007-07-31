From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:29:36 +0000
Subject: [PATCH 19] drivers/md/dm-target.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311929.36290.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/md/dm-target.c | 3300 -> 3271 (-29 bytes)
 drivers/md/dm-target.o | 105641 -> 105449 (-192 bytes)

 drivers/md/dm-target.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/md/dm-target.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/md/dm-target.c	2007-07-31 11:26:04.000000000 +0200
@@ -88,12 +88,11 @@ void dm_put_target_type(struct target_ty

 static struct tt_internal *alloc_target(struct target_type *t)
 {
-	struct tt_internal *ti = kmalloc(sizeof(*ti), GFP_KERNEL);
-
-	if (ti) {
-		memset(ti, 0, sizeof(*ti));
+	struct tt_internal *ti;
+
+	ti = kzalloc(sizeof(*ti), GFP_KERNEL);
+	if (ti)
 		ti->tt = *t;
-	}

 	return ti;
 }
