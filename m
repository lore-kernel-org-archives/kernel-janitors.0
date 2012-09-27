From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 01:11:22 +0000
Subject: [staging:staging-next 253/267] drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn:
Message-Id: <20120927011122.GC7205@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi H,

FYI, there are new smatch warnings show up in

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git staging-next
head:   3cd73bc1cf59b2c9232d9889ba2b148e262054b6
commit: 8c7e4277c1197d31c0b34dbaf23e6edddb5978f7 [253/267] staging: comedi: s626: cleanup request_irq in s626_attach_pci()

  drivers/staging/comedi/drivers/s626.c:1428 s626_ai_cmd() Error invalid range 4096 to -1
  drivers/staging/comedi/drivers/s626.c:1448 s626_ai_cmd() Error invalid range 4096 to -1
  drivers/staging/comedi/drivers/s626.c:1649 s626_ai_cmdtest() Error invalid range 4096 to -1
  drivers/staging/comedi/drivers/s626.c:1656 s626_ai_cmdtest() Error invalid range 4096 to -1
  drivers/staging/comedi/drivers/s626.c:2504 s626_attach_pci() warn: '(dev->private)->base_addr' was not released on error
  drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn: '(dev->private)->base_addr' was not released on error
+ drivers/staging/comedi/drivers/s626.c:2516 s626_attach_pci() warn: 'pcidev->irq' was not released on error

vim +2516 drivers/staging/comedi/drivers/s626.c
  2500		/* DMA FIXME DMA// */
  2501	
  2502		ret = s626_allocate_dma_buffers(dev);
  2503		if (ret)
  2504			return ret;
  2505	
  2506		if (pcidev->irq) {
  2507			ret = request_irq(pcidev->irq, s626_irq_handler, IRQF_SHARED,
  2508					  dev->board_name, dev);
  2509	
  2510			if (ret = 0)
  2511				dev->irq = pcidev->irq;
  2512		}
  2513	
  2514		ret = comedi_alloc_subdevices(dev, 6);
  2515		if (ret)
> 2516			return ret;
  2517	
  2518		s = dev->subdevices + 0;
  2519		/* analog input subdevice */
  2520		dev->read_subdev = s;
  2521		/* we support single-ended (ground) and differential */
  2522		s->type = COMEDI_SUBD_AI;
  2523		s->subdev_flags = SDF_READABLE | SDF_DIFF | SDF_CMD_READ;
  2524		s->n_chan = S626_ADC_CHANNELS;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
