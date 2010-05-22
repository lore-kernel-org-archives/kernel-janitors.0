From: Dan Carpenter <error27@gmail.com>
Date: Sat, 22 May 2010 20:16:26 +0000
Subject: [patch] mtd/sst25l: check for null consistently
Message-Id: <20100522201626.GJ22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>, kernel-janitors@vger.kernel.org, H Hartley Sweeten <hsweeten@visionengravers.com>, Andre Renaud <andre@bluewatersys.com>, linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>

The rest of the function assumes that "data" can be null.  I don't know
the code well enough to say whether it can actually be null, but there 
is no harm in checking here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index ab5d8cd..684247a 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -454,7 +454,7 @@ static int __init sst25l_probe(struct spi_device *spi)
 						  parts, nr_parts);
 		}
 
-	} else if (data->nr_parts) {
+	} else if (data && data->nr_parts) {
 		dev_warn(&spi->dev, "ignoring %d default partitions on %s\n",
 			 data->nr_parts, data->name);
 	}
