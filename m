From: Greg KH <greg@kroah.com>
Date: Tue, 16 May 2006 22:10:05 +0000
Subject: Re: [KJ] [PATCH] drivers/char/istallion.c : change pci_find_device by
Message-Id: <20060516221005.GA5340@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============9084788510997448=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <446A4ADA.3070606@yahoo.fr>
In-Reply-To: <446A4ADA.3070606@yahoo.fr>
To: kernel-janitors@vger.kernel.org

--===============9084788510997448==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 16, 2006 at 11:57:46PM +0200, trem wrote:
> From: trem <tremyfr@yahoo.fr>
> 
> This patch simply change pci_find_device by pci_get_device, because
> pci_find_device is deprecated. pci_dev_put has been added to decrement
> the counter, so unload could be done.

Huh?  No, this patch is wrong, you are leaking a reference count, and
causing others to drop down to 0 accidentally.

Do NOT apply this.

thanks,

greg k-h

--===============9084788510997448==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============9084788510997448==--
