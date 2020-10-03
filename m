From: Sebastian Reichel <sre@kernel.org>
Date: Sat, 03 Oct 2020 21:51:02 +0000
Subject: Re: [PATCH][next] power: supply: fix spelling mistake "unprecise" -> "imprecise"
Message-Id: <20201003215102.5hl5lvidyki2xu7b@earth.universe>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="uy4xpfjn2exzd2kp"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200902101656.57676-1-colin.king@canonical.com>
In-Reply-To: <20200902101656.57676-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--uy4xpfjn2exzd2kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 02, 2020 at 11:16:56AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There is a spelling mistake in a dev_info message. Fix it.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks, queued.

-- Sebastian

>  drivers/power/supply/rn5t618_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/supply/rn5t618_power.c b/drivers/power/supply/=
rn5t618_power.c
> index 424d2817bee5..dee520f0fdf5 100644
> --- a/drivers/power/supply/rn5t618_power.c
> +++ b/drivers/power/supply/rn5t618_power.c
> @@ -487,7 +487,7 @@ static int rn5t618_power_probe(struct platform_device=
 *pdev)
>  		 * gauge will get decalibrated.
>  		 */
>  		dev_info(&pdev->dev, "Fuel gauge not enabled, enabling now\n");
> -		dev_info(&pdev->dev, "Expect unprecise results\n");
> +		dev_info(&pdev->dev, "Expect imprecise results\n");
>  		regmap_update_bits(info->rn5t618->regmap, RN5T618_CONTROL,
>  				   FG_ENABLE, FG_ENABLE);
>  	}
> --=20
> 2.27.0
>=20

--uy4xpfjn2exzd2kp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl948kYACgkQ2O7X88g7
+pqMJxAAiGvBhfmEp5rFXXboapypV5IeBY0hUJZap2U9RBq7Is5ZYAE/LWwK8Gp5
ukXhlWlZzzUfZ58mTRqwXxV3xxVA98ua2wa3/TmV0GulZo5DcwjJT8PutZL2CTly
4OjJheAjRdmL2pp+qc6u4sID0hrH3baeOcL9ahuhhQC/QJushuOc4As9Y6ExEALR
16x99xP/AIKhe1fxY1KKu/NLhjHB2xj/Vov+mJBM6GAQb/6LWox5otbCGQFo9q9D
KKlqqc1MBwdCa6/vX3ykXrXTfClURVK8yLbuNAoAdUuuPxingIIdTSUxClv50v+E
9uQN9GI41qFAuE5eYH6RlvfkLeLvint2i2GdhL8CUZ3FopZ31ix6Qzy8EM5plueS
Ko6UEBAYlf8eWmpnnfxbZNFagKouJnI03908iQCuLNPLHVtKNdEZVLMA90aqgJTd
PszHiMfTITrEpR7KqHyJ9J/AmCO8ONdAQqCH5jxZmPFYAp63Ybh9JF8G8+olnDS2
0GrWDNzNh8RiCjZQjizN/JuYxvHEXg6/jkt0NV4FqGEBcUnEmufL3oxzXmHR41kf
6hOK+nHtQo1EQGKtYijeCgSO/1M6pMX1shD7Mt6Dlu/Wo473Fc0syb2mLoB6rmuB
l2DmdXJE246VyylrQYjBa4Qobr38yZj1M5Mw0ND5jB7pGI+ICtI=
=r7CH
-----END PGP SIGNATURE-----

--uy4xpfjn2exzd2kp--
