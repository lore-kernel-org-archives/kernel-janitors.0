From: Ben Dooks <ben-linux@fluff.org>
Date: Tue, 31 Oct 2017 14:36:50 +0000
Subject: Re: [PATCH] I2C-S3C2410: Use common error handling code in s3c24xx_i2c_probe()
Message-Id: <20171031143650.GA13049@trinity.fluff.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <32c82282-ee0a-137f-4913-310b194b60f3@users.sourceforge.net>
 <20171025132620.l7scp2eachnarpzt@mwanda>
In-Reply-To: <20171025132620.l7scp2eachnarpzt@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Oct 25, 2017 at 04:26:20PM +0300, Dan Carpenter wrote:
> > @@ -1180,24 +1179,21 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
> >  		i2c->irq = ret = platform_get_irq(pdev, 0);
> >  		if (ret <= 0) {
> 
> Not related to this patch, but the comparison here should be < 0.  Or
> otherwise we should set an error code.  The bug was introduced in commit
> e0d1ec97853f ("i2c-s3c2410: Change IRQ to be plain integer.").
> 
> >  			dev_err(&pdev->dev, "cannot find IRQ\n");
> > -			clk_unprepare(i2c->clk);
> > -			return ret;
> 
> regards,
> dan carpenter

I believe (ret < 0) { } should be the correct case here.

-- 
Ben Dooks, ben@fluff.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.

