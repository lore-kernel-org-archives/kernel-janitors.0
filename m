From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:44:59 +0000
Subject: Re: [KJ] [PATCH 15/18] sound/core/ remove pci_find_{device, subsys}
Message-Id: <20050214184459.GN7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2655199703128801=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141154.35355.amitg@calsoftinc.com>
In-Reply-To: <200502141154.35355.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============2655199703128801==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:54:35AM +0530, Amit Gud wrote:
> Remove deprecated pci_find_device and pci_find_subsys
> 
> Do consider applying.
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> diff -uprN orig/sound/core/memalloc.c linux-2.6.11-rc3/sound/core/memalloc.c
> --- orig/sound/core/memalloc.c	2005-01-20 20:06:45.000000000 +0530
> +++ linux-2.6.11-rc3/sound/core/memalloc.c	2005-02-14 05:38:59.000000000 +0530
> @@ -552,7 +552,7 @@ static void __init preallocate_cards(voi
>  
>  	card = 0;
>  
> -	while ((pci = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pci)) != NULL) {
> +	while ((pci = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pci)) != NULL) {
>  		struct prealloc_dev *dev;
>  		unsigned int i;
>  		if (card >= SNDRV_CARDS)
> 

No, please do not apply this, it is incorrect.

thanks,

greg k-h

--===============2655199703128801==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2655199703128801==--
