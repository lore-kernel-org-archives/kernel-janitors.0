From: Borislav Petkov <bp@alien8.de>
Date: Fri, 18 Aug 2017 16:24:55 +0000
Subject: Re: [PATCH] EDAC, altera: Fix an error handling path in 'altr_edac_device_probe()'
Message-Id: <20170818162455.t6s423pz5eax6nxn@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170816050506.14541-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170816050506.14541-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thor Thayer <thor.thayer@linux.intel.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 17, 2017 at 10:30:23AM -0500, Thor Thayer wrote:
> 
> On 08/16/2017 12:05 AM, Christophe JAILLET wrote:
> > 'res' is known to be 0 at this point.
> > If 'devm_ioremap()' fails, returns -ENOMEM instead of 0 which means
> > success.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > ---
> >   drivers/edac/altera_edac.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
> > index fa2e5db56d24..346c4987b284 100644
> > --- a/drivers/edac/altera_edac.c
> > +++ b/drivers/edac/altera_edac.c
> > @@ -747,8 +747,10 @@ static int altr_edac_device_probe(struct platform_device *pdev)
> >   	drvdata->edac_dev_name = ecc_name;
> >   	drvdata->base = devm_ioremap(&pdev->dev, r->start, resource_size(r));
> > -	if (!drvdata->base)
> > +	if (!drvdata->base) {
> > +		res = -ENOMEM;
> >   		goto fail1;
> > +	}
> >   	/* Get driver specific data for this EDAC device */
> >   	drvdata->data = of_match_node(altr_edac_device_of_match, np)->data;
> > 
> Thank you for this patch!
> 
> Acked-by: Thor Thayer <thor.thayer@linux.intel.com>

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
