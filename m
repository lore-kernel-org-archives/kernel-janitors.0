From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Fri, 13 Apr 2012 16:11:18 +0000
Subject: Re: [patch] UBIFS: remove douple initialization in change_category()
Message-Id: <1334333478.13160.5.camel@sauron.fi.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-tX2aOYZVOl9XV4wr8gqB"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120401155759.GA21238@elgon.mountain>
In-Reply-To: <20120401155759.GA21238@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>


--=-tX2aOYZVOl9XV4wr8gqB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-04-01 at 18:57 +0300, Dan Carpenter wrote:
> "heap" is initialized twice.  I removed the first one, because it makes
> Smatch complain that we use "new_cat" as an offset before checking it.
>=20
> This doesn't change how the code works, it's just a cleanup.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to linux-ubifs.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-tX2aOYZVOl9XV4wr8gqB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiFAmAAoJECmIfjd9wqK0ULAQAL2L0cmWRfm7sD+pabef5GTE
wsEirMZhUexxw8n/lgxR6sIi/CAZlkXyUE7y5Mfr6kTnAbsbMt4Jl61uMrZhiQG9
TYnalXfd3OPPJute8Cj3D9AXuMLzfrmOLtaMTLMUuE9TystYqVmN96AHFWsXYFUl
sYkdw28iba3FZp5Y+66d3JtAbkgIDG9dJCJ5M2NDnVzl3DoURxbSSbJcNmb5J3c/
MuUr9iE9EjwKaxPKaQ5xFtg8pbPb/GZD30hrOGFZhvhqGufZV+45ho7QUIH8ZmLo
yJzGSxRjxwnxrR+/kGE15EUCIOZ5Af9xwkJEecruJOK4eHxjteA3zRuiDohJasnB
jj86riPtEYHA3fM+EKLC/KeVAH+EFlUebR/QQAQ9kTRMCwqR5eA3O1VGRqdGEtqP
JvsyrAI68WrSsMoZ15v12wxEytPjFnj5Kfukw5GYJ+CGBVLCmeJYCrgDbJk+Fvxx
c7Zt10jB0WhQnB9ovFvIrOxqJdj1q2g4zGdOOFAXu2qn0xEucFFPxQ5MnLdF5qLM
doEJCoh3RXnUeWeF+WyK/DstX6Kt55y6/EpbdC5vkSVqCgnfyB/ut10DCRMc7kLB
y/wvrasTR8lvkz890TZnLFXgiGD/LKNEYgUWnFnHtiBvl9XGsQtGe6qrSX7jaNr8
m+BmQIe6ZQk6ZJNqFAkZ
=8oZn
-----END PGP SIGNATURE-----

--=-tX2aOYZVOl9XV4wr8gqB--

