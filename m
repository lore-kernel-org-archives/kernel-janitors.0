From: Scott Feldman <sfeldma@pobox.com>
Date: Sat, 09 Oct 2004 17:16:17 +0000
Subject: Re: [KJ] [RFT 2.6] isa.c replace pci_find_device with pci_get_device
Message-Id: <1097342176.3903.16.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6408079569061349=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <84880000.1097274972@w-hlinder.beaverton.ibm.com>
In-Reply-To: <84880000.1097274972@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, ecd@skynet.be, anton@samba.org, jj@sunsite.ms.mff.cuni.cz, greg@kroah.com, davem@davemloft.net

--===============6408079569061349==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2004-10-08 at 15:36, Hanna Linder wrote:
> @@ -262,7 +262,7 @@ void __init isa_init(void)
>  	device = PCI_DEVICE_ID_AL_M1533;
>  
>  	pdev = NULL;
> -	while ((pdev = pci_find_device(vendor, device, pdev)) != NULL) {
> +	while ((pdev = pci_get_device(vendor, device, pdev)) != NULL) {
>  		struct pcidev_cookie *pdev_cookie;
>  		struct pci_pbm_info *pbm;
>  		struct sparc_isa_bridge *isa_br;

for_each_pci_dev?

-scott


--===============6408079569061349==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6408079569061349==--
