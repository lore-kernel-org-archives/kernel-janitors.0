From: Jonathan Cameron <jic23@kernel.org>
Date: Sun, 05 Jul 2020 11:59:35 +0000
Subject: Re: [PATCH] iio: adc: ad7780: Fix a resource handling path in 'ad7780_probe()'
Message-Id: <20200705125935.025cfa12@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200517095953.278950-1-christophe.jaillet@wanadoo.fr>
        <20200518022129.xkcuw4yxotnll7ym@renatolg>
In-Reply-To: <20200518022129.xkcuw4yxotnll7ym@renatolg>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Renato Lui Geh <renatogeh@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Michael.Hennerich@analog.com, lars@metafoo.de, knaack.h@gmx.de, pmeerw@pmeerw.net, giuliano.belinassi@usp.br, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 17 May 2020 23:21:29 -0300
Renato Lui Geh <renatogeh@gmail.com> wrote:

> Acked-by: Renato Lui Geh <renatogeh@gmail.com>
> 
> On 05/17, Christophe JAILLET wrote:
> >If 'ad7780_init_gpios()' fails, we must not release some resources that
> >have not been allocated yet. Return directly instead.
> >
> >Fixes: 5bb30e7daf00 ("staging: iio: ad7780: move regulator to after GPIO init")
> >Fixes: 9085daa4abcc ("staging: iio: ad7780: add gain & filter gpio support")
> >Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Applied to the fixes-togreg branch of iio.git.

Thanks,

Jonathan

> >---
> > drivers/iio/adc/ad7780.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/iio/adc/ad7780.c b/drivers/iio/adc/ad7780.c
> >index f47606ebbbbe..b33fe6c3907e 100644
> >--- a/drivers/iio/adc/ad7780.c
> >+++ b/drivers/iio/adc/ad7780.c
> >@@ -329,7 +329,7 @@ static int ad7780_probe(struct spi_device *spi)
> >
> > 	ret = ad7780_init_gpios(&spi->dev, st);
> > 	if (ret)
> >-		goto error_cleanup_buffer_and_trigger;
> >+		return ret;
> >
> > 	st->reg = devm_regulator_get(&spi->dev, "avdd");
> > 	if (IS_ERR(st->reg))
> >-- 
> >2.25.1
> >  
