From: Greg KH <greg@kroah.com>
Date: Mon, 09 Jan 2006 17:07:46 +0000
Subject: Re: [KJ] linux-2.6.15-rc7/drivers/pci/syscall.c
Message-Id: <20060109170742.GB20698@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92090407959343756=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200601091138.03704.cneira@srb.cl>
In-Reply-To: <200601091138.03704.cneira@srb.cl>
To: kernel-janitors@vger.kernel.org

--===============92090407959343756==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 09, 2006 at 11:38:03AM +0000, carlos neira wrote:
> Greetings :
> 
> patch :linux-2.6.15-rc7/drivers/pci/syscall.c
> 
> replaced a  lock_kernel with spinlocks  , compile tested ok

What arch did you compile this for?

And why remove the lock_kernel calls here, are they hurting anything?

thanks,

greg k-h

--===============92090407959343756==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92090407959343756==--
