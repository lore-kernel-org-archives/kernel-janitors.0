From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 02 Oct 2012 14:06:50 +0000
Subject: Re: [driver-core:driver-core-next 4/11] include/linux/device.h:925:12: error: 'dev_vprintk_emit' def
Message-Id: <20121002140650.GA4560@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002104127.GA31577@localhost>
In-Reply-To: <20121002104127.GA31577@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 02, 2012 at 06:46:33AM -0700, Greg KH wrote:
> On Tue, Oct 02, 2012 at 06:41:27PM +0800, Fengguang Wu wrote:
> > Hi Joe,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-next
> > head:   e0f21e6d52cc245e7d4f7e02ca4b7b6571660ec2
> > commit: 05e4e5b87aab74f994acf9dd4bed4a8f1367cd09 [4/11] dev: Add dev_vprintk_emit and dev_printk_emit
> > config: sh-allnoconfig
> > 
> > All error/warnings:
> > 
> > include/linux/device.h:925:12: error: 'dev_vprintk_emit' defined but not used [-Werror=unused-function]
> > cc1: all warnings being treated as errors
> 
> I can't duplicate this here, what is your .config?

make ARCH=sh allnoconfig

Sorry, but it's a bit complicated: driver-core-next HEAD is actually
fine.  The commit 05e4e5b87aab74f994acf9dd4bed4a8f1367cd09 is broken.

Since I'm not doing bisectibility tests on driver-core, I checked the
log and find that the error is actually first found when testing the
HEAD commit of 

        git://git.linaro.org/people/shawnguo/linux-2.6.git for-3.8
        
It seems to be based on linux-next, which includes an older version of
your tree. The build system bisected down the error to the first bad
commit 05e4e5b87aab74f994acf9dd4bed4a8f1367cd09, and then find that
it's not really in shawnguo's tree, but part of your tree. So it ends
up reporting against driver-core rather than shawnguo's tree.

Everything is working fine above, except that your tree HEAD has
advanced to a new point that the error already get fixed.

> And treating warnings as errors?  Good luck :)

I guess some dir in ARCH sh does that -Werror thing.

Thanks,
Fengguang
