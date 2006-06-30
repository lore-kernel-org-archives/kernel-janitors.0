From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 30 Jun 2006 15:39:21 +0000
Subject: Re: [KJ] [PATCH] pci_module_init() -> pci_register_driver() in
Message-Id: <20060630153921.GA7595@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44A454A4.5010802@nachtwindheim.de>
In-Reply-To: <44A454A4.5010802@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jun 29, 2006 at 03:55:45PM -0700, Greg KH wrote:
> On Fri, Jun 30, 2006 at 12:31:00AM +0200, Henne wrote:
> > From: Henrik Kretzschmar <henne@nachtwindheim.de>
> >
> > Conversion from pci_module_init() to pci_register_driver() in the net-drivers.
>
> Careful, I don't think the network driver maintainer will take this.
> Please search the lkml archives for further details (having to do with
> backwards compatibility stuff...)

Hmm... Jeff once told me

	hmmmm.  Well, I suppose most of the drivers aren't being kept in sync
	with 2.4.x anymore, so this is probably OK.  I'll wait a while to apply
	this, to see if anyone complains...

but now I can't find traces of this patch in his git trees and -mm.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
