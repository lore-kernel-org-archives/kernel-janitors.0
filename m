From: Kumar Amit Mehta <gmate.amit@gmail.com>
Date: Sun, 17 Feb 2013 06:54:58 +0000
Subject: [PATCH] staging: comedi: drivers: addi-data: hwdrv_apci3200.c: Add a missing semicolon
Message-Id: <1361084099-12776-1-git-send-email-gmate.amit@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: abbotti@mev.co.uk
Cc: fmhess@users.sourceforge.net, gregkh@linuxfoundation.org, hsweeten@visionengravers.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

fix for missing end-of-statement by adding a semicolon

Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
---
 .../comedi/drivers/addi-data/hwdrv_apci3200.c      |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c
index 829af18..c790873 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c
@@ -633,7 +633,7 @@ static int apci3200_do_insn_bits(struct comedi_device *dev,
 	s->state = inl(devpriv->i_IobaseAddon) & 0xf;
 	if (mask) {
 		s->state &= ~mask;
-		s->state |= (bits & mask)
+		s->state |= (bits & mask);
 
 		outl(s->state, devpriv->i_IobaseAddon);
 	}
-- 
1.7.9.5

