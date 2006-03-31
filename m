From: Greg KH <greg@kroah.com>
Date: Fri, 31 Mar 2006 17:00:01 +0000
Subject: Re: [KJ][Patch] fix kbuild warning in sisfb.o
Message-Id: <20060331170001.GA26432@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41718559539536404=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1143810678.7834.13.camel@localhost.localdomain>
In-Reply-To: <1143810678.7834.13.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============41718559539536404==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 01, 2006 at 12:11:18AM +1100, Darren Jenkins" wrote:
> G'day list
> 
> This one was a lot harder to find, but much easier to fix.
> 
> WARNING: drivers/video/sis/sisfb.o - Section mismatch: reference
> to .init.data: from .data between 'sisfb_driver' (at offset 0xf8) and
> 'sisfb_ops'
> 
> 
> This is caused by the 'pci_driver struct' in sis_main.c having a pointer
> to a 'pci_device_id struct' in 'sis_main.h' that is marked as
> __devinitdata.
> 
> The patch below just removes the __devinitdata annotation from the
> 'pci_device_id struct', which seems like the best solution here.

No, this should be just fine.  devinitdata should be just fine for PCI
device ids.

thanks,

greg k-h

--===============41718559539536404==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41718559539536404==--
