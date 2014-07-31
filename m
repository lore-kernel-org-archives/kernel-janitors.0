From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Jul 2014 10:39:36 +0000
Subject: re: pinctrl: Add pinctrl-s3c24xx driver
Message-Id: <20140731103936.GA7194@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Heiko Stuebner,

The patch af99a7507469: "pinctrl: Add pinctrl-s3c24xx driver" from
May 21, 2013, leads to the following static checker warning:

	drivers/pinctrl/samsung/pinctrl-s3c24xx.c:188 s3c24xx_eint_type()
	warn: are you sure the precedence is correct here?

drivers/pinctrl/samsung/pinctrl-s3c24xx.c
   186          /* Set up interrupt trigger */
   187          reg = d->virt_base + EINT_REG(index);
   188          shift = EINT_OFFS(index);
   189  

EINT_OFFS() is defined with two different precedences.  One of them is
probably wrong and it's probably this one here that does the MOD
operation first followed by the multiply.

#define EINT_OFFS(i) ((i) % EINT_MAX_PER_GROUP * 4)
#define EINT_OFFS(i) ((i) % (2 * EINT_MAX_PER_GROUP))

regards,
dan carpenter
