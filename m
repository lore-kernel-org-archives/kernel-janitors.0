From: Ravi Kerur <rkerur@gmail.com>
Date: Fri, 03 Apr 2015 20:40:35 +0000
Subject: TODO list
Message-Id: <551EFAC3.9000307@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100714100136.GA3583@albatros>
In-Reply-To: <20100714100136.GA3583@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Team,

I am planning to take up following items from TODO list. If it's already picked please let me know. 

* pci_set_dma_mask() and friends should use DMA_BIT_MASK(nn) instead of

DMA_nnBIT_MASK or 0xffff... This is not 2.4 compatible, so beware of drivers with same code. [D: http://marc.theaimsgroup.com/?t8001993000001] Don't forget to #include dma-mapping.h

* check kmallocs for things like GFP_DMA without a memtype. 


Thanks,

Ravi
