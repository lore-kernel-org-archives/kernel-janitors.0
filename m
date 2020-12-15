From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 15 Dec 2020 19:08:15 +0000
Subject: Re: [PATCH] net: allwinner: Fix some resources leak in the error handling path of the probe and in t
Message-Id: <20201215190815.6efzcqko55womf6b@gilmour>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="np4pkv32spdrwk7i"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201214202117.146293-1-christophe.jaillet@wanadoo.fr>
 <20201215085655.ddacjfvogc3e33vz@gilmour>
 <20201215091153.GH2809@kadam>
 <20201215113710.wh4ezrvmqbpxd5yi@gilmour>
 <54194e3e-5eb1-d10c-4294-bac8f3933f47@wanadoo.fr>
In-Reply-To: <54194e3e-5eb1-d10c-4294-bac8f3933f47@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: song.bao.hua@hisilicon.com, jernej.skrabec@siol.net, f.fainelli@gmail.com, leon@kernel.org, timur@kernel.org, netdev@vger.kernel.org, wangyunjian@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, wens@csie.org, linux-arm-kernel@lists.infradead.org, kuba@kernel.org, sr@denx.de, davem@davemloft.net, Dan Carpenter <dan.carpenter@oracle.com>, hkallweit1@gmail.com


--np4pkv32spdrwk7i
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 15, 2020 at 07:18:48PM +0100, Christophe JAILLET wrote:
> Le 15/12/2020 =E0 12:37, Maxime Ripard a =E9crit=A0:
> > On Tue, Dec 15, 2020 at 12:11:53PM +0300, Dan Carpenter wrote:
> > > On Tue, Dec 15, 2020 at 09:56:55AM +0100, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Mon, Dec 14, 2020 at 09:21:17PM +0100, Christophe JAILLET wrote:
> > > > > 'irq_of_parse_and_map()' should be balanced by a corresponding
> > > > > 'irq_dispose_mapping()' call. Otherwise, there is some resources =
leaks.
> > > >=20
> > > > Do you have a source to back that? It's not clear at all from the
> > > > documentation for those functions, and couldn't find any user calli=
ng it
> > > > from the ten-or-so random picks I took.
> > >=20
> > > It looks like irq_create_of_mapping() needs to be freed with
> > > irq_dispose_mapping() so this is correct.
> >=20
> > The doc should be updated first to make that clear then, otherwise we're
> > going to fix one user while multiples will have poped up
> >=20
> > Maxime
> >=20
>=20
> Hi,
>=20
> as Dan explained, I think that 'irq_dispose_mapping()' is needed because =
of
> the 'irq_create_of_mapping()" within 'irq_of_parse_and_map()'.
>=20
> As you suggest, I'll propose a doc update to make it clear and more future
> proof.

Thanks :)

And if you feel like it, a coccinelle script would be awesome too so
that other users get fixed over time

Maxime

--np4pkv32spdrwk7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9kJngAKCRDj7w1vZxhR
xR6iAQCYBl0k0FS3O7aaMjiuDMcw+buQelECZ8B6EltdifEEfAD/a3yu9LamvXJd
ZntPs+j60NZcjdM7PuWbJiXL+590ig8=
=++pp
-----END PGP SIGNATURE-----

--np4pkv32spdrwk7i--
