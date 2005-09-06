From: "Gabriel A. Devenyi" <ace@staticwave.ca>
Date: Tue, 06 Sep 2005 01:15:27 +0000
Subject: [KJ] Bit Truncation in drivers/pci/probe.c on amd64
Message-Id: <200509052115.27300.ace@staticwave.ca>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org

In the current git repository, on my amd64 machine I get the following warning on compile
drivers/pci/probe.c: In function `pci_read_bases':
drivers/pci/probe.c:166: warning: large integer implicitly truncated to unsigned type
drivers/pci/probe.c:216: warning: large integer implicitly truncated to unsigned type

I've tracked this down to pci_size, and two #define's in include/linux/pci.h

#define  PCI_BASE_ADDRESS_MEM_MASK	(~0x0fUL)
#define PCI_ROM_ADDRESS_MASK	(~0x7ffUL)

pci_size expects 3 u32 arguments,but from what I can tell, on 64 bit arch's the two above 
defines expand to 64bit values, and are truncated when being passed.

I'm not sure how to go about fixing this, if pci_size should accept a u64 or if the defines should
be changed. Is this bug dangerous? What should be done to fix it?

-- 
Gabriel A. Devenyi
ace@staticwave.ca
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
