From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Date: Mon, 14 Feb 2005 17:52:51 +0000
Subject: [KJ] Re: [PATCH 8/18] drivers/mtd/ remove pci_find_{device, subsys}
Message-Id: <20050214175251.GA28755@wohnheim.fh-wedel.de>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <200502141122.11786.amitg@calsoftinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Amit Gud <amitg@calsoftinc.com>
Cc: kernel-janitors@lists.osdl.org, joern@wh.fh-wedel.de, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, gud@eth.net

Looks fairly simple, but I've never dealt with pci_find_device(), so
my voice doesn't count.

dwmw2, is this ok?

On Mon, 14 February 2005 11:22:06 +0530, Amit Gud wrote:
>=20
> Remove deprecated pci_find_device and pci_find_subsys
>=20
>=20
> AG
> --
> May the source be with you
>=20
>=20
> Signed-off-by: Amit Gud <gud@eth.net>
>=20
>=20
> diff -uprN orig/drivers/mtd/devices/pmc551.c linux-2.6.11-rc3/drivers/mtd=
/devices/pmc551.c
> --- orig/drivers/mtd/devices/pmc551.c	2005-02-11 15:19:47.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/devices/pmc551.c	2005-02-14 02:34:15.000=
000000 +0530
> @@ -680,7 +680,7 @@ static int __init init_pmc551(void)
>           */
>          for( count =3D 0; count < MAX_MTD_DEVICES; count++ ) {
> =20
> -                if ((PCI_Device =3D pci_find_device(PCI_VENDOR_ID_V3_SEM=
I,
> +                if ((PCI_Device =3D pci_get_device(PCI_VENDOR_ID_V3_SEMI,
>                                                    PCI_DEVICE_ID_V3_SEMI_=
V370PDC,
>  						  PCI_Device ) ) =3D NULL) {
>                          break;
> diff -uprN orig/drivers/mtd/maps/amd76xrom.c linux-2.6.11-rc3/drivers/mtd=
/maps/amd76xrom.c
> --- orig/drivers/mtd/maps/amd76xrom.c	2005-02-11 15:19:47.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/maps/amd76xrom.c	2005-02-14 02:34:21.000=
000000 +0530
> @@ -304,7 +304,7 @@ static int __init init_amd76xrom(void)
>  	struct pci_device_id *id;
>  	pdev =3D NULL;
>  	for(id =3D amd76xrom_pci_tbl; id->vendor; id++) {
> -		pdev =3D pci_find_device(id->vendor, id->device, NULL);
> +		pdev =3D pci_get_device(id->vendor, id->device, NULL);
>  		if (pdev) {
>  			break;
>  		}
> diff -uprN orig/drivers/mtd/maps/ich2rom.c linux-2.6.11-rc3/drivers/mtd/m=
aps/ich2rom.c
> --- orig/drivers/mtd/maps/ich2rom.c	2004-10-19 03:25:35.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/maps/ich2rom.c	2005-02-14 02:34:26.00000=
0000 +0530
> @@ -288,7 +288,7 @@ int __init init_ich2rom(void)
>  	struct pci_device_id *id;
>  	pdev =3D NULL;
>  	for(id =3D ich2rom_pci_tbl; id->vendor; id++) {
> -		pdev =3D pci_find_device(id->vendor, id->device, NULL);
> +		pdev =3D pci_get_device(id->vendor, id->device, NULL);
>  		if (pdev) {
>  			break;
>  		}
> diff -uprN orig/drivers/mtd/maps/ichxrom.c linux-2.6.11-rc3/drivers/mtd/m=
aps/ichxrom.c
> --- orig/drivers/mtd/maps/ichxrom.c	2005-02-11 15:19:47.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/maps/ichxrom.c	2005-02-14 02:34:31.00000=
0000 +0530
> @@ -356,7 +356,7 @@ static int __init init_ichxrom(void)
> =20
>  	pdev =3D NULL;
>  	for (id =3D ichxrom_pci_tbl; id->vendor; id++) {
> -		pdev =3D pci_find_device(id->vendor, id->device, NULL);
> +		pdev =3D pci_get_device(id->vendor, id->device, NULL);
>  		if (pdev) {
>  			break;
>  		}
> diff -uprN orig/drivers/mtd/maps/l440gx.c linux-2.6.11-rc3/drivers/mtd/ma=
ps/l440gx.c
> --- orig/drivers/mtd/maps/l440gx.c	2005-02-11 15:19:47.000000000 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/maps/l440gx.c	2005-02-14 02:34:44.000000=
000 +0530
> @@ -62,10 +62,10 @@ static int __init init_l440gx(void)
>  	struct resource *pm_iobase;
>  	__u16 word;
> =20
> -	dev =3D pci_find_device(PCI_VENDOR_ID_INTEL,=20
> +	dev =3D pci_get_device(PCI_VENDOR_ID_INTEL,=20
>  		PCI_DEVICE_ID_INTEL_82371AB_0, NULL);
> =20
> -	pm_dev =3D pci_find_device(PCI_VENDOR_ID_INTEL,=20
> +	pm_dev =3D pci_get_device(PCI_VENDOR_ID_INTEL,=20
>  		PCI_DEVICE_ID_INTEL_82371AB_3, NULL);
> =20
>  	if (!dev || !pm_dev) {
> diff -uprN orig/drivers/mtd/maps/scx200_docflash.c linux-2.6.11-rc3/drive=
rs/mtd/maps/scx200_docflash.c
> --- orig/drivers/mtd/maps/scx200_docflash.c	2005-02-11 15:19:47.000000000=
 +0530
> +++ linux-2.6.11-rc3/drivers/mtd/maps/scx200_docflash.c	2005-02-14 02:34:=
50.000000000 +0530
> @@ -88,7 +88,7 @@ static int __init init_scx200_docflash(v
> =20
>  	printk(KERN_DEBUG NAME ": NatSemi SCx200 DOCCS Flash Driver\n");
> =20
> -	if ((bridge =3D pci_find_device(PCI_VENDOR_ID_NS,=20
> +	if ((bridge =3D pci_get_device(PCI_VENDOR_ID_NS,=20
>  				      PCI_DEVICE_ID_NS_SCx200_BRIDGE,
>  				      NULL)) =3D NULL)
>  		return -ENODEV;

J=F6rn

--=20
Optimizations always bust things, because all optimizations are, in
the long haul, a form of cheating, and cheaters eventually get caught.
-- Larry Wall=20
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
