From: Greg KH <greg@kroah.com>
Date: Fri, 28 May 2004 20:35:54 +0000
Subject: [Kernel-janitors] Re: [PATCH] - fix pci/probe.c possible NULL
Message-Id: <20040528203553.GF9803@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67132980602988246=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67132980602988246==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 27, 2004 at 04:12:32PM -0300, Luiz Fernando N. Capitulino wrote:
> 
>  Hi,
> 
>  In drivers/pci/probe.c::pci_scan_bridge() the call for pci_alloc_child_bus()
> can return NULL, but it is not handled by the function (detected by
> Coverity's checker).
> 
>  The patch bellow fix that returning `max' if we got the NULL, but
> I do not know if it is right. I guess it is, because in that case
> the function will act in the same way as with `pass != 0'.

Looks good enough.  Better than an oops :)

Applied, thanks.

greg k-h

--===============67132980602988246==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67132980602988246==--
