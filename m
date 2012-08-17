From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 17 Aug 2012 03:57:30 +0000
Subject: Re: [samsung:v4l_samsung_for_v3.7 90/99] ERROR: "flexcop_dma_config_timer" [drivers/media/pci/b2c2/b
Message-Id: <20120817035730.GC26867@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <502BBCA1.1020603@redhat.com>
In-Reply-To: <502BBCA1.1020603@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 15, 2012 at 12:13:37PM -0300, Mauro Carvalho Chehab wrote:
> Em 14-08-2012 14:46, Fengguang Wu escreveu:
> > Hi Mauro,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.infradead.org/users/kmpark/linux-samsung v4l_samsung_for_v3.7
> > head:   880d3853c370664e208865b3f5bc5831353d93ce
> > commit: 3785bc170f79ef04129731582b468c28e1326d6d [90/99] [media] b2c2: break it into common/pci/usb directories
> > config: x86_64-allmodconfig (attached as .config)
> > 
> > All related error/warning messages:
> > 
> > variable with __init* or __refdata (see linux/init.h) or name the variable:
> > *driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
> > 
> > WARNING: drivers/staging/ipack/bridges/tpci200.o(.data+0x28): Section mismatch in reference from the variable tpci200_pci_drv to the function .devexit.text:tpci200_pci_remove()
> > The variable tpci200_pci_drv references
> > the function __devexit tpci200_pci_remove()
> > If the reference is valid then annotate the
> > variable with __exit* (see linux/init.h) or name the variable:
> > *driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
> > 
> > ERROR: "flexcop_dma_config_timer" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> > ERROR: "flexcop_dma_config" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> > ERROR: "flexcop_dma_free" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> > ERROR: "flexcop_dma_xfer_control" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> > ERROR: "flexcop_dma_allocate" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> > ERROR: "flexcop_dma_control_timer_irq" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> > 
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Centre
> > Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
> > 
> 
> Thanks for report!
> 
> The enclosed patch should fix it.

It reduced the errors to one:

ERROR: "b2c2_flexcop_debug" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!

Thanks,
Fengguang
