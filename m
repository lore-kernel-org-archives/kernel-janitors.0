From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 21 Sep 2004 07:40:15 +0000
Subject: Re: [Kernel-janitors] [PATCH -mm 4/9] pci_find_device to
Message-Id: <20040921084015.C20511@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92765998564501495=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095749570.3790.89.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095749570.3790.89.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============92765998564501495==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2004 at 11:52:50PM -0700, Scott Feldman wrote:
> Use pci_get_device instead of pci_find_device as pci device returned
> from pci_find_device can disappear at any momemt in time.


Should be using ->shutdown, again..

> 
> Signed-off-by: Scott Feldman <sfeldma@pobox.com>
> 
> diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/ixgb/ixgb_main.c linux-2.6.9-rc2-mm1-dsf/drivers/net/ixgb/ixgb_main.c
> --- linux-2.6.9-rc2-mm1/drivers/net/ixgb/ixgb_main.c	2004-09-20 22:36:24.000000000 -0700
> +++ linux-2.6.9-rc2-mm1-dsf/drivers/net/ixgb/ixgb_main.c	2004-09-20 22:49:55.329677136 -0700
> @@ -2078,7 +2078,7 @@ ixgb_notify_reboot(struct notifier_block
>  	case SYS_DOWN:
>  	case SYS_HALT:
>  	case SYS_POWER_OFF:
> -		while ((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
> +		while ((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
>  			if (pci_dev_driver(pdev) == &ixgb_driver)
>  				ixgb_suspend(pdev, 3);
>  		}
> 
> 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

---end quoted text---

--===============92765998564501495==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92765998564501495==--
