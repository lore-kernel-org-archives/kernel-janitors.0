From: Greg KH <greg@kroah.com>
Date: Mon, 14 Feb 2005 18:45:25 +0000
Subject: Re: [KJ] [PATCH 10/18] remove pci_find_{device, subsys}
Message-Id: <20050214184525.GO7815@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23505827233227139=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141129.22609.amitg@calsoftinc.com>
In-Reply-To: <200502141129.22609.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============23505827233227139==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 14, 2005 at 11:29:21AM +0530, Amit Gud wrote:
> Remove deprecated pci_find_device and pci_find_subsys
> 
> 
> AG
> --
> May the source be with you
> 
> 
> Signed-off-by: Amit Gud <gud@eth.net>
> 
> diff -uprN orig/drivers/parport/parport_pc.c linux-2.6.11-rc3/drivers/parport/parport_pc.c
> --- orig/drivers/parport/parport_pc.c	2005-02-11 15:19:51.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/parport/parport_pc.c	2005-02-14 02:27:04.000000000 +0530
> @@ -2966,7 +2966,7 @@ static int __init parport_pc_init_superi
>  	struct pci_dev *pdev = NULL;
>  	int ret = 0;
>  
> -	while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
> +	while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
>  		id = pci_match_device (parport_pc_pci_tbl, pdev);
>  		if (id == NULL || id->driver_data >= last_sio)
>  			continue;
> 

No, incorrect replacement, please do not apply.

greg k-h

--===============23505827233227139==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23505827233227139==--
