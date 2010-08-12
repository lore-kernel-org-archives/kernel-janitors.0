From: Dan Carpenter <error27@gmail.com>
Date: Thu, 12 Aug 2010 07:58:27 +0000
Subject: [patch 2/2] mtd/m25p80: fix test for end of loop
Message-Id: <20100812075827.GO645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, Mike Frysinger <vapier@gentoo.org>, Anton Vorontsov <avorontsov@mvista.com>, kernel-janitors@vger.kernel.org, Gabor Juhos <juhosg@openwrt.org>, linux-mtd@lists.infradead.org

"plat_id" is always non-NULL here.  There is a zero element on the end
of the m25p_ids[] array and if we hit the end of the loop then plat_id
points to that.

This would lead to a NULL pointer dereference later on in the function.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 83c9086..6f512b5 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -793,7 +793,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
 			break;
 		}
 
-		if (plat_id)
+		if (i < ARRAY_SIZE(m25p_ids) - 1)
 			id = plat_id;
 		else
 			dev_warn(&spi->dev, "unrecognized id %s\n", data->type);
