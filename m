From: Scott Feldman <sfeldma@pobox.com>
Date: Sat, 09 Oct 2004 17:02:01 +0000
Subject: [KJ] Re: [Kernel-janitors] [PATCH 2.6][9/12] pplus.c replace
Message-Id: <1097341320.3903.3.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============018871904612617563=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <33930000.1097191565@w-hlinder.beaverton.ibm.com>
In-Reply-To: <33930000.1097191565@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, benh@kernel.crashing.org, paulus@samba.org, greg@kroah.com

--===============018871904612617563==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2004-10-07 at 16:26, Hanna Linder wrote:
> -	if ((dev = pci_find_device(PCI_VENDOR_ID_WINBOND,
> +	if ((dev = pci_get_device(PCI_VENDOR_ID_WINBOND,
>  				   PCI_DEVICE_ID_WINBOND_82C105, dev))) {
>  		/*
>  		 * Disable LEGIRQ mode so PCI INTS are routed

Missing cleanup at the bottom of func?

	if(dev)
		pci_dev_put(dev);

-scott


--===============018871904612617563==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============018871904612617563==--
