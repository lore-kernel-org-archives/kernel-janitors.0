From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 18 Sep 2012 04:32:23 +0000
Subject: [yinghai:master 195/233] drivers/pci/xen-pcifront.c:397:2: error: 'res' undeclared
Message-Id: <20120918043223.GA25133@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Yinghai,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/yinghai/linux-yinghai.git master
head:   f4e430c2d5fae2ece93207e3e8d06b14d66fcbe4
commit: b722843995da475accfde984ce41109938ab56e6 [195/233] PCI: Use for_each_res with xen pci
config: x86_64-allmodconfig

All related error/warning messages:

drivers/pci/xen-pcifront.c: In function 'pcifront_claim_resource':
drivers/pci/xen-pcifront.c:397:2: error: 'res' undeclared (first use in this function)
drivers/pci/xen-pcifront.c:397:2: note: each undeclared identifier is reported only once for each function it appears in

vim +397 drivers/pci/xen-pcifront.c
   392	{
   393		struct pcifront_device *pdev = data;
   394		int i;
   395		struct resource *r;
   396	
 > 397		for_each_pci_resource(dev, res, i, PCI_ALL_RES) {
   398			if (!r->parent && r->start && r->flags) {
   399				dev_info(&pdev->xdev->dev, "claiming resource %s/%d\n",
   400					pci_name(dev), i);
   401				if (pci_claim_resource(dev, i)) {
   402					dev_err(&pdev->xdev->dev, "Could not claim resource %s/%d! "

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
