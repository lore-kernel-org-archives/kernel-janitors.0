From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Date: Mon, 01 May 2017 09:08:10 +0000
Subject: Re: [PATCH 0/2] HSI: Fine-tuning for three function implementations
Message-Id: <20170501090809.xwvmf6bdkbj5dkze@earth>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="is77g4fm2i4hwb3g"
List-Id: <kernel-janitors.vger.kernel.org>
References: <52f7db50-a3a0-6bc5-a39f-1d235a5945cd@users.sourceforge.net>
In-Reply-To: <52f7db50-a3a0-6bc5-a39f-1d235a5945cd@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--is77g4fm2i4hwb3g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 25, 2017 at 02:43:25PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 25 Apr 2017 14:32:10 +0200
>=20
> Two update suggestions were taken into account
> from static source code analysis.
>=20
> Markus Elfring (2):
>   Use kcalloc() in hsi_register_board_info()
>   core: Use kcalloc() in two functions
>=20
>  drivers/hsi/hsi_boardinfo.c | 2 +-
>  drivers/hsi/hsi_core.c      | 7 +++----
>  2 files changed, 4 insertions(+), 5 deletions(-)

Thanks for your patchset. We are currently in the merge
window and your patch will appear in linux-next once
4.12-rc1 has been tagged by Linus Torvalds.

Until then I queued it into this branch:

https://git.kernel.org/cgit/linux/kernel/git/sre/linux-hsi.git/log/?h=3Dfor=
-next-next

-- Sebastian

--is77g4fm2i4hwb3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAlkG+vkACgkQ2O7X88g7
+po56A//Q+diP7WUycnsxu8r+S/rUx0bJXr2NrmHKBS0G/L5Y8EPoMiOvah61lsh
++m27qemE1aZGGaxy9Er4kJsfURX8MMe4GYUm8QjP02CqEa7VpffCLdEh8BA+4aS
W3Ebk9rKWIehqMRFN2TbS8nm2zJyqQKQhQibl0THiid/iTe6v337ups3D4yaIlgW
yg9/4oLRzDt11B13YUPBY8Qdv5IY04t6GEB1UMEqcVh32TAfVUZXtQlLRxsSNCJd
vAPUFq1qdgEvWKm5BicRFOJTbmegdQMK3ZWXeIlm1zMdFQHXd50y6FCJo11hA/a9
su991n58FTWcXnSExqBFu8qFc7T6REUC42iErN09OG3VvJr9EH7UdsJArPdoZnwy
ewr9ZMZdpW6W3Ff1sIBWXwlgt9/IAs5tmYbjva+H2c4sJsixrx/S8zaNeOfGsrVc
pv4fKmwz07zTmeacxycELjjJAjcHBC4QcQMeXlwmdM3FyEOORLtZO48kJKKLy90F
kxTvEC9+gOAlk4jO8YYEWaqYEwsPdmud7CQa2qLLow2pKdyrh7d7ARWhhH067GK0
ngzMOnu0JCn3KAbmyuJSQeYn9umn1ip7ypWO2tGaIFPAAjF9FzMAI5NdnTUOfqnK
dOXTA9XK6m0Yfs5aLHAZW0dkTZqx8lb5/8bQMKleQs34PoOhGYU=
=VzF3
-----END PGP SIGNATURE-----

--is77g4fm2i4hwb3g--
