From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Aug 2014 09:13:36 +0000
Subject: Re: [patch] can: c_can: checking IS_ERR() instead of NULL
Message-Id: <20140801091336.GK4804@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140801085344.GA31702@mwanda>
 <53DB5770.7040808@pengutronix.de>
In-Reply-To: <53DB5770.7040808@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Wolfgang Grandegger <wg@grandegger.com>, George Cherian <george.cherian@ti.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Thor Thayer <tthayer@altera.com>, Pavel Machek <pavel@denx.de>, Mugunthan V N <mugunthanvnm@ti.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Wolfram Sang <wsa@sang-engineering.com>, linux-can@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 01, 2014 at 11:01:36AM +0200, Marc Kleine-Budde wrote:

> > diff --git a/drivers/net/can/c_can/c_can_platform.c b/drivers/net/can/c_can/c_can_platform.c
> > index 5dede6e..109cb44 100644
> > --- a/drivers/net/can/c_can/c_can_platform.c
> > +++ b/drivers/net/can/c_can/c_can_platform.c
> > @@ -280,7 +280,7 @@ static int c_can_plat_probe(struct platform_device *pdev)
> >  
> >  		priv->raminit_ctrlreg = devm_ioremap(&pdev->dev, res->start,
> >  						     resource_size(res));
> > -		if (IS_ERR(priv->raminit_ctrlreg) || priv->instance < 0)
> > +		if (!priv->raminit_ctrlreg || priv->instance < 0)
> 
> What about using PTR_ERR_OR_ZERO()?

No.  It doesn't ever return a PTR_ERR().  Checking for that would just
introduce a new static checker warning (signs of confusion may indicate
buggy code).

regards,
dan carpenter

