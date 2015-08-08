From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Aug 2015 19:16:42 +0000
Subject: [patch] iio: accel: sca3000: memory corruption in sca3000_read_first_n_hw_rb()
Message-Id: <20150808191642.GD8034@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald <pmeerw@pmeerw.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Octavian Purdila <octavian.purdila@intel.com>, Aybuke Ozdemir <aybuke.147@gmail.com>, Josselin Costanzi <josselin.costanzi@mobile-devices.fr>, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

"num_read" is in byte units but we are write u16s so we end up write
twice as much as intended.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/iio/accel/sca3000_ring.c b/drivers/staging/iio/accel/sca3000_ring.c
index 23685e7..bd2c69f 100644
--- a/drivers/staging/iio/accel/sca3000_ring.c
+++ b/drivers/staging/iio/accel/sca3000_ring.c
@@ -116,7 +116,7 @@ static int sca3000_read_first_n_hw_rb(struct iio_buffer *r,
 	if (ret)
 		goto error_ret;
 
-	for (i = 0; i < num_read; i++)
+	for (i = 0; i < num_read / sizeof(u16); i++)
 		*(((u16 *)rx) + i) = be16_to_cpup((__be16 *)rx + i);
 
 	if (copy_to_user(buf, rx, num_read))
