From: Nicolas Kaiser <nikai@nikai.net>
Date: Thu, 21 Oct 2004 23:56:29 +0000
Subject: Re: [KJ] [PATCH 2.6] drm_drv.h: replace pci_find_device
Message-Id: <20041022015629.7cc59769@lucky.kitzblitz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============074744286014935213=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <258330000.1098383145@w-hlinder.beaverton.ibm.com>
In-Reply-To: <258330000.1098383145@w-hlinder.beaverton.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============074744286014935213==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

* Hanna Linder <hannal@us.ibm.com>:
>  
>  	DRM(mem_init)();
>  
> -	while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev)) != NULL) {
> +	for_each_pci_dev(pdev) 
                              ^
trailing whitespace?

Cheers,
n.

--===============074744286014935213==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============074744286014935213==--
