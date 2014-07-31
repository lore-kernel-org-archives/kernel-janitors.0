From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Date: Thu, 31 Jul 2014 11:34:04 +0000
Subject: Re: pinctrl: Add pinctrl-s3c24xx driver
Message-Id: <1812930.OGpzSztg9R@diego>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140731103936.GA7194@mwanda>
In-Reply-To: <20140731103936.GA7194@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

Am Donnerstag, 31. Juli 2014, 13:39:36 schrieb Dan Carpenter:
> Hello Heiko Stuebner,
> 
> The patch af99a7507469: "pinctrl: Add pinctrl-s3c24xx driver" from
> May 21, 2013, leads to the following static checker warning:
> 
> 	drivers/pinctrl/samsung/pinctrl-s3c24xx.c:188 s3c24xx_eint_type()
> 	warn: are you sure the precedence is correct here?
> 
> drivers/pinctrl/samsung/pinctrl-s3c24xx.c
>    186          /* Set up interrupt trigger */
>    187          reg = d->virt_base + EINT_REG(index);
>    188          shift = EINT_OFFS(index);
>    189
> 
> EINT_OFFS() is defined with two different precedences.  One of them is
> probably wrong and it's probably this one here that does the MOD
> operation first followed by the multiply.
> 
> #define EINT_OFFS(i) ((i) % EINT_MAX_PER_GROUP * 4)
> #define EINT_OFFS(i) ((i) % (2 * EINT_MAX_PER_GROUP))

I suppose the other EINT_OFFS definition 
	((i) % (2 * EINT_MAX_PER_GROUP))
is from pinctrl-64xx.c, right?

On the s3c24xx, the eints are arranged in a set of registers:
eint0 bits [2:0]
eint1 bits [6:4]
...
eint7 bits [30:28]

(next register):
eint8 bits [2:0]
...
eint15 bits [30:28]
...

EINT_MAX_PER_GROUP is of course 8, so for example
eint15 % 8 = 7
7 * 4 = 28 ... the correct bit offset in the register.


The eint layout on the s3c64xx is slightly different, so the offset calculation 
is likely too.


Heiko
