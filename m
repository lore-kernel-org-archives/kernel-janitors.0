From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Tue, 31 Jul 2007 18:50:13 +0000
Subject: [PATCH 49] drivers/mmc/core/mmc_ops.c: kmalloc + memset conversion to kzalloc
Message-Id: <200707312050.13687.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>
In-Reply-To: <200707311845.48807.m.kozlowski@tuxland.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, drzeus-mmc@drzeus.cx

Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>

 drivers/mmc/core/mmc_ops.c | 7957 -> 7924 (-33 bytes)
 drivers/mmc/core/mmc_ops.o | 101732 -> 101744 (+12 bytes)

 drivers/mmc/core/mmc_ops.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-2.6.23-rc1-mm1-a/drivers/mmc/core/mmc_ops.c	2007-07-26 13:07:43.000000000 +0200
+++ linux-2.6.23-rc1-mm1-b/drivers/mmc/core/mmc_ops.c	2007-07-30 00:20:54.000000000 +0200
@@ -298,10 +298,9 @@ int mmc_lock_unlock(struct mmc_card *car
 		data_size = 2 + mpayload->datalen;
 	}

-	data_buf = kmalloc(data_size, GFP_KERNEL);
+	data_buf = kzalloc(data_size, GFP_KERNEL);
 	if (!data_buf)
 		return -ENOMEM;
-	memset(data_buf, 0, data_size);

 	data_buf[0] |= mode;
 	if (mode & MMC_LOCK_MODE_UNLOCK)
