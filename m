From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 15 Jan 2018 09:10:07 +0000
Subject: Re: [PATCH] drm/sun4i: Fix error code in sun4i_tcon_bind()
Message-Id: <20180115091007.bii37i6xccy757mh@flea.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="d5mnt7t36td3rtnx"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180115081113.wlam5wkmdynisf4r@mwanda>
In-Reply-To: <20180115081113.wlam5wkmdynisf4r@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org


--d5mnt7t36td3rtnx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2018 at 11:11:13AM +0300, Dan Carpenter wrote:
> We accidentally passed the wrong variable to PTR_ERR().
>=20
> Fixes: a0c1214e4764 ("drm/sun4i: Add LVDS support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--d5mnt7t36td3rtnx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpcb+4ACgkQ0rTAlCFN
r3Sl5A//a/eZcL9pDdw1X8msUZD/osrhrGbABThJY6jNsaj5i6NNkeDw02smFYjp
iRXZb3Xk6PKPFqNIBp19jNLJ7yRdF39IYj5DK98tUkMcJzu40JjW6FnK8FpjZM6g
/nsKtjstfVMCdaMbwHtsAi8ApoIwbBN/1wVdrCLMgBH+SPjlSfM4o5DJ+sSywcta
E5qpTvmtsyxYGW76qm8Nl7FBoO/3olnL8VmqWuhgs6sjFvZQuDbLbQF5IwSMG6pN
ilR4nkacEaF50hBT7q6lyimMyHw7pskc64jrare5XTnT3RwVSjepmwYASF70wwM5
+TwN4gqa5WrAmle/TklmKZNLF1AbJ2d35uAvmfjowoykOvl0puqLTuQKa0IOZ66T
MmgBQJOojOMfetKBn5RBUC5REephDkihPx9PNTZA2rBF0vVjWbgfgpU3UClYWHPz
24ftwNDP+9+4g8WNiInz+MOyw62fGgZAlnoPX9QRH6Xj9M+mYap9FrjK8P3SBZNf
D6xdcsFv/iM8mdiDgNlvfRcGXKO6mtdgACGMy5tdBqgfiscjF3VVYMB56oIkUjXP
jkEOnvGWQln9Hdh0BIn3qtwZtNa/jpxh4GMsvLHz74C9ZLsALN+C5j+fG1LzurmF
LqHUYpYOm7DJ4w+90A4jFlBHp0lf4pSAJk9skXo0H13FkfPHUZs=
=WN+p
-----END PGP SIGNATURE-----

--d5mnt7t36td3rtnx--
