From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 15 Dec 2020 08:56:55 +0000
Subject: Re: [PATCH] net: allwinner: Fix some resources leak in the error handling path of the probe and in t
Message-Id: <20201215085655.ddacjfvogc3e33vz@gilmour>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="tgnffsnu3i7wc524"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201214202117.146293-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201214202117.146293-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: song.bao.hua@hisilicon.com, jernej.skrabec@siol.net, f.fainelli@gmail.com, leon@kernel.org, timur@kernel.org, netdev@vger.kernel.org, wangyunjian@huawei.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, wens@csie.org, kuba@kernel.org, sr@denx.de, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com


--tgnffsnu3i7wc524
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 14, 2020 at 09:21:17PM +0100, Christophe JAILLET wrote:
> 'irq_of_parse_and_map()' should be balanced by a corresponding
> 'irq_dispose_mapping()' call. Otherwise, there is some resources leaks.

Do you have a source to back that? It's not clear at all from the
documentation for those functions, and couldn't find any user calling it
=66rom the ten-or-so random picks I took.

Maxime

--tgnffsnu3i7wc524
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX9h6VwAKCRDj7w1vZxhR
xQ9UAQC+Z7aCLxnq7/YwPgDoj5mZh+XwHfGuD6zuXikKqa8zEQEAyScyReA2IHvf
/sJz8uc1BMRoj6wBip9nfzA/vv1QFA4=
=+jO3
-----END PGP SIGNATURE-----

--tgnffsnu3i7wc524--
