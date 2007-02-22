From: Greg KH <greg@kroah.com>
Date: Thu, 22 Feb 2007 06:00:09 +0000
Subject: Re: [KJ] Patch1:replace pci_find_device in avm_pci.c
Message-Id: <20070222060009.GA27767@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1172121414.2677.14.camel@bluegenie>
In-Reply-To: <1172121414.2677.14.camel@bluegenie>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 22, 2007 at 10:46:54AM +0530, Surya wrote:
> 
> > > dev_avm_cleanup:
> > > 	if (dev_avm) 
> > > 		pci_dev_put(dev_avm);
> > 
> > Same thing here, the check isn't needed.
> > 
> > Care to redo it with these minor fixes?  Other than that, the logic
> > looks correct.
> 
> Did the modifications and cleaned up white spaces as per your
> suggestions.
> 
> thanks.
> 
> Signed-off-by: Surya Prabhakar <surya.prabhakar@wipro.com>

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
