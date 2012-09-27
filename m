From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 07:38:52 +0000
Subject: Re: [staging:staging-next 253/267] drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn
Message-Id: <20120927073852.GD31500@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927011122.GC7205@localhost>
In-Reply-To: <20120927011122.GC7205@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 27, 2012 at 10:27:13AM +0300, Dan Carpenter wrote:
> On Thu, Sep 27, 2012 at 01:18:00PM +0800, Fengguang Wu wrote:
> > On Thu, Sep 27, 2012 at 12:00:09AM -0500, H Hartley Sweeten wrote:
> > > On Wednesday, September 26, 2012 6:11 PM, Fengguang Wu wrote:
> > > >
> > > > FYI, there are new smatch warnings show up in
> > > >
> > > > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
> > > > head:   3cd73bc1cf59b2c9232d9889ba2b148e262054b6
> > > > commit: 8c7e4277c1197d31c0b34dbaf23e6edddb5978f7 [253/267] staging: comedi: s626: cleanup request_irq in s626_attach_pci()
> > > >
> > > >   drivers/staging/comedi/drivers/s626.c:1428 s626_ai_cmd() Error invalid range 4096 to -1
> > > >   drivers/staging/comedi/drivers/s626.c:1448 s626_ai_cmd() Error invalid range 4096 to -1
> > > >   drivers/staging/comedi/drivers/s626.c:1649 s626_ai_cmdtest() Error invalid range 4096 to -1
> > > >   drivers/staging/comedi/drivers/s626.c:1656 s626_ai_cmdtest() Error invalid range 4096 to -1
> > > >   drivers/staging/comedi/drivers/s626.c:2504 s626_attach_pci() warn: '(dev->private)->base_addr' was not released on error
> > > >   drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn: '(dev->private)->base_addr' was not released on error
> > > > + drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn: 'pcidev->irq' was not released on error
> 
> Gar.  That check produces too many false positives because of logic
> like comedi's.  I want to move it under --spammy.
> 
> Fengguang, that would be ok with you?

I have no strong idea about this because I've not run into many such
"not released on error" warnings. 

I don't quite get the "invalid range 4096 to -1" warnings and they
show up quite often. What's your typical way to tell whether it's a
false warning?

Thanks,
Fengguang
