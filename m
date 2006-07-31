From: Patrik Kullman <patrik@yes.nu>
Date: Mon, 31 Jul 2006 19:58:42 +0000
Subject: Re: [KJ]
Message-Id: <1154375922.2813.13.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1106245529.15916.12.camel@base.torri.org>
In-Reply-To: <1106245529.15916.12.camel@base.torri.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On m=E5n, 2006-07-31 at 08:51 +0200, Henne wrote:
> >> Signed-off-by: Patrik Kullman <patrik@yes.nu>
> >> --- linux-2.6.17/drivers/char/watchdog/alim1535_wdt.c	2006-06-18 03:49=
:35.000000000 +0200
> >> +++ linux/drivers/char/watchdog/alim1535_wdt.c	2006-07-28 07:15:00.000=
000000 +0200
> >> @@ -312,7 +312,7 @@
> >>   */
> >> =20
> >>  static struct pci_device_id ali_pci_tbl[] =3D {
> >> -	{ PCI_VENDOR_ID_AL, 0x1535, PCI_ANY_ID, PCI_ANY_ID,},
> >> +	{ PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1535, PCI_ANY_ID, PCI_ANY_ID,},
> >>  	{ 0, },
> >>  };
> Please use {PCI_DRIVER(PCI_VENDOR_ID_AL, PCI_DEVICE_ID_AL_M1535)} for tha=
t.
>=20
> Greets,
> Henne

Since I'm new here I just want to make sure..

You did mean PCI_DEVICE() ?

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
