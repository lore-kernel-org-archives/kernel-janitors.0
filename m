From: Greg KH <greg@kroah.com>
Date: Tue, 21 Sep 2004 22:54:25 +0000
Subject: [Kernel-janitors] Re: [PATCH -mm 2/9] pci_find_device to
Message-Id: <20040921225425.GD16690@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82315016874234193=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82315016874234193==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2004 at 11:52:35PM -0700, Scott Feldman wrote:
> Use pci_get_device instead of pci_find_device as pci device returned
> from pci_find_device can disappear at any momemt in time.
> 
> Signed-off-by: Scott Feldman <sfeldma@pobox.com>
> 
> diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/fc/iph5526.c linux-2.6.9-rc2-mm1-dsf/drivers/net/fc/iph5526.c
> --- linux-2.6.9-rc2-mm1/drivers/net/fc/iph5526.c	2004-08-14 03:54:51.000000000 -0700
> +++ linux-2.6.9-rc2-mm1-dsf/drivers/net/fc/iph5526.c	2004-09-20 22:43:58.022996008 -0700
> @@ -3711,7 +3711,7 @@ int iph5526_detect(Scsi_Host_Template *t
>  		fc[i] = NULL;
>  
>  	for (i = 0; clone_list[i].vendor_id != 0; i++)
> -	while ((pdev = pci_find_device(clone_list[i].vendor_id, clone_list[i].device_id, pdev))) {
> +	while ((pdev = pci_get_device(clone_list[i].vendor_id, clone_list[i].device_id, pdev))) {

Ick, this needs to be converted to use the probe/release functions
instead of "fixing" it in this manner.

thanks,

greg k-h

--===============82315016874234193==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82315016874234193==--
