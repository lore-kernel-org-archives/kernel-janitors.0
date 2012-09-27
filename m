From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 05:18:00 +0000
Subject: Re: [staging:staging-next 253/267] drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn
Message-Id: <20120927051800.GA24703@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927011122.GC7205@localhost>
In-Reply-To: <20120927011122.GC7205@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 27, 2012 at 12:00:09AM -0500, H Hartley Sweeten wrote:
> On Wednesday, September 26, 2012 6:11 PM, Fengguang Wu wrote:
> >
> > FYI, there are new smatch warnings show up in
> >
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
> > head:   3cd73bc1cf59b2c9232d9889ba2b148e262054b6
> > commit: 8c7e4277c1197d31c0b34dbaf23e6edddb5978f7 [253/267] staging: comedi: s626: cleanup request_irq in s626_attach_pci()
> >
> >   drivers/staging/comedi/drivers/s626.c:1428 s626_ai_cmd() Error invalid range 4096 to -1
> >   drivers/staging/comedi/drivers/s626.c:1448 s626_ai_cmd() Error invalid range 4096 to -1
> >   drivers/staging/comedi/drivers/s626.c:1649 s626_ai_cmdtest() Error invalid range 4096 to -1
> >   drivers/staging/comedi/drivers/s626.c:1656 s626_ai_cmdtest() Error invalid range 4096 to -1
> >   drivers/staging/comedi/drivers/s626.c:2504 s626_attach_pci() warn: '(dev->private)->base_addr' was not released on error
> >   drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn: '(dev->private)->base_addr' was not released on error
> > + drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn: 'pcidev->irq' was not released on error
> 
> These shouldn't be "new" warnings. The logic of the code has
> not been changed. Its just been shuffled around.
> 
> I'll take a look at the first four tommorrow just to make sure.
> They may actually be a problem but they shouldn't be new.

Right, it's not really a new *problem*. Technically, it's classified
as "new" by the script because of the s626_attach()=>s626_attach_pci()
rename, which makes it a new error *message*. This prevents the system
from bisecting it to the initial commit that caused the *problem*.

Hopefully such mistakes will only happen on a small fraction of pretty
old bugs.

> The last three warnings should exist in _every_ comedi driver.
> The comedi drivers are designed _not_ to release anything in
> the "attach" functions. Everything gets released either in the
> "detach" function or by the comedi core itself. I think it was
> orignally modeled on the tty subsystem.

Ah OK. These error messages will be ignored by the build system until
there comes another rename ;)

> I plan on looking into if it would be cleaner for the "attach"
> functions to cleanup after themselves on error. My initial
> impression is that the patch to "fix" this is going to be huge...

OK, thanks!

Fengguang
