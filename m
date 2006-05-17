From: Greg KH <greg@kroah.com>
Date: Wed, 17 May 2006 00:09:13 +0000
Subject: Re: [KJ] [PATCH] ip2main.c : replace pci_find_device by pci_get_device
Message-Id: <20060517000913.GA6052@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85458547015556441=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <446A3C3B.8020707@yahoo.fr>
In-Reply-To: <446A3C3B.8020707@yahoo.fr>
To: kernel-janitors@vger.kernel.org

--===============85458547015556441==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 16, 2006 at 10:55:23PM +0200, trem wrote:
> From: trem <tremyfr at yahoo.fr <https://lists.osdl.org/mailman/listinfo/kernel-janitors>>
> 
> This patch simply change pci_find_device by pci_get_device, because
> pci_find_device is deprecated.

But what about the reference count leak you just caused?  These are not
simple changes.

> Signed-Off-By: trem <tremyfr at yahoo.fr <https://lists.osdl.org/mailman/listinfo/kernel-janitors>>

Put full email address in here please, and no web page.

thanks,

greg k-h

--===============85458547015556441==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85458547015556441==--
