From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 27 Jun 2018 06:52:57 +0000
Subject: Re: mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver
Message-Id: <20180627085257.67aa1eb8@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <993e40ac-1f06-c2ee-e9fb-4523df368cb7@canonical.com>
In-Reply-To: <993e40ac-1f06-c2ee-e9fb-4523df368cb7@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin Ian King <colin.king@canonical.com>
Cc: Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, Dmitry Osipenko <digetx@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, linux-mtd@lists.infradead.org

Hi Colin, Stefan,

+linux-mtd

Thanks Colin for the report.

On Tue, 26 Jun 2018 16:18:29 +0100, Colin Ian King
<colin.king@canonical.com> wrote:

> Hi there,
>=20
> Static analysis with CoverityScan reported a potential issue with the
> following commit:
>=20
> commit 0f7b126ca91101d02d525f7cc880e8c71202a2b7
> Author: Stefan Agner <stefan@agner.ch>
> Date:   Sun Jun 24 23:27:25 2018 +0200
>=20
>     mtd: rawnand: add NVIDIA Tegra NAND Flash controller driver
>=20
>=20
> in function tegra_nand_cmd it looks like there maybe potential to pass a
> negative value in size into memcpy():
>=20
>         case NAND_OP_DATA_OUT_INSTR:
>=20
> negative_return_fn: Function nand_subop_get_data_len(subop, op_id)
> returns a negative number.
>=20
> var_assign: Assigning: unsigned variable size =3D nand_subop_get_data_len.
>=20
>                 size =3D nand_subop_get_data_len(subop, op_id);
>                 offset =3D nand_subop_get_data_start_off(subop, op_id);

Stefan,

I thought a bit about this and I don't think the right place for such a
fix are the NAND controller drivers (marvell and vf610 have the same
issue). Both nand_subop_get_data/addr_len/start_off() are core helpers
and their result is predictable in a manner that only a bug in your
parsing function would trigger an error value. I think this is safe for
the four helpers to have WARN_ON() on the error conditions to catch
the developer's attention and just return (unsigned int) 0 in this case.

I will propose something soon.

Thanks,
Miqu=C3=A8l
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
