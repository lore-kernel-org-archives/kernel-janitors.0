From: Borislav Petkov <bp@alien8.de>
Date: Sun, 17 Jun 2018 10:45:38 +0000
Subject: Re: [PATCH V2] EDAC, altera: Fix an error handling path in 'altr_s10_sdram_probe()'
Message-Id: <20180617104538.GA16877@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180610174532.22071-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180610174532.22071-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thor Thayer <thor.thayer@linux.intel.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Jun 11, 2018 at 09:53:53AM -0500, Thor Thayer wrote:
> On 06/10/2018 12:45 PM, Christophe JAILLET wrote:
> > IF 'regmap_write()' fails, we should release some resources as done in all
> > the other error handling paths of the function.
> > 
> > Fixes: e9918d7fafae ("EDAC, altera: Handle SDRAM Uncorrectable Errors on Stratix10")
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> > v1 -> v2: Fix subject line
> > ---
> >   drivers/edac/altera_edac.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> > index d0d5c4dbe097..5762c3c383f2 100644
> > --- a/drivers/edac/altera_edac.c
> > +++ b/drivers/edac/altera_edac.c
> > @@ -730,7 +730,8 @@ static int altr_s10_sdram_probe(struct platform_device *pdev)
> >   			 S10_DDR0_IRQ_MASK)) {
> >   		edac_printk(KERN_ERR, EDAC_MC,
> >   			    "Error clearing SDRAM ECC count\n");
> > -		return -ENODEV;
> > +		ret = -ENODEV;
> > +		goto err2;
> >   	}
> >   	if (regmap_update_bits(drvdata->mc_vbase, priv->ecc_irq_en_offset,
> > Thanks.
> 
> Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
