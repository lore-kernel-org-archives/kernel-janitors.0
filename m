From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 13 Jan 2016 21:20:45 +0000
Subject: fsl/fman: Clarification for implementation details in dtsec_config()
Message-Id: <5696BFAD.9030905@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Igal Liberman <igal.liberman@freescale.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Hello,

The Coccinelle semantic patch "deref_null.cocci" pointed out a potential
problem in the implementation of the function "dtsec_config" (lines 1434-14=
39):
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drive=
rs/net/ethernet/freescale/fman/fman_dtsec.c?id=E5a03bfd873c29eb786655ef2e95=
e53ed242b404#n1434
=E2=80=A6
	dtsec->tbiphy =3D of_phy_find_device(params->internal_phy_node);
	if (!dtsec->tbiphy) {
		pr_err("of_phy_find_device (TBI PHY) failed\n");
		put_device(&dtsec->tbiphy->mdio.dev);
		goto err_dtsec_drv_param;
	}
=E2=80=A6

If the pointer "dtsec->tbiphy" is NULL, then it will especially matter
if the shown address computation will succeed.
Should the call of the function "put_device" be removed,
or was another argument intended?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
