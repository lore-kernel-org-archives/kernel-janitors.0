From: Mauro Carvalho Chehab <mchehab@redhat.com>
Date: Wed, 15 Aug 2012 15:13:37 +0000
Subject: Re: [samsung:v4l_samsung_for_v3.7 90/99] ERROR: "flexcop_dma_config_timer" [drivers/media/pci/b2c2/b
Message-Id: <502BBCA1.1020603@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em 14-08-2012 14:46, Fengguang Wu escreveu:
> Hi Mauro,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.infradead.org/users/kmpark/linux-samsung v4l_samsung_for_v3.7
> head:   880d3853c370664e208865b3f5bc5831353d93ce
> commit: 3785bc170f79ef04129731582b468c28e1326d6d [90/99] [media] b2c2: break it into common/pci/usb directories
> config: x86_64-allmodconfig (attached as .config)
> 
> All related error/warning messages:
> 
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
> 
> WARNING: drivers/staging/ipack/bridges/tpci200.o(.data+0x28): Section mismatch in reference from the variable tpci200_pci_drv to the function .devexit.text:tpci200_pci_remove()
> The variable tpci200_pci_drv references
> the function __devexit tpci200_pci_remove()
> If the reference is valid then annotate the
> variable with __exit* (see linux/init.h) or name the variable:
> *driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
> 
> ERROR: "flexcop_dma_config_timer" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> ERROR: "flexcop_dma_config" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> ERROR: "flexcop_dma_free" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> ERROR: "flexcop_dma_xfer_control" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> ERROR: "flexcop_dma_allocate" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> ERROR: "flexcop_dma_control_timer_irq" [drivers/media/pci/b2c2/b2c2-flexcop-pci.ko] undefined!
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
> 

Thanks for report!

The enclosed patch should fix it.

Not sure why this error didn't appear before, but it is clear that the
second rule for b2c2-flexcop-pci-objs was removing flexcop-dma.o from the
list of object files for b2c2-flexcop-pci.o.

-

[media] b2c2: fix driver's build due to the lack of pci DMA code

From: Mauro Carvalho Chehab <mchehab@redhat.com>

Fix a one-character typo at the makefile.

drivers/built-in.o: In function `flexcop_pci_remove':
flexcop-pci.c:(.text+0x20d1a28): undefined reference to `flexcop_dma_free'
flexcop-pci.c:(.text+0x20d1a3e): undefined reference to `flexcop_dma_free'
drivers/built-in.o: In function `flexcop_pci_stream_control':
flexcop-pci.c:(.text+0x20d2396): undefined reference to `flexcop_dma_config'
flexcop-pci.c:(.text+0x20d23b3): undefined reference to `flexcop_dma_config'
flexcop-pci.c:(.text+0x20d23cf): undefined reference to `flexcop_dma_config_timer'
flexcop-pci.c:(.text+0x20d23f5): undefined reference to `flexcop_dma_xfer_control'
flexcop-pci.c:(.text+0x20d244c): undefined reference to `flexcop_dma_control_timer_irq'
flexcop-pci.c:(.text+0x20d24b0): undefined reference to `flexcop_dma_control_timer_irq'
flexcop-pci.c:(.text+0x20d2507): undefined reference to `flexcop_dma_xfer_control'
drivers/built-in.o: In function `flexcop_pci_probe':
flexcop-pci.c:(.text+0x20d28d2): undefined reference to `flexcop_dma_allocate'
flexcop-pci.c:(.text+0x20d2907): undefined reference to `flexcop_dma_allocate'
flexcop-pci.c:(.text+0x20d2923): undefined reference to `flexcop_dma_free'

Reported-by: Fengguang Wu <wfg@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>

diff --git a/drivers/media/pci/b2c2/Makefile b/drivers/media/pci/b2c2/Makefile
index aedcac1..b894320 100644
--- a/drivers/media/pci/b2c2/Makefile
+++ b/drivers/media/pci/b2c2/Makefile
@@ -2,7 +2,7 @@ ifneq ($(CONFIG_DVB_B2C2_FLEXCOP_PCI),)
 b2c2-flexcop-pci-objs += flexcop-dma.o
 endif
 
-b2c2-flexcop-pci-objs = flexcop-pci.o
+b2c2-flexcop-pci-objs += flexcop-pci.o
 obj-$(CONFIG_DVB_B2C2_FLEXCOP_PCI) += b2c2-flexcop-pci.o
 
 ccflags-y += -Idrivers/media/dvb-core/

