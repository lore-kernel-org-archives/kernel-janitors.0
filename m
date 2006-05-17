From: Greg KH <greg@kroah.com>
Date: Wed, 17 May 2006 00:16:30 +0000
Subject: Re: [KJ] [PATCH] drivers/char/ip2/ip2main.c : change pci_find_device
Message-Id: <20060517001630.GA6355@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6071717362180844=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <446A4AA3.7090202@zarb.org>
In-Reply-To: <446A4AA3.7090202@zarb.org>
To: kernel-janitors@vger.kernel.org

--===============6071717362180844==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 17, 2006 at 12:53:22AM +0200, trem wrote:
> From: trem <tremyfr@yahoo.fr>
> 
> This patch simply change pci_find_device by pci_get_device, because
> pci_find_device is deprecated. pci_dev_put has been added to decrement
> the counter, so unload could be done. I've added a pci_dev_put(pci_dev_i)
> before the break to avoid mising a device.

No, you are decrementing a reference while still holding a pointer to
it.  That's a bug.

thanks,

greg k-h

--===============6071717362180844==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6071717362180844==--
