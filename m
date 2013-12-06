From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 06 Dec 2013 13:34:30 +0000
Subject: Re: [patch] spi: bcm63xx-hsspi: checking for ERR_PTR instead of NULL
Message-Id: <20131206133430.GF28413@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131206125823.GA32369@elgon.mountain>
 <CAOiHx=k87c_bFqFtJ7zJc9HxnjOEr2oMofNUsLkQbfQPrC04hQ@mail.gmail.com>
In-Reply-To: <CAOiHx=k87c_bFqFtJ7zJc9HxnjOEr2oMofNUsLkQbfQPrC04hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonas Gorski <jogo@openwrt.org>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Dec 06, 2013 at 02:08:08PM +0100, Jonas Gorski wrote:
> On Fri, Dec 6, 2013 at 1:58 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > devm_request_and_ioremap() returns NULL on error, it doesn't return an
> > ERR_PTR().
> >
> > Fixes: 142168eba9dc ('spi: bcm63xx-hsspi: add bcm63xx HSSPI driver')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/drivers/spi/spi-bcm63xx-hsspi.c b/drivers/spi/spi-bcm63xx-hsspi.c
> > index bc8d848d33b7..da9f85d55c81 100644
> > --- a/drivers/spi/spi-bcm63xx-hsspi.c
> > +++ b/drivers/spi/spi-bcm63xx-hsspi.c
> > @@ -339,8 +339,8 @@ static int bcm63xx_hsspi_probe(struct platform_device *pdev)
> >
> >         res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >         regs = devm_request_and_ioremap(dev, res_mem);
> > -       if (IS_ERR(regs))
> > -               return PTR_ERR(regs);
> > +       if (!regs)
> > +               return -EADDRNOTAVAIL;
> 
> Instead of fixing the wrong handling of the return value, let's change
> it to use devm_ioremap_resource() which actually returns the expected
> ERR_PTR() and is preferred over request_and_ioremap().
> 

Sure.  I'll resend a v2.

regards,
dan carpenter

