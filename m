From: Matthew Wilcox <willy@debian.org>
Date: Mon, 20 Sep 2004 11:39:44 +0000
Subject: Re: [Kernel-janitors] pci_find_* to pci_get_*
Message-Id: <20040920113944.GO642@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61377858444041244=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============61377858444041244==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 20, 2004 at 01:20:20AM -0700, Scott Feldman wrote:
> diff -Nru a/drivers/net/e1000/e1000_main.c b/drivers/net/e1000/e1000_main.c
> --- a/drivers/net/e1000/e1000_main.c	2004-09-20 00:25:03 -07:00
> +++ b/drivers/net/e1000/e1000_main.c	2004-09-20 00:25:03 -07:00
> @@ -2789,9 +2789,10 @@
>  	case SYS_DOWN:
>  	case SYS_HALT:
>  	case SYS_POWER_OFF:
> -		while((pdev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
> +		while((pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pdev))) {
>  			if(pci_dev_driver(pdev) == &e1000_driver)
>  				e1000_suspend(pdev, 3);
> +			pci_dev_put(pdev);
>  		}
>  	}
>  	return NOTIFY_DONE;

Ummm... there's still a race here.  Between the pci_dev_put() returning and
the invocation of pci_get_device(), the pdev can go away.  I guess you have
to do something like:

	for (;;) {
		old_pdev = pdev;
		pdev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, old_pdev);
		pci_dev_put(old_pdev);
		if (!pdev)
			break;
		if (pci_dev_driver(pdev) == &e1000_driver)
			e1000_suspend(pdev, 3);
	}

This seems to be quite a common idiom though.  I wonder if we can
encapsulate it into

	for_each_pci_device(PCI_ANY_ID, PCI_ANY_ID, pdev, tmp) {
		if (pci_dev_driver(pdev) == &e1000_driver)
			e1000_suspend(pdev, 3);
	}

This should do it:

#define NEXT_DEV(vendid, devid, pdev, tmp) \
	tmp = pdev, pdev = pci_get_device(vendid, devid, tmp), pci_dev_put(tmp)
#define for_each_pci_device(vendid, devid, pdev, tmp)	\
	for (NEXT_DEV(vendid, devid, pdev, tmp);	\
	     pdev;					\
	     NEXT_DEV(vendid, devid, pdev, tmp))

Comments?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============61377858444041244==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61377858444041244==--
