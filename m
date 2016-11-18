From: Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 18 Nov 2016 13:31:53 +0000
Subject: Re: [patch] mailbox/tegra-hsp: Use after free in tegra_hsp_remove_doorbells()
Message-Id: <20161118133153.GB14358@ulmo.ba.sec>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="V0207lvV8h4k8FAm"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161118113410.GC3150@mwanda>
In-Reply-To: <20161118113410.GC3150@mwanda>
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 02:34:10PM +0300, Dan Carpenter wrote:
> We have to use the _safe version of list_for_each() because we're
> freeing the pointer as we go along.  (This might not show up testing
> depending on what config options you have enabled).
>=20
> Fixes: ed65ee43e397 ("mailbox: Add Tegra HSP driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch! I've applied this on top of the original driver patch that
Jassi acked earlier and I updated the Fixes: line with the new commit
SHA1.

Thanks,
Thierry

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYLwLIAAoJEN0jrNd/PrOhDrcP/2YXCneHiWVd6gR6Tl6P6wR4
KbliTcq2r2wzXOP9sci1dA3N+QlbQ01qMa7EIUCeKnWE+RuUH1xGEZLbpZcwu/xT
R/kQOqQFFtchZsgu2sVLsI+5Mks4gmWpcQWpxAKUVxpJuMxLoeBu7bIWoQf1AbOK
9efRjdAbIDZAq+Q9HaQeiEAMnE9hYGnGXgt5Jdyn9fPv9rheDNgUuNdZ1x0demEq
eN6HaYHmcHsVv+sUKSVdzwJeC7tSnB93Plvh3p2AM7APPhQzmwmCegwaSvTk3PRe
Fhaz0iy1eOsXRGhgtSdnkQxu/4css8RDKlAD8Wk0U6eAd7XLk8lhdvG8Y+FfrF5N
wrgXG4DdVgQfjzarAMpbKwJZbhNAFlawLXJPBHC+x/fapIjulA0yt6UIE2FBN7Sc
9zZKspdWGKmmxhYY3rKm51rnU7+xjnI0jbXHFCpgQNfxT5dCO2g9W6k6MqrKgzUJ
WGtaDYmG5BhPmAt8cGsd1NTamsJc9uFkBFHYwBYkLnScOo5GcvjxxJgWE0Inbsms
vbiy1ZDlICMQzZF6SzMNnpj99snKs6bQ2D0lRQhQJZABcA01CgoOpbb9/9nqpuY3
LAWpM7AreZYsEGYmRubaPbvrMhZ4Ryp74kU1V1F0XovJHZjzyIIL/ZzMhEZ9pTeZ
qO/fjnkrJqOkz5ZaVvhp
=8n2v
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
