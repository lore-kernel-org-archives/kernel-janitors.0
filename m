From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:41:54 +0000
Subject: Re: [KJ] [PATCH 17/18] sound/pci/ remove pci_find_{device, subsys}
Message-Id: <20050214184153.GH7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86278965130319452=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141202.39179.amitg@calsoftinc.com>
In-Reply-To: <200502141202.39179.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============86278965130319452==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 12:02:37PM +0530, Amit Gud wrote:
> Remove deprecated pci_find_device and pci_find_subsys
> 
> Do consider applying.
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> diff -uprN orig/sound/pci/ali5451/ali5451.c linux-2.6.11-rc3/sound/pci/ali5451/ali5451.c
> --- orig/sound/pci/ali5451/ali5451.c	2005-02-11 15:20:12.000000000 +0530
> +++ linux-2.6.11-rc3/sound/pci/ali5451/ali5451.c	2005-02-14 05:37:04.000000000 +0530
> @@ -314,7 +314,7 @@ static void ali_read_cfg(unsigned int ve
>  	int i,j;
>  
>  
> -        pci_dev = pci_find_device(vendor, deviceid, pci_dev);
> +        pci_dev = pci_get_device(vendor, deviceid, pci_dev);
>          if (pci_dev == NULL)
>                  return ;
>  

No, improper replacement.  Please do not apply.

thanks,

greg k-h

--===============86278965130319452==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86278965130319452==--
