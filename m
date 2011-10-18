From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Oct 2011 06:26:21 +0000
Subject: [patch 1/2] gpio-pch: add an __iomem anotation
Message-Id: <20111018062621.GN27732@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Adding an __iomem anotation here silences some Sparse warnings.

drivers/gpio/gpio-pch.c:246:24: warning: incorrect type in assignment (different address spaces)
drivers/gpio/gpio-pch.c:246:24:    expected unsigned int [usertype] *im_reg
drivers/gpio/gpio-pch.c:246:24:    got unsigned int [noderef] <asn:2>*<noident>
drivers/gpio/gpio-pch.c:249:24: warning: incorrect type in assignment (different address spaces)
drivers/gpio/gpio-pch.c:249:24:    expected unsigned int [usertype] *im_reg
drivers/gpio/gpio-pch.c:249:24:    got unsigned int [noderef] <asn:2>*<noident>
drivers/gpio/gpio-pch.c:282:23: warning: incorrect type in argument 1 (different address spaces)
drivers/gpio/gpio-pch.c:282:23:    expected void [noderef] <asn:2>*<noident>
drivers/gpio/gpio-pch.c:282:23:    got unsigned int [usertype] *im_reg
drivers/gpio/gpio-pch.c:283:47: warning: incorrect type in argument 2 (different address spaces)
drivers/gpio/gpio-pch.c:283:47:    expected void [noderef] <asn:2>*<noident>
drivers/gpio/gpio-pch.c:283:47:    got unsigned int [usertype] *im_reg

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 596e454..4068084 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -231,7 +231,7 @@ static void pch_gpio_setup(struct pch_gpio *chip)
 static int pch_irq_type(struct irq_data *d, unsigned int type)
 {
 	u32 im;
-	u32 *im_reg;
+	u32 __iomem *im_reg;
 	u32 ien;
 	u32 im_pos;
 	int ch;
