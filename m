From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Wed, 27 Jun 2012 13:25:08 +0000
Subject: Re: [PATCH] Atmel NAND ECC: Remove unaffected config option
Message-Id: <1340803508.3070.6.camel@sauron.fi.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-hUCwcmOyEax2dBgt0Oxe"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1340371768-24703-1-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1340371768-24703-1-git-send-email-richard.genoud@gmail.com>
To: linux-arm-kernel@lists.infradead.org


--=-hUCwcmOyEax2dBgt0Oxe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-06-22 at 15:29 +0200, Richard Genoud wrote:
> The commit bf4289cba02b8cf770ecd7959ca70839f0dd9d3c removed the use of
> CONFIG_MTD_NAND_ATMEL_ECC_NONE and CONFIG_MTD_NAND_ATMEL_ECC_HW but the
> Kconfig file was forgotten.
>=20
> This patch remove those inoperative options.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>  arch/arm/configs/afeb9260_defconfig    |    1 -
>  arch/arm/configs/at91sam9263_defconfig |    1 -
>  arch/arm/configs/qil-a9260_defconfig   |    1 -
>  arch/arm/configs/usb-a9260_defconfig   |    1 -

I've dropped these changes.

>  drivers/mtd/nand/Kconfig               |   40 --------------------------=
------

And pushed Kconfig changes to l2-mtd.git, thank you!

http://git.infradead.org/users/dedekind/l2-mtd.git/commit/61251f029c8d11683=
70db922a22ac4d0d7df3b8b
--=20
Best Regards,
Artem Bityutskiy

--=-hUCwcmOyEax2dBgt0Oxe
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6wm0AAoJECmIfjd9wqK0bFgP+wWGK04GRp8mU+lK1j9XiTli
zaTBdvM37j9mqlsH+F12wB1pwlF68wzr8MRBTY1yTsPBe3q+fYm/FbDJwCRTzyN7
uhIhbQa05vsrXem4UifIaFnVrMpaJem0mzCGQq3FUWnqoksJyvs3AwJkNgAqm9Rq
mfv7/+mEhbeTm7kU1G8nhPY/XuYhUQffVswvlmv9Jzsb/QzF44UjObcEK/7cfkMP
L8WTEsUwlpQm4tmTrhfLC1KVerFlS1Rlc5YIk8Mwle/yh1xlV2NWuYu2apDM5HYE
4D7y1Rcf5XtyYj3wi+dethqtHlsGOtJfYyEzCMXS5oldjtgotuwJl7mzyBrgWL2w
U8yk2fwTTexPSHbCBv0du2e31awWO87tydZW7zncz9Eu5LeRNgriEszWFI6QJVGW
plEbyXfTJzBlbNnIyoW7l+mSwqtNc+CX2v6vOfYbRdNIC0fOsWEV/11kiTCG7qCK
mIhrZ99ItyL8dpubILFVIWFAgoSUMCkni6uY1jLwREVDqThuCp+/OGYuFWUpBfrL
qVhD60udz+Ck8Pp4irDhshnbLsxTqaTARV3WyQq2L/SRHvp/qnz7TrhbMI1Qoi0n
guxKew8wo3O9QGyFKQfexQ8NpO0LW8w3tYWF/NHEAF5Wcxv41EURi2E45gAPk2fX
NkJG943oGUR94fXCIrT1
=nJht
-----END PGP SIGNATURE-----

--=-hUCwcmOyEax2dBgt0Oxe--

