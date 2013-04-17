From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 17 Apr 2013 07:11:46 +0000
Subject: [patch] [media] dvb-frontends: lg2160: dubious one-bit signed bitfield
Message-Id: <20130417071146.GB7923@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Krufky <mkrufky@linuxtv.org>
Cc: Mauro Carvalho Chehab <mchehab@redhat.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Sparse complains that these are "dubious one-bit signed bitfields" and
the comment says it was intended to be 1 and 0 instead of -1 and 0.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/dvb-frontends/lg2160.h b/drivers/media/dvb-frontends/lg2160.h
index a5f0368..194a07a 100644
--- a/drivers/media/dvb-frontends/lg2160.h
+++ b/drivers/media/dvb-frontends/lg2160.h
@@ -57,10 +57,10 @@ struct lg2160_config {
 	u16 if_khz;
 
 	/* disable i2c repeater - 0:repeater enabled 1:repeater disabled */
-	int deny_i2c_rptr:1;
+	unsigned int deny_i2c_rptr:1;
 
 	/* spectral inversion - 0:disabled 1:enabled */
-	int spectral_inversion:1;
+	unsigned int spectral_inversion:1;
 
 	unsigned int output_if;
 	enum lg2160_spi_clock spi_clock;
