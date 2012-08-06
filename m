From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Aug 2012 14:26:50 +0000
Subject: Re: [PATCH] drivers/media/video/mx2_emmaprp.c: use devm_kzalloc and devm_clk_get
Message-Id: <20120806142650.GT4403@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344104607-18805-1-git-send-email-Julia.Lawall@lip6.fr>
 <20120806142323.GO4352@mwanda>
In-Reply-To: <20120806142323.GO4352@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Aug 06, 2012 at 05:23:23PM +0300, Dan Carpenter wrote:
> On Sat, Aug 04, 2012 at 08:23:27PM +0200, Julia Lawall wrote:
> > @@ -922,12 +920,7 @@ static int emmaprp_probe(struct platform_device *pdev)
> >  
> >  	platform_set_drvdata(pdev, pcdev);
> >  
> > -	if (devm_request_mem_region(&pdev->dev, res_emma->start,
> > -	    resource_size(res_emma), MEM2MEM_NAME) = NULL)
> > -		goto rel_vdev;
> > -
> > -	pcdev->base_emma = devm_ioremap(&pdev->dev, res_emma->start,
> > -					resource_size(res_emma));
> > +	pcdev->base_emma = devm_request_and_ioremap(&pdev->dev, res_emma);
> >  	if (!pcdev->base_emma)
> >  		goto rel_vdev;
> 
> This was in the original code, but there is a "ret = -ENOMEM;"
> missing here, and again a couple lines down in the original code.
> 

Or should that be -EIO instead of -ENOMEM?  I'm not sure.

regards,
dan carpenter

