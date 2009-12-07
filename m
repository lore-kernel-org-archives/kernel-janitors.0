From: "Tung, Chien Tin" <chien.tin.tung@intel.com>
Date: Mon, 07 Dec 2009 16:17:14 +0000
Subject: RE: [PATCH 3/5] drivers/infiniband: correct size computation
Message-Id: <603F8A3875DCE940BA37B49D0A6EA0AE3CE36BF4@azsmsx501.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912061015540.20858@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912061015540.20858@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, "Latif, Faisal" <faisal.latif@intel.com>, Roland Dreier <rolandd@cisco.com>, "Hefty, Sean" <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Thanks for pointing out the bug.  

> 	/* Remap the PCI registers in adapter BAR0 to kernel VA space */
>-	mmio_regs = ioremap_nocache(pci_resource_start(pcidev, BAR_0), sizeof(mmio_regs));
>+	mmio_regs = ioremap_nocache(pci_resource_start(pcidev, BAR_0),
>+				    sizeof(*mmio_regs));
> 	if (mmio_regs = NULL) {
> 		printk(KERN_ERR PFX "Unable to remap BAR0\n");
> 		ret = -EIO;

mmio_regs is initialized to NULL at the top of the function so *mmio_regs wouldn't be
a good idea.  Instead of sizeof(*mmio_regs) use pci_resource_len(pcidev, BAR_0).  If
you can recreate the patch with this change I will ack it.

Thanks,


Chien


