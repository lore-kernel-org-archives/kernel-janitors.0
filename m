From: Scott Feldman <sfeldma@pobox.com>
Date: Sat, 09 Oct 2004 17:21:15 +0000
Subject: [KJ] Re: [RFT 2.6] ebus.c replace pci_find_device with
Message-Id: <1097342474.3903.19.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60293219287032995=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <87310000.1097276022@w-hlinder.beaverton.ibm.com>
In-Reply-To: <87310000.1097276022@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, davem@davemloft.net, ecd@skynet.be, jj@sunsite.ms.mff.cuni.cz, anton@samba.org

--===============60293219287032995==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2004-10-08 at 15:53, Hanna Linder wrote:
> @@ -528,7 +528,7 @@ static struct pci_dev *find_next_ebus(st
>  	struct pci_dev *pdev = start;
>  
>  	do {
> -		pdev = pci_find_device(PCI_VENDOR_ID_SUN, PCI_ANY_ID, pdev);
> +		pdev = pci_get_device(PCI_VENDOR_ID_SUN, PCI_ANY_ID, pdev);
>  		if (pdev &&
>  		    (pdev->device == PCI_DEVICE_ID_SUN_EBUS ||
>  		     pdev->device == PCI_DEVICE_ID_SUN_RIO_EBUS))

ebus_init() needs pci_put_dev(pdev) cleanup.

-scott


--===============60293219287032995==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60293219287032995==--
