From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Feb 2016 19:53:41 +0000
Subject: Re: [patch] extcon: use correct size
Message-Id: <20160204195341.GB32153@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160204113609.GA11239@mwanda>
 <56B3486D.1050201@bfs.de>
In-Reply-To: <56B3486D.1050201@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Jaewon Kim <jaewon02.kim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 04, 2016 at 01:47:41PM +0100, walter harms wrote:
> 
> 
> Am 04.02.2016 12:36, schrieb Dan Carpenter:
> > The info->status[] array has 3 elements.  We are using size
> > MAX77843_MUIC_IRQ_NUM (16) instead of MAX77843_MUIC_STATUS_NUM (3) as
> > intended.
> > 
> > Fixes: 135d9f7d135a ('extcon: max77843: Clear IRQ bits state before request IRQ')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > This is from static analysis and *NOT TESTED*.  Please review carefully.
> > 
> > diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
> > index 7bbc300..b188bd6 100644
> > --- a/drivers/extcon/extcon-max77843.c
> > +++ b/drivers/extcon/extcon-max77843.c
> > @@ -806,7 +806,7 @@ static int max77843_muic_probe(struct platform_device *pdev)
> >  	/* Clear IRQ bits before request IRQs */
> >  	ret = regmap_bulk_read(max77843->regmap_muic,
> >  			MAX77843_MUIC_REG_INT1, info->status,
> > -			MAX77843_MUIC_IRQ_NUM);
> > +			MAX77843_MUIC_STATUS_NUM);
> >  	if (ret) {
> >  		dev_err(&pdev->dev, "Failed to Clear IRQ bits\n");
> >  		goto err_muic_irq;
> > --
> 
> 
> just for my curiosity: what is wrong with ARRAY_SIZE() ?
> So far i understand is the functions intention to fill the array
> completely.

It's done pretty consistently the one way...  Jaewon?

regards,
dan carpenter

