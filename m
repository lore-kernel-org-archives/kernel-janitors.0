From: Domen Puncer <domen@coderock.org>
Date: Fri, 18 Feb 2005 23:05:21 +0000
Subject: [KJ] Re: pci_find_device() in drivers/media/radio/
Message-Id: <20050218230521.GA3852@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============017169826279838318=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============017169826279838318==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Sorry for late reply.

On 02/02/05 17:22 +0100, Christophe Lucas wrote:
> Hi,
> 
> Description:
> >From : http://kerneljanitors.org/TODO
> >- delete all pci_find_* functions from the kernel tree.
> >  Instead of pci_find_device use pci_get_device()..
> >-  convert from pci_module_init to pci_register_driver

Patch per concept would be nice.

> diff -urpN -X /work/users/dontdiff linux-2.6.11-rc2-vanilla/drivers/media/radio/radio-maestro.c linux-2.6.11-rc2/drivers/media/radio/radio-maestro.c
> --- linux-2.6.11-rc2-vanilla/drivers/media/radio/radio-maestro.c	2005-01-26 08:31:14.000000000 +0100
> +++ linux-2.6.11-rc2/drivers/media/radio/radio-maestro.c	2005-02-02 15:43:24.000000000 +0100
> @@ -265,11 +265,11 @@ static int __init maestro_radio_init(voi
>  {
>  	register __u16 found=0;
>  	struct pci_dev *pcidev = NULL;
> -	while(!found && (pcidev = pci_find_device(PCI_VENDOR_ESS, 
> +	while(!found && (pcidev = pci_get_device(PCI_VENDOR_ESS, 
			you could loose trailing whitespace     ^
>  						  PCI_DEVICE_ID_ESS_ESS1968,
>  						  pcidev)))
>  		found |= radio_install(pcidev);
> -	while(!found && (pcidev = pci_find_device(PCI_VENDOR_ESS,
> +	while(!found && (pcidev = pci_get_device(PCI_VENDOR_ESS,
>  						  PCI_DEVICE_ID_ESS_ESS1978, 
>  						  pcidev)))
>  		found |= radio_install(pcidev);
> @@ -316,6 +316,7 @@ static __u16 radio_install(struct pci_de
>  	if(radio_power_on(&radio_unit)) {
>  		if(video_register_device(&maestro_radio, VFL_TYPE_RADIO, radio_nr)==-1) {
>  			printk("radio-maestro: can't register device!");
> +			pci_dev_put(pcidev);
>  			return 0;
>  		}
>  		printk(KERN_INFO "radio-maestro: version "
> @@ -326,7 +327,9 @@ static __u16 radio_install(struct pci_de
>  		       "\n");
>  		printk(KERN_INFO "radio-maestro: radio chip initialized\n");
>  		return 1;
> -	} else
> +	} else {
> +		pci_dev_put(pcidev); 
ditto.

>  		return 0;   
> +	}
>  }

Whitespace is nitpicking. :-)
About pci_dev_put... it should probably also be in _exit paths, so module
can be reinserted?

Comments?


	Domen

--===============017169826279838318==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============017169826279838318==--
