From: Vinod Koul <vinod.koul@intel.com>
Date: Fri, 21 Jul 2017 06:43:17 +0000
Subject: Re: [PATCH] dmaengine: ioatdma: Fix error handling path in 'ioat_dma_self_test()'
Message-Id: <20170721063116.GK3053@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170719221648.30253-1-christophe.jaillet@wanadoo.fr>
 <cb19736e-3c70-a9c2-bbb6-977e5c4c66d4@intel.com>
In-Reply-To: <cb19736e-3c70-a9c2-bbb6-977e5c4c66d4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jiang <dave.jiang@intel.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Williams, Dan J" <dan.j.williams@intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Jul 19, 2017 at 03:21:23PM -0700, Dave Jiang wrote:
> 
> 
> On 07/19/2017 03:16 PM, Christophe JAILLET wrote:
> > If the 'memcmp' fails, free allocated resources as done in all other
> > error handling paths.
> > 
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

You meant acked right..?

> 
> Good catch! Thanks.
> 
> Signed-off-by: Dave Jiang <dave.jiang@intel.com>
> 
> > ---
> > Please review carefully, this patch looks "too obvious" to me!
> > ---
> >  drivers/dma/ioat/init.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
> > index ed8ed1192775..948fc1f8fb5c 100644
> > --- a/drivers/dma/ioat/init.c
> > +++ b/drivers/dma/ioat/init.c
> > @@ -390,7 +390,7 @@ static int ioat_dma_self_test(struct ioatdma_device *ioat_dma)
> >  	if (memcmp(src, dest, IOAT_TEST_SIZE)) {
> >  		dev_err(dev, "Self-test copy failed compare, disabling\n");
> >  		err = -ENODEV;
> > -		goto free_resources;
> > +		goto unmap_dma;
> >  	}
> >  
> >  unmap_dma:
> > 

-- 
~Vinod
