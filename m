From: Greg KH <greg@kroah.com>
Date: Mon, 09 Jan 2006 17:05:59 +0000
Subject: Re: [KJ] hotplug
Message-Id: <20060109170559.GA20698@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12135093933633234=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601091133.53146.cneira@srb.cl>
In-Reply-To: <200601091133.53146.cneira@srb.cl>
To: kernel-janitors@vger.kernel.org

--===============12135093933633234==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2006 at 11:33:52AM +0000, carlos neira wrote:
> Greetings :
> linux-2.6.15-rc7/drivers/pci/hotplug/pciehp_ctrl.c
> linux-2.6.15-rc7/drivers/pci/hotplug/cpqphp_ctrl.c
> linux-2.6.15-rc7/drivers/pci/hotplug/cpci_hotplug_core.c
> 
> Replaced lock_kernel()  with spinlocks , compile tested ok , using it.

Do you have a pci hotplug system to test this with?

And as others pointed out, this patch is pretty broken, please consider
it rejected.

thanks,

greg k-h

--===============12135093933633234==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12135093933633234==--
