From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 22:05:24 +0000
Subject: [PATCH 72] drivers/mmc/core/sdio_bus.c: kmalloc + memset conversion to kzalloc
Message-Id: <200708010005.25352.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, drzeus-mmc@drzeus.cx

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/mmc/core/sdio_bus.c | 5528 -> 5483 (-45 bytes)
 drivers/mmc/core/sdio_bus.o | 70044 -> 69876 (-168 bytes)

 drivers/mmc/core/sdio_bus.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/mmc/core/sdio_bus.c	2007-07-26 13:07:43.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/mmc/core/sdio_bus.c	2007-07-30 00:22:42.000000000 +0200
@@ -203,12 +203,10 @@ struct sdio_func *sdio_alloc_func(struct
 {
 	struct sdio_func *func;

-	func = kmalloc(sizeof(struct sdio_func), GFP_KERNEL);
+	func = kzalloc(sizeof(struct sdio_func), GFP_KERNEL);
 	if (!func)
 		return ERR_PTR(-ENOMEM);

-	memset(func, 0, sizeof(struct sdio_func));
-
 	func->card = card;

 	device_initialize(&func->dev);
