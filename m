From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 Apr 2016 09:03:31 +0000
Subject: [patch] iio: dac: ad5592r: Off by one bug in ad5592r_alloc_channels()
Message-Id: <20160429090330.GB18656@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars-Peter Clausen <lars@metafoo.de>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The > here should be >= or we go beyond the end for the array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index 948f600..69bde59 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -525,7 +525,7 @@ static int ad5592r_alloc_channels(struct ad5592r_state *st)
 
 	device_for_each_child_node(st->dev, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg);
-		if (ret || reg > ARRAY_SIZE(st->channel_modes))
+		if (ret || reg >= ARRAY_SIZE(st->channel_modes))
 			continue;
 
 		ret = fwnode_property_read_u32(child, "adi,mode", &tmp);
