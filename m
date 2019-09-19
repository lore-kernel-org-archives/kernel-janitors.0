From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 19 Sep 2019 11:29:37 +0000
Subject: Re: [PATCH] mtd: st_spi_fsm: Use devm_platform_ioremap_resource() in stfsm_probe()
Message-Id: <20190919112937.GA3072241@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e1d32aa4-7c82-64e0-b7c4-33c94d9a2769@web.de>
 <20190919111014.6c569cf3@xps13>
In-Reply-To: <20190919111014.6c569cf3@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Armijn Hemel <armijn@tjaldur.nl>, linux-mtd@lists.infradead.org, Himanshu Jha <himanshujha199640@gmail.com>, Richard Weinberger <richard@nod.at>, Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Allison Randal <allison@lohutok.net>

On Thu, Sep 19, 2019 at 11:10:14AM +0200, Miquel Raynal wrote:
> Hi Markus,
> 
> Markus Elfring <Markus.Elfring@web.de> wrote on Wed, 18 Sep 2019
> 14:50:27 +0200:
> 
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 18 Sep 2019 14:37:34 +0200
> > 
> > Simplify this function implementation by using a known wrapper function.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  drivers/mtd/devices/st_spi_fsm.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> > diff --git a/drivers/mtd/devices/st_spi_fsm.c b/drivers/mtd/devices/st_spi_fsm.c
> > index f4d1667daaf9..5bd1c44ae529 100644
> > --- a/drivers/mtd/devices/st_spi_fsm.c
> > +++ b/drivers/mtd/devices/st_spi_fsm.c
> > @@ -2034,13 +2034,7 @@ static int stfsm_probe(struct platform_device *pdev)
> > 
> >  	platform_set_drvdata(pdev, fsm);
> > 
> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > -	if (!res) {
> > -		dev_err(&pdev->dev, "Resource not found\n");
> > -		return -ENODEV;
> > -	}
> > -
> > -	fsm->base = devm_ioremap_resource(&pdev->dev, res);
> > +	fsm->base = devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(fsm->base)) {
> >  		dev_err(&pdev->dev,
> >  			"Failed to reserve memory region %pR\n", res);
> > --
> > 2.23.0
> > 
> 
> 
> Is this even compiled tested? 'res' is not initialized anymore so you
> can't use it in the error trace. I suppose you should even drop it from
> the stack parameters.

You are responding to a email address/bot that is on a number of kernel
developers "black list" as something to just totally ignore.  I
recommend you do the same if possible...

greg k-h
