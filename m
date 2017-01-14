From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 14 Jan 2017 06:36:08 +0000
Subject: Re: [PATCH 14/17] spi/topcliff-pch: Adjust six checks for null pointers
Message-Id: <20170114063608.GD15314@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1413e173-dbac-7a6e-09cb-2287300a335e@users.sourceforge.net>
 <676a6351-ec06-9744-9f6f-753feb65f8fb@users.sourceforge.net>
In-Reply-To: <676a6351-ec06-9744-9f6f-753feb65f8fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 13, 2017 at 06:24:22PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 13 Jan 2017 16:16:05 +0100
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> The script "checkpatch.pl" pointed information out like the following.
>=20
> Comparison to NULL could be written =E2=80=A6
>=20
> Thus fix the affected source code places.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/spi/spi-topcliff-pch.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pc=
h.c
> index 0a876311b67b..e4f1f66b751b 100644
> --- a/drivers/spi/spi-topcliff-pch.c
> +++ b/drivers/spi/spi-topcliff-pch.c
> @@ -531,12 +531,11 @@ static int pch_spi_transfer(struct spi_device *pspi=
, struct spi_message *pmsg)
>  static inline void pch_spi_select_chip(struct pch_spi_data *data,
>  				       struct spi_device *pspi)
>  {
> -	if (data->current_chip !=3D NULL) {
> +	if (data->current_chip)


Put the curly braces back.  Multi-line indents get curly braces for
readability.

>  		if (pspi->chip_select !=3D data->n_curnt_chip) {
>  			dev_dbg(&pspi->dev, "%s : different slave\n", __func__);
>  			data->current_chip =3D NULL;
>  		}
> -	}

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
