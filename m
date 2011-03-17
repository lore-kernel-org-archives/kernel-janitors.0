From: Dan Carpenter <error27@gmail.com>
Date: Thu, 17 Mar 2011 21:07:41 +0000
Subject: Re: [patch] USB: xhci: unsigned char never equals -1
Message-Id: <20110317210741.GQ2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110317193949.GN2008@bicker>
In-Reply-To: <20110317193949.GN2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Thu, Mar 17, 2011 at 01:52:23PM -0700, Sarah Sharp wrote:
> On Thu, Mar 17, 2011 at 10:47:46PM +0300, Dan Carpenter wrote:
> > Btw, xhci-ring.c causes some valid looking gcc warnings:
> 
> Which git commit are you working off of?
> 

This is linux-next for 20110316.

commit b3694afad1864eaa7b59a1a5bcf576ed00d4089a
Merge: 37f454a 500132a
Author: Stephen Rothwell <sfr@canb.auug.org.au>
Date:   Wed Mar 16 16:53:13 2011 +1100

    Merge remote-tracking branch 'usb/usb-next'
    
    Conflicts:
        arch/arm/mach-omap2/board-omap3evm.c
        arch/arm/mach-omap2/board-overo.c
        arch/arm/mach-omap2/clock3xxx_data.c
        arch/arm/mach-omap2/usb-musb.c
        arch/arm/plat-omap/include/plat/usb.h
        drivers/usb/gadget/Kconfig
        drivers/usb/gadget/fsl_mxc_udc.c
        drivers/usb/musb/musb_core.h

commit ba0a4d9aaae789a6a632968b27c21d49b858b13a
Author: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date:   Wed Feb 23 18:13:43 2011 -0800

    xhci: Clean up cycle bit math used during stalls.


> > C [M]  drivers/usb/host/xhci-ring.o
> > drivers/usb/host/xhci-ring.c: In function ‘handle_port_status’:
> > drivers/usb/host/xhci-ring.c:1229: warning: ‘hcd’ may be used uninitialized in this function
> > drivers/usb/host/xhci-ring.c: In function ‘handle_tx_event’:
> > drivers/usb/host/xhci-ring.c:1895: warning: ‘event_trb’ may be used uninitialized in this function
> 
> I think the second warning is just the compiler getting confused, but
> I'll look into the first warning.  What gcc version are you using?  I
> had compile-tested the patches I recently sent to Greg, but on an older
> (un-updateable, thanks Ubuntu) box with an older gcc.
> 

I'm using gcc 4.4.3-4ubuntu5.

regards,
dan carpenter
