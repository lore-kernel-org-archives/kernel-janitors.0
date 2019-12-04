From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Wed, 04 Dec 2019 08:42:33 +0000
Subject: Re: [PATCH v2 -next] rtc: mt6397: drop free_irq of devm_xx allocated irq
Message-Id: <20191204084233.GL909634@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204063444.GF1765@kadam>
 <20191204072826.117432-1-maowenan@huawei.com>
 <20191204084036.GK909634@piout.net>
In-Reply-To: <20191204084036.GK909634@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: linux-rtc@vger.kernel.org, a.zummo@towertech.it, sean.wang@mediatek.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com, dan.carpenter@oracle.com

On 04/12/2019 09:40:38+0100, Alexandre Belloni wrote:
> On 04/12/2019 15:28:26+0800, Mao Wenan wrote:
> > rtc->irq is requested by devm_request_threaded_irq,
> > and request_threaded_irq. IRQs requested with this
> > function will be automatically freed on driver detach.
> > This patch remove unused error label as well.
> > 
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Mao Wenan <maowenan@huawei.com>
> > ---
> >  v2: remove error label as Dan Carpenter suggest.
> >  drivers/rtc/rtc-mt6397.c | 7 -------
> >  1 file changed, 7 deletions(-)
> > 
> > diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
> > index 5249fc99fd5f..14f3c4915260 100644
> > --- a/drivers/rtc/rtc-mt6397.c
> > +++ b/drivers/rtc/rtc-mt6397.c
> > @@ -287,13 +287,6 @@ static int mtk_rtc_probe(struct platform_device *pdev)
> >  	rtc->rtc_dev->ops = &mtk_rtc_ops;
> >  
> >  	ret = rtc_register_device(rtc->rtc_dev);
> > -	if (ret)
> > -		goto out_free_irq;
> > -
> > -	return 0;
> > -
> > -out_free_irq:
> > -	free_irq(rtc->irq, rtc);
> >  	return ret;
> 
> Maybe return rtc_register_device(rtc->rtc_dev); 
> 

By the way, this was already properly submitted here:
https://patchwork.ozlabs.org/patch/1193956/

So I'll apply this one once the merge window ends (it depends on the MFD
pull request, that is why I didn't apply it yet).


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
