From: Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 18 Feb 2019 08:38:58 +0000
Subject: Re: [PATCH -next] clk: tegra: dfll: Make symbol 'tegra210_cpu_cvb_tables' static
Message-Id: <20190218083858.GA19363@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="wRRV7LY7NUeQGEoC"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218070609.167535-1-weiyongjun1@huawei.com>
In-Reply-To: <20190218070609.167535-1-weiyongjun1@huawei.com>
To: arm@kernel.org
Cc: Wei Yongjun <weiyongjun1@huawei.com>, "\\ Peter De Schrijver" <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 18, 2019 at 07:06:09AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
>=20
> drivers/clk/tegra/clk-tegra124-dfll-fcpu.c:244:18: warning:
>  symbol 'tegra210_cpu_cvb_tables' was not declared. Should it be static?
>=20
> Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

ARM SoC maintainers,

This fixes a sparse warning introduced in the tegra-for-5.1-clk pull
request that you pulled last week. Do you want me to send you another
pull request (perhaps give it a few more days in case other fixes are
going to show up) or would you rather apply this directly?

In the latter case, here's a link to patchwork:

	http://patchwork.ozlabs.org/patch/1043804/

and this is:

Acked-by: Thierry Reding <treding@nvidia.com>

In the meantime, I'll go and improve my build scripts to run sparse as
well. I used to do that but then removed it again because it was so
noisy that it was impossible to filter out the Tegra-specific bits. I
wonder if I could do something like have the build scripts build the
branch base first, without sparse checking, and then fast-forward to the
branch head and build again with sparse checking enabled. That way I
should only be seeing the sparse results for code that was modified in
the branch.

Thierry

> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/teg=
ra/clk-tegra124-dfll-fcpu.c
> index 4b6dd2b3767f..e8ec42bf8638 100644
> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> @@ -241,7 +241,7 @@ static const unsigned long tegra210_cpu_max_freq_tabl=
e[] =3D {
>  		{          0UL,	{       0, 0, 0 } }, \
>  	}
> =20
> -struct cvb_table tegra210_cpu_cvb_tables[] =3D {
> +static struct cvb_table tegra210_cpu_cvb_tables[] =3D {
>  	{
>  		.speedo_id =3D 10,
>  		.process_id =3D 0,
>=20
>=20
>=20

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlxqbx4ACgkQ3SOs138+
s6GKiA/+O71hH4NiwOvrteKU/ofEN7JlIgDMQoiqJRu0NzEKKZifkUYIwg0lSfjE
/NZmxOwLw+vexqFjBcJ83Vk8wYyQr602x1oQt18RB0RZwB9AQHcvK+sGZtMxzf0G
fSYojvtY0mnbausiJwVhkYpzIausLBJmZpx+xMqGF5QctLuHC49PszPDV8XHqnRv
rLvOgRHAwFz1UEou/2xWydmsMDVx36NSZY0GCWkrxTGGmoqpMS8iW5CWv/9Bc2jX
1COrodbiY8tjOYeFxdYGIc/wU5Krj96ujTM99WrHoVdwXVs1kkL6J1HS4YznAtIP
wPvqioaHaXHQq5mkFUUxOkzECKz8z1TUrHqXZ3HNHfEPFEexNpF17TRRQMyYyQGs
jTlx6+vGtZLvdb2aXmhA4eEejLXfzQN8cpZ/hmMsplB0y0eu2JUZz9uMX/0QhCbK
IhFpbiw0ZkrBW7/8gSiIyfqNBkcClfLA/EN7chC5pebqcxduOJ28BA/miDwBlztX
gIu/fn2LAgZkhxYLEIpojauyBgwHmMAwyxg1WX/6+9DwMNaJpEXcLqUT3fZINni6
uftRHSUFIlSKBfJpskxy2anUWJi1iKY1IoL/rFlEwqahAJzdFDENyNdAAPtJ5rrY
fOWdPAY2iUrZcdeTlNGoCbKpsSpz/etG6d+IL+MFdHYzE2hYn6g=
=OP2W
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
