From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 14 Oct 2012 10:45:47 +0000
Subject: Re: [parisc:for-next 1/1] include/linux/irq.h:361:24: fatal error: asm/hw_irq.h: No such file or dir
Message-Id: <20121014104547.GA11207@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121014101032.GA7572@localhost>
In-Reply-To: <20121014101032.GA7572@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Oct 14, 2012 at 10:41:10AM +0000, James Bottomley wrote:
> On Sun, 2012-10-14 at 18:10 +0800, Fengguang Wu wrote:
> > Hi James,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jejb/parisc-2.6.git for-next
> > head:   07abad0579de44f8250dfee5ddc253062d050dc0
> > commit: 07abad0579de44f8250dfee5ddc253062d050dc0 [1/1] [PARISC] asm: redo generic includes
> > config: parisc-defconfig # make ARCH=parisc defconfig
> > 
> > All error/warnings:
> > 
> > In file included from include/asm-generic/hardirq.h:12:0,
> >                  from arch/parisc/include/asm/hardirq.h:9,
> >                  from include/linux/hardirq.h:7,
> >                  from arch/parisc/kernel/asm-offsets.c:34:
> > include/linux/irq.h:361:24: fatal error: asm/hw_irq.h: No such file or directory
> > compilation terminated.
> 
> Thanks ... somehow a 1 letter typo got introduced into KBuild as I added
> a couple of new ones from the merge window.  The reason the build didn't
> fail for me is because generic generated files don't get removed, so I
> already had a hw_irq.h from a previous run.
> 
> I've fixed up the commit.

OK, thanks for the quick fix!

> I'm impressed you have a parisc build environment, by the way. Thanks,

I'm doing allnoconfig and defconfig builds for parisc now. Are there
more configs that you would recommend? Perhaps:

        712_defconfig
        a500_defconfig
        b180_defconfig
        c3000_defconfig

Thanks,
Fengguang
