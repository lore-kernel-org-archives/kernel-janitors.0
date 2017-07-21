From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 21 Jul 2017 07:23:54 +0000
Subject: Re: [PATCH] dmaengine: ioatdma: Fix error handling path in 'ioat_dma_self_test()'
Message-Id: <alpine.DEB.2.20.1707210923370.4676@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170719221648.30253-1-christophe.jaillet@wanadoo.fr> <59705A93.2090305@bfs.de> <e9bcfe17-ad1c-a658-df8a-e99b5d5dacfb@intel.com> <5971AB9D.80608@bfs.de>
In-Reply-To: <5971AB9D.80608@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Dave Jiang <dave.jiang@intel.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Williams, Dan J" <dan.j.williams@intel.com>, "Koul, Vinod" <vinod.koul@intel.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



On Fri, 21 Jul 2017, walter harms wrote:

>
>
> Am 20.07.2017 18:56, schrieb Dave Jiang:
> >
> >
> > On 07/20/2017 12:24 AM, walter harms wrote:
> >>
> >>
> >> Am 20.07.2017 00:16, schrieb Christophe JAILLET:
> >>> If the 'memcmp' fails, free allocated resources as done in all other
> >>> error handling paths.
> >>>
> >>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >>> ---
> >>> Please review carefully, this patch looks "too obvious" to me!
> >>> ---
> >>>  drivers/dma/ioat/init.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
> >>> index ed8ed1192775..948fc1f8fb5c 100644
> >>> --- a/drivers/dma/ioat/init.c
> >>> +++ b/drivers/dma/ioat/init.c
> >>> @@ -390,7 +390,7 @@ static int ioat_dma_self_test(struct ioatdma_device *ioat_dma)
> >>>  	if (memcmp(src, dest, IOAT_TEST_SIZE)) {
> >>>  		dev_err(dev, "Self-test copy failed compare, disabling\n");
> >>>  		err = -ENODEV;
> >>> -		goto free_resources;
> >>> +		goto unmap_dma;
> >>>  	}
> >>>
> >>>  unmap_dma:
> >>
> >> ^^^^^^^^^^
> >>
> >>
> >> is the goto needed at all ?
> >
> > It's not. However, it may be better to stay there if we happen to add
> > additional code after the if block later on and guard against mistakes.
> > At least IMO.
> >
>
> If you are happy with that ... its not a big problem. The compiler will
> eat that goto anyway but it is unusual so be prepared that other people
> may send patches.

I agree with Walter.

julia


>
> re,
>  wh
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
