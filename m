From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 16:59:59 +0000
Subject: [PATCH 05] drivers/mmc/core/bus.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311900.00143.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, drzeus-mmc@drzeus.cx

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/mmc/core/bus.c | 5663 -> 5619 (-44 bytes)
 drivers/mmc/core/bus.o | 70899 -> 70731 (-168 bytes)

 drivers/mmc/core/bus.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/mmc/core/bus.c	2007-07-26 13:07:43.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/mmc/core/bus.c	2007-07-30 00:23:02.000000000 +0200
@@ -206,12 +206,10 @@ struct mmc_card *mmc_alloc_card(struct m
 {
 	struct mmc_card *card;

-	card = kmalloc(sizeof(struct mmc_card), GFP_KERNEL);
+	card = kzalloc(sizeof(struct mmc_card), GFP_KERNEL);
 	if (!card)
 		return ERR_PTR(-ENOMEM);

-	memset(card, 0, sizeof(struct mmc_card));
-
 	card->host = host;

 	device_initialize(&card->dev);
