From: Greg KH <gregkh@suse.de>
Date: Tue, 15 Aug 2006 19:37:56 +0000
Subject: Re: [KJ] [PATCH] Change pci_module_init from macro to inline
Message-Id: <20060815193756.GA15203@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44E18DE2.8020700@nachtwindheim.de>
In-Reply-To: <44E18DE2.8020700@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henne <henne@nachtwindheim.de>
Cc: linux-pci@atrey.karlin.mff.cuni.cz, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

On Tue, Aug 15, 2006 at 11:03:30AM +0200, Henne wrote:
> From: Henrik Kretzschmar <henne@nachtwindheim.de>
> 
> Replaces the pci_module_init()-macro with a inline function,
> which is marked as deprecated.
> This gives a warning at compile time, which may be useful for driver developers who still use
> pci_module_init() on 2.6 drivers.

Have you gotten the network driver authors to buy into this?  Last I
heard, they did not want to change over for a few reasons.

If not, I'm not going to apply this, as it will just cause a zillion
warnings that will not get fixed up.

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
