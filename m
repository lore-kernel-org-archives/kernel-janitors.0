From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 29 Oct 2019 07:43:21 +0000
Subject: Re: [PATCH] clk: sunxi-ng: a80: fix the zero'ing of bits 16 and 18
Message-Id: <20191029074321.ftamn6qitkbfrucm@hendrix>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="gufwthkvpo2ckxgg"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191023112809.27595-1-colin.king@canonical.com>
In-Reply-To: <20191023112809.27595-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org


--gufwthkvpo2ckxgg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 23, 2019 at 12:28:09PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The zero'ing of bits 16 and 18 is incorrect. Currently the code
> is masking with the bitwise-and of BIT(16) & BIT(18) which is
> 0, so the updated value for val is always zero. Fix this by bitwise
> and-ing value with the correct mask that will zero bits 16 and 18.
>
> Addresses-Coverity: (" Suspicious &= or |= constant expression")
> Fixes: b8eb71dcdd08 ("clk: sunxi-ng: Add A80 CCU")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks!
Maxime

--gufwthkvpo2ckxgg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXbftmQAKCRDj7w1vZxhR
xUkfAP9Z5pgiCu01sgdMtiTA28A0ugCnNsspfAqhabiBnF1uMAD/UtXwYMkvUTC7
Eqx/KFAYrADVGg14oOUSrdk0eFxowwY=
=j3Hb
-----END PGP SIGNATURE-----

--gufwthkvpo2ckxgg--
