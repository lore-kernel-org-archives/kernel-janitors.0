From: Maxime Ripard <maxime@cerno.tech>
Date: Tue, 14 Apr 2020 07:26:53 +0000
Subject: Re: [PATCH] MAINTAINERS: point to display schemas in DRM DRIVERS FOR ALLWINNER A10
Message-Id: <20200414072653.x2mvytbsvnjiqiij@gilmour.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="kdkzdphvlzzoj572"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200413075329.10717-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200413075329.10717-1-lukas.bulwahn@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Joe Perches <joe@perches.com>


--kdkzdphvlzzoj572
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 13, 2020 at 09:53:29AM +0200, Lukas Bulwahn wrote:
> Commit f5a98bfe7b37 ("dt-bindings: display: Convert Allwinner display
> pipeline to schemas") replaced sunxi/sun4i-drm.txt with
> allwinner,sun*.yaml files in Documentation/devicetree/bindings/display/,
> but did not adjust DRM DRIVERS FOR ALLWINNER A10.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>   warning: no file matches \
>   F: Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
>
> Point to allwinner display schemas in DRM DRIVERS FOR ALLWINNER A10.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--kdkzdphvlzzoj572
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpVlvQAKCRDj7w1vZxhR
xVrnAPwPo+G3ObIsBJnK9D9AJ9dsl+LIKPP4Qz+TT7i4cgMDMAEAvnuVM7N5ZdVk
yXUCRUxY6YQ5gMDbTD43X/MsWZqHmQ8=
=gv8H
-----END PGP SIGNATURE-----

--kdkzdphvlzzoj572--
