From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 21 Sep 2004 07:38:55 +0000
Subject: Re: [Kernel-janitors] [PATCH -mm 1/9] pci_find_device to
Message-Id: <20040921083855.A20511@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89079015887960944=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095749544.3790.83.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095749544.3790.83.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============89079015887960944==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2004 at 11:52:24PM -0700, Scott Feldman wrote:
> Use pci_get_device instead of pci_find_device as pci device returned
> from pci_find_device can disappear at any momemt in time.

Again, this is totally the wrong change.  You should be using the proper
interface (->shutdown callback) instead.

> Signed-off-by: Scott Feldman <sfeldma@pobox.com>
> 
> diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/e1000/e1000_main.c linux-2.6.9-rc2-mm1-dsf/drivers/net/e1000/e1000_main.c
> --- linux-2.6.9-rc2-mm1/drivers/net/e1000/e1000_main.c	2004-09-20 22:36:24.000000000 -0700
> +++ linux-2.6.9-rc2-mm1-dsf/drivers/net/e1000/e1000_main.c	2004-09-20 22:40:38.257365000 -0700
> @@ -2803,7 +2803,7 @@ e1000_notify_reboot(struct notifier_bloc
>  	case SYS_DOWN:
>  	case SYS_HALT:
>  	case SYS_POWER_OFF:
> -		while((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
> +		while((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
>  			if(pci_dev_driver(pdev) == &e1000_driver)
>  				e1000_suspend(pdev, 3);
>  		}
> 
> 

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

---end quoted text---

--===============89079015887960944==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89079015887960944==--
