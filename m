From: mcgrof@ruslug.rutgers.edu (Luis R. Rodriguez)
Date: Fri, 25 Mar 2005 04:35:07 +0000
Subject: [KJ] Re: [UPDATE PATCH 16/16]
Message-Id: <20050325043507.GP6811@ruslug.rutgers.edu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48931411547721582=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--===============48931411547721582==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AsxXAMtlQ5JHofzM"
Content-Disposition: inline


--AsxXAMtlQ5JHofzM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 19, 2005 at 10:47:44PM +0100, Tobias Klauser wrote:
> The previous patch did not compile cleanly on all architectures so
> here's a fixed one.
>=20
> Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
> pci_set_dma_mask() or pci_set_consistent_dma_mask()
> This patch includes dma-mapping.h explicitly because it caused errors
> on some architectures otherwise.
> See http://marc.theaimsgroup.com/?t=3D108001993000001&r=3D1&w=3D2 for det=
ails
>=20
> Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>
>=20
> --- linux-2.6.11.orig/drivers/net/wireless/prism54/islpci_hotplug.c	2005-=
03-02 12:50:28.000000000 +0100
> +++ linux-2.6.11/drivers/net/wireless/prism54/islpci_hotplug.c	2005-03-19=
 20:33:01.000000000 +0100
> @@ -21,6 +21,7 @@
>  #include <linux/version.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/dma-mapping.h>
>  #include <linux/delay.h>
>  #include <linux/init.h> /* For __init, __exit */
> =20
> @@ -125,7 +126,7 @@ prism54_probe(struct pci_dev *pdev, cons
>  	}
> =20
>  	/* enable PCI DMA */
> -	if (pci_set_dma_mask(pdev, 0xffffffff)) {
> +	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
>  		printk(KERN_ERR "%s: 32-bit PCI DMA not supported", DRV_NAME);
>  		goto do_pci_disable_device;
>          }

This is fine and has been in prism54 latest svn repos for a while.

	Luis

--=20
GnuPG Key fingerprint =3D 113F B290 C6D2 0251 4D84  A34A 6ADD 4937 E20A 525E

--AsxXAMtlQ5JHofzM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCQ5T7at1JN+IKUl4RAvrBAKCZ/DeTS3F74Ey5zIZ252Oiso4TWwCfQtbg
Noeo0aBi+TWAywy7iqUZI1I=
=nY/a
-----END PGP SIGNATURE-----

--AsxXAMtlQ5JHofzM--

--===============48931411547721582==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48931411547721582==--
