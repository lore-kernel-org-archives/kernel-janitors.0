From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Fri, 11 Nov 2016 08:28:01 +0000
Subject: Re: [patch] usb: xhci-mem: use passed in GFP flags instead of GFP_KERNEL
Message-Id: <20161111082801.jk2bidgnxhabqsjb@linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161110193317.GC32533@mwanda>
In-Reply-To: <20161110193317.GC32533@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2016-11-10 22:33:17 [+0300], Dan Carpenter wrote:
> We normally use the passed in gfp flags for allocations, it's just these
> two which were missed.

You seem to be right. xhci_mem_init() has only one caller with
GFP_KERNEL as argument. You could unwind it.

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> Fixes: 22d45f01a836 ("usb/xhci: replace pci_*_consistent() with dma_*_coherent()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Sebastian
