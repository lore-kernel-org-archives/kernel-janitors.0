From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 23 Nov 2019 14:42:06 +0000
Subject: Re: [PATCH] iio: adc: intel_mrfld_adc: Allocating too much data in probe()
Message-Id: <20191123144206.7d3e5bd4@archlinux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119062124.kgwg7ujxe6k2ft3o@kili.mountain>
        <20191119102332.GC32742@smile.fi.intel.com>
In-Reply-To: <20191119102332.GC32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Vincent Pelletier <plr.vincent@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 19 Nov 2019 12:23:32 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Tue, Nov 19, 2019 at 09:21:24AM +0300, Dan Carpenter wrote:
> > This probe function is passing the wrong size to devm_iio_device_alloc().
> > It is supposed to be the size of the private data.  Fortunately,
> > sizeof(*indio_dev) is larger than sizeof(struct mrfld_adc) so it doesn't
> > cause a runtime problem.
> >   
> 
> Ah, indeed, thanks for fixing this!
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Applied to the fixes-togreg branch of iio.git.

I'll wait until after the merge window now to send a pull request for this
one so will be rc2ish before it's in.

Thanks,

Jonathan

> 
> > Fixes: a7118662734a ("iio: adc: intel_mrfld_adc: Add Basin Cove ADC driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/iio/adc/intel_mrfld_adc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iio/adc/intel_mrfld_adc.c b/drivers/iio/adc/intel_mrfld_adc.c
> > index 67d096f8180d..c35a1beb817c 100644
> > --- a/drivers/iio/adc/intel_mrfld_adc.c
> > +++ b/drivers/iio/adc/intel_mrfld_adc.c
> > @@ -185,7 +185,7 @@ static int mrfld_adc_probe(struct platform_device *pdev)
> >  	int irq;
> >  	int ret;
> >  
> > -	indio_dev = devm_iio_device_alloc(dev, sizeof(*indio_dev));
> > +	indio_dev = devm_iio_device_alloc(dev, sizeof(struct mrfld_adc));  
> 
> Many drivers use sizeof(*adc) form, but I'm okay with either.
> 
> >  	if (!indio_dev)
> >  		return -ENOMEM;
> >  
> > -- 
> > 2.11.0
> >   
> 
