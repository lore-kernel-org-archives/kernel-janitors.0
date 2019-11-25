From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 25 Nov 2019 09:33:23 +0000
Subject: Re: [PATCH] iio: adc: intel_mrfld_adc: Allocating too much data in probe()
Message-Id: <20191125093323.GZ32742@smile.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119062124.kgwg7ujxe6k2ft3o@kili.mountain>
 <20191119102332.GC32742@smile.fi.intel.com>
 <20191123144206.7d3e5bd4@archlinux>
In-Reply-To: <20191123144206.7d3e5bd4@archlinux>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Vincent Pelletier <plr.vincent@gmail.com>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Nov 23, 2019 at 02:42:06PM +0000, Jonathan Cameron wrote:
> On Tue, 19 Nov 2019 12:23:32 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > On Tue, Nov 19, 2019 at 09:21:24AM +0300, Dan Carpenter wrote:
> > > This probe function is passing the wrong size to devm_iio_device_alloc().
> > > It is supposed to be the size of the private data.  Fortunately,
> > > sizeof(*indio_dev) is larger than sizeof(struct mrfld_adc) so it doesn't
> > > cause a runtime problem.
> > >   
> > 
> > Ah, indeed, thanks for fixing this!
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Applied to the fixes-togreg branch of iio.git.

Thanks!

> I'll wait until after the merge window now to send a pull request for this
> one so will be rc2ish before it's in.

Sure, as pointed out by Dan it seems to work due to size of wrong structure is
bigger than needed, thus it's not a critical fix.

-- 
With Best Regards,
Andy Shevchenko
