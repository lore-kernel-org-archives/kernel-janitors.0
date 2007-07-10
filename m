From: Greg KH <greg@kroah.com>
Date: Tue, 10 Jul 2007 23:14:24 +0000
Subject: Re: [PATCH] Remove BKL from PCI syscalls
Message-Id: <20070710231424.GA17508@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070710165532.GP9704@parisc-linux.org>
In-Reply-To: <20070710165532.GP9704@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 10, 2007 at 10:55:32AM -0600, Matthew Wilcox wrote:
> 
> Remove use of the BKL from the PCI syscalls.  It was protecting against
> PCI device removal.  By taking a reference (using pci_get_slot), we
> ensure the device will not be removed while we're using it, and can
> remove the BKL.
> 
> While I'm in this file, update the comment at the top to reflect the
> status of the syscalls.
> 
> Signed-off-by: Matthew Wilcox <matthew@wil.cx>

What tree did you make this against?  I get the following errors trying
to apply it to my pci tree:
	Applying patch pci-remove-bkl-from-pci-syscalls.patch
	patching file drivers/pci/syscall.c
	Hunk #2 FAILED at 28.
	Hunk #4 FAILED at 65.
	Hunk #5 FAILED at 83.
	Hunk #6 FAILED at 102.
	Hunk #7 FAILED at 138.
	5 out of 7 hunks FAILED -- rejects in file drivers/pci/syscall.c

thanks,

greg k-h
