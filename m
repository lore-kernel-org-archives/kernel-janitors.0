From: Scott Feldman <sfeldma@pobox.com>
Date: Sat, 09 Oct 2004 17:05:35 +0000
Subject: [KJ] Re: [Kernel-janitors] [PATCH 2.6][10/12] prep_pci.c replace
Message-Id: <1097341535.3903.6.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============023008150062091781=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <35460000.1097192417@w-hlinder.beaverton.ibm.com>
In-Reply-To: <35460000.1097192417@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, benh@kernel.crashing.org, paulus@samba.org, greg@kroah.com

--===============023008150062091781==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2004-10-07 at 16:40, Hanna Linder wrote:
> @@ -1102,7 +1102,7 @@ prep_pib_init(void)
>  		}
>  	}
>  
> -	if ((dev = pci_find_device(PCI_VENDOR_ID_WINBOND,
> +	if ((dev = pci_get_device(PCI_VENDOR_ID_WINBOND,
>  				   PCI_DEVICE_ID_WINBOND_82C105, dev))){
>  		if (OpenPIC_Addr){
>  			/*

Missing pci_dev_put(dev) cleanup?

-scott


--===============023008150062091781==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============023008150062091781==--
