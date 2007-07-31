From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:21:58 +0000
Subject: [PATCH 15] kmalloc + memset conversion to kzalloc
Message-Id: <200707311921.58827.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/md/dm-emc.c | 8547 -> 8518 (-29 bytes)
 drivers/md/dm-emc.o | 107484 -> 107416 (-68 bytes)

 drivers/md/dm-emc.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/md/dm-emc.c	2007-07-26 13:07:41.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/md/dm-emc.c	2007-07-31 13:16:01.000000000 +0200
@@ -224,12 +224,11 @@ fail_path:

 static struct emc_handler *alloc_emc_handler(void)
 {
-	struct emc_handler *h = kmalloc(sizeof(*h), GFP_KERNEL);
+	struct emc_handler *h;

-	if (h) {
-		memset(h, 0, sizeof(*h));
+	h = kzalloc(sizeof(*h), GFP_KERNEL);
+	if (h)
 		spin_lock_init(&h->lock);
-	}

 	return h;
 }
