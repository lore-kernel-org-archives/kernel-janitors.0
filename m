From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 17:53:16 +0000
Subject: [PATCH 29] drivers/mmc/core/host.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707311953.17224.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, drzeus-mmc@drzeus.cx

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/mmc/core/host.c | 3509 -> 3457 (-52 bytes)
 drivers/mmc/core/host.o | 92400 -> 92136 (-264 bytes)

 drivers/mmc/core/host.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/mmc/core/host.c	2007-07-26 13:07:43.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/mmc/core/host.c	2007-07-30 00:22:12.000000000 +0200
@@ -58,12 +58,10 @@ struct mmc_host *mmc_alloc_host(int extr
 {
 	struct mmc_host *host;

-	host = kmalloc(sizeof(struct mmc_host) + extra, GFP_KERNEL);
+	host = kzalloc(sizeof(struct mmc_host) + extra, GFP_KERNEL);
 	if (!host)
 		return NULL;

-	memset(host, 0, sizeof(struct mmc_host) + extra);
-
 	host->parent = dev;
 	host->class_dev.parent = dev;
 	host->class_dev.class = &mmc_host_class;
