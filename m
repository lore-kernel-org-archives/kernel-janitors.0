From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 02 Jun 2004 13:57:10 +0000
Subject: Re: [Kernel-janitors] [Patch] drvdata replacement in drv/eisa
Message-Id: <20040602065710.6ad9e73c.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21556280376387682=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040602091820.GA477@nlx.t-online.de>
In-Reply-To: <20040602091820.GA477@nlx.t-online.de>
To: kernel-janitors@vger.kernel.org

--===============21556280376387682==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 2 Jun 2004 11:18:20 +0200 yoonsoo@web.de wrote:

| another cosmetical patch.

Cosmetically, please use a SPACE character after each ','.


| diff -uprN -X dontdiff linux-2.6.6-orig/drivers/eisa/pci_eisa.c linux-2.6.6-new/drivers/eisa/pci_eisa.c
| --- linux-2.6.6-orig/drivers/eisa/pci_eisa.c	2004-05-10 04:32:01.000000000 +0200
| +++ linux-2.6.6-new/drivers/eisa/pci_eisa.c	2004-05-26 17:11:36.000000000 +0200
| @@ -31,7 +31,7 @@ static int __devinit pci_eisa_init (stru
|  	}
|  
|  	pci_eisa_root.dev              = &pdev->dev;
| -	pci_eisa_root.dev->driver_data = &pci_eisa_root;
| +	dev_set_drvdata(pci_eisa_root.dev,&pci_eisa_root);
|  	pci_eisa_root.res	       = pdev->bus->resource[0];
|  	pci_eisa_root.bus_base_addr    = pdev->bus->resource[0]->start;
|  	pci_eisa_root.slots	       = EISA_MAX_SLOTS;
| diff -uprN -X dontdiff linux-2.6.6-orig/drivers/eisa/virtual_root.c linux-2.6.6-new/drivers/eisa/virtual_root.c
| --- linux-2.6.6-orig/drivers/eisa/virtual_root.c	2004-05-10 04:32:54.000000000 +0200
| +++ linux-2.6.6-new/drivers/eisa/virtual_root.c	2004-05-26 17:12:28.000000000 +0200
| @@ -58,7 +58,7 @@ static int virtual_eisa_root_init (void)
|  
|  	eisa_bus_root.force_probe = force_probe;
|  	
| -	eisa_root_dev.dev.driver_data = &eisa_bus_root;
| +	dev_set_drvdata(eisa_root_dev.dev,&eisa_bus_root);
|  
|  	if (eisa_root_register (&eisa_bus_root)) {
|  		/* A real bridge may have been registered before
| 


--
~Randy

--===============21556280376387682==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21556280376387682==--
