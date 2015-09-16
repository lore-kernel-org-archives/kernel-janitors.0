From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Sep 2015 16:00:24 +0000
Subject: re: iomap: implement pcim_iounmap_regions()
Message-Id: <20150916160024.GB9735@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hey Tejun,

These are very old.

The patch ec04b075843d: "iomap: implement pcim_iounmap_regions()"
from Mar 9, 2007, leads to the following static checker warning:

	lib/devres.c:425 pcim_iounmap_regions()
	error: buffer overflow 'iomap' 6 <= 16

lib/devres.c
   405  /**
   406   * pcim_iounmap_regions - Unmap and release PCI BARs
   407   * @pdev: PCI device to map IO resources for
   408   * @mask: Mask of BARs to unmap and release
   409   *
   410   * Unmap and release regions specified by @mask.
   411   */
   412  void pcim_iounmap_regions(struct pci_dev *pdev, int mask)
   413  {
   414          void __iomem * const *iomap;
   415          int i;
   416  
   417          iomap = pcim_iomap_table(pdev);
   418          if (!iomap)
   419                  return;
   420  
   421          for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
   422                  if (!(mask & (1 << i)))
   423                          continue;

Probably maks is always valid is what helps us but basically the static
checker is suggesting that instead of DEVICE_COUNT_RESOURCE we should
be using PCI_ROM_RESOURCE or PCIM_IOMAP_MAX.  It could be that this was
deliberate though...

   424  
   425                  pcim_iounmap(pdev, iomap[i]);
   426                  pci_release_region(pdev, i);
   427          }
   428  }

regards,
dan carpenter
