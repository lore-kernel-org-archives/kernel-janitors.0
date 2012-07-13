From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 13 Jul 2012 07:06:44 +0000
Subject: Re: [staging:staging-next 86/99] drivers/staging/iio/adc/ad7298_ring.c:97:37: warning: 'time_ns' may
Message-Id: <20120713070644.GA17702@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120713051049.GC15846@localhost>
In-Reply-To: <20120713051049.GC15846@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 13, 2012 at 08:49:24AM +0200, Lars-Peter Clausen wrote:
> On 07/13/2012 07:10 AM, Fengguang Wu wrote:
> > Hi Lars-Peter,
> > 
> > There are compile warnings in
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
> > head:   bd972ff3176caf91a49d1d754848c3f6c5435328
> > commit: 3879089ba3421bc8136025837b1a532729643371 [86/99] staging:iio:max1363: Don't free uninitialized variable
> > 
> > All warnings:
> > 
> > drivers/staging/iio/adc/ad7298_ring.c:97:37: warning: 'time_ns' may be used uninitialized in this function [-Wmaybe-uninitialized]
> > 
> 
> Hi,
> 
> I don't think the warning is caused by that commit. The file in question is
> not affected by it.

You are right. The real bad commit is this:

commit 7c31b984c4d119d0e32a1696fd4ca6b506a73d10
Author: Michael Hennerich <michael.hennerich@analog.com>
Date:   Thu Feb 24 12:32:45 2011 +0100

    IIO: ADC: New driver for the AD7298 8-channel SPI ADC

Thanks,
Fengguang
