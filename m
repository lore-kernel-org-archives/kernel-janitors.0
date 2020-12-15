From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 15 Dec 2020 11:37:10 +0000
Subject: Re: [PATCH] net: allwinner: Fix some resources leak in the error handling path of the probe and in t
Message-Id: <20201215113710.wh4ezrvmqbpxd5yi@gilmour>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3jnlnqak5zfuvw2l"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201214202117.146293-1-christophe.jaillet@wanadoo.fr>
 <20201215085655.ddacjfvogc3e33vz@gilmour>
 <20201215091153.GH2809@kadam>
In-Reply-To: <20201215091153.GH2809@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: song.bao.hua@hisilicon.com, jernej.skrabec@siol.net, f.fainelli@gmail.com, leon@kernel.org, timur@kernel.org, netdev@vger.kernel.org, wangyunjian@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, wens@csie.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kuba@kernel.org, sr@denx.de, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com


--3jnlnqak5zfuvw2l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 12:11:53PM +0300, Dan Carpenter wrote:
> On Tue, Dec 15, 2020 at 09:56:55AM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Dec 14, 2020 at 09:21:17PM +0100, Christophe JAILLET wrote:
> > > 'irq_of_parse_and_map()' should be balanced by a corresponding
> > > 'irq_dispose_mapping()' call. Otherwise, there is some resources leak=
s.
> >=20
> > Do you have a source to back that? It's not clear at all from the
> > documentation for those functions, and couldn't find any user calling it
> > from the ten-or-so random picks I took.
>=20
> It looks like irq_create_of_mapping() needs to be freed with
> irq_dispose_mapping() so this is correct.

The doc should be updated first to make that clear then, otherwise we're
going to fix one user while multiples will have poped up

Maxime

--3jnlnqak5zfuvw2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9if5gAKCRDj7w1vZxhR
xcrsAQCAqxdmtzOx5x2uljGYBPES+hoL5VtWTPYJ7galIKwmeQD9FLlD8pXyN4+t
mmaQfNPJYJvD1vLewe+K5RjOzDRO3wA=
=v6FU
-----END PGP SIGNATURE-----

--3jnlnqak5zfuvw2l--
