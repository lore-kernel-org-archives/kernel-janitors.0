From: Scott Feldman <sfeldma@pobox.com>
Date: Sat, 09 Oct 2004 17:15:34 +0000
Subject: Re: [KJ] [RFT 2.6] pci-gart.c replace pci_find_device with
Message-Id: <1097342134.3903.14.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5823818372489673=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <87680000.1097276112@w-hlinder.beaverton.ibm.com>
In-Reply-To: <87680000.1097276112@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, ak@suse.de

--===============5823818372489673==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2004-10-08 at 15:55, Hanna Linder wrote:
> @@ -81,7 +81,7 @@ static u32 gart_unmapped_entry; 
>  
>  #define for_all_nb(dev) \
>  	dev = NULL;	\
> -	while ((dev = pci_find_device(PCI_VENDOR_ID_AMD, 0x1103, dev))!=NULL)\
> +	while ((dev = pci_get_device(PCI_VENDOR_ID_AMD, 0x1103, dev))!=NULL)\
>  	     if (dev->bus->number == 0 && 				     \
>  		    (PCI_SLOT(dev->devfn) >= 24) && (PCI_SLOT(dev->devfn) <= 31))

for_each_pci_dev?

-scott


--===============5823818372489673==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5823818372489673==--
