From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 02 Apr 2018 16:59:42 +0000
Subject: [PATCH 1/2] iio: sca3000: Fix an error handling path in 'sca3000_probe()'
Message-Id: <20180402165942.9056-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, nfarnesi4@gmail.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of error, we must undo the previous 'sca3000_configure_ring()' call
in order to free some memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iio/accel/sca3000.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/accel/sca3000.c b/drivers/iio/accel/sca3000.c
index f33dadf7b262..dae4c594c170 100644
--- a/drivers/iio/accel/sca3000.c
+++ b/drivers/iio/accel/sca3000.c
@@ -1496,7 +1496,7 @@ static int sca3000_probe(struct spi_device *spi)
 					   "sca3000",
 					   indio_dev);
 		if (ret)
-			return ret;
+			goto error_unconfigure_ring;
 	}
 	indio_dev->setup_ops = &sca3000_ring_setup_ops;
 	ret = sca3000_clean_setup(st);
@@ -1513,6 +1513,9 @@ static int sca3000_probe(struct spi_device *spi)
 	if (spi->irq)
 		free_irq(spi->irq, indio_dev);
 
+error_unconfigure_ring:
+	sca3000_unconfigure_ring(indio_dev);
+
 	return ret;
 }
 
-- 
2.14.1

