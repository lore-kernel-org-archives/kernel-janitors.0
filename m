From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 01:08:30 +0000
Subject: [staging:staging-next 245/267] drivers/staging/comedi/drivers/s626.c:2492 s626_attach_pci() warn:
Message-Id: <20120927010830.GB7205@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Hartley,

FYI, there are smatch warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
head:   3cd73bc1cf59b2c9232d9889ba2b148e262054b6
commit: 91e674e83c530d5902e482ede1af0115989c4fe6 [245/267] staging: comedi: s626: use attach_pci callback

  drivers/staging/comedi/drivers/s626.c:1430 s626_ai_cmd() Error invalid range 4096 to -1
  drivers/staging/comedi/drivers/s626.c:1450 s626_ai_cmd() Error invalid range 4096 to -1
  drivers/staging/comedi/drivers/s626.c:1651 s626_ai_cmdtest() Error invalid range 4096 to -1
  drivers/staging/comedi/drivers/s626.c:1658 s626_ai_cmdtest() Error invalid range 4096 to -1
  drivers/staging/comedi/drivers/s626.c:2463 s626_attach_pci() info: why not propagate 'result' from comedi_pci_enable() instead of -19?
+ drivers/staging/comedi/drivers/s626.c:2492 s626_attach_pci() warn: '(dev->private)->base_addr' was not released on error
  drivers/staging/comedi/drivers/s626.c:2504 s626_attach_pci() warn: '(dev->private)->base_addr' was not released on error
  drivers/staging/comedi/drivers/s626.c:2517 s626_attach_pci() warn: '(dev->private)->base_addr' was not released on error

The errors are actually first introduced by

commit 020c44f3ad91b334f907a66eedba68f46dd39d25
Author:     H Hartley Sweeten <hartleys@visionengravers.com>
Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CommitDate: Fri Jun 22 20:05:01 2012 -0700

    staging: comedi: s626: remove forward declarations 1

vim +2492 drivers/staging/comedi/drivers/s626.c
  2476			/* disable master interrupt */
  2477			writel(0, devpriv->base_addr + P_IER);
  2478	
  2479			/* soft reset */
  2480			writel(MC1_SOFT_RESET, devpriv->base_addr + P_MC1);
  2481	
  2482			/* DMA FIXME DMA// */
  2483	
  2484			/* adc buffer allocation */
  2485			devpriv->allocatedBuf = 0;
  2486	
  2487			devpriv->ANABuf.LogicalBase   2488			    pci_alloc_consistent(devpriv->pdev, DMABUF_SIZE, &appdma);
  2489	
  2490			if (devpriv->ANABuf.LogicalBase = NULL) {
  2491				printk(KERN_ERR "s626_attach: DMA Memory mapping error\n");
> 2492				return -ENOMEM;
  2493			}
  2494	
  2495			devpriv->ANABuf.PhysicalBase = appdma;
  2496	
  2497			devpriv->allocatedBuf++;
  2498	
  2499			devpriv->RPSBuf.LogicalBase   2500			    pci_alloc_consistent(devpriv->pdev, DMABUF_SIZE, &appdma);

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
