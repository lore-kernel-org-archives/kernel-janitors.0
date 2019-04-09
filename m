From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 09 Apr 2019 08:24:49 +0000
Subject: Re: [PATCH -next] iio: imu: st_lsm6dsx: remove set but not used variables 'acc_sensor' and 'gyro_sen
Message-Id: <20190409082448.GA26320@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="pWyiEgJYm5f9v55/"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190409021217.155327-1-yuehaibing@huawei.com>
In-Reply-To: <20190409021217.155327-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c: In function 'st_lsm6dsx_r=
ead_tagged_fifo':
> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:520:41: warning:
>  variable 'gyro_sensor' set but not used [-Wunused-but-set-variable]
>=20
> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:520:28: warning:
>  variable 'acc_sensor' set but not used [-Wunused-but-set-variable]
>=20
> They are not used since commit 14c7c6e1a860 ("iio: imu: st_lsm6dsx: add
> st_lsm6dsx_push_tagged_data routine")
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c b/drivers/iio=
/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> index 2da8c5ff699a..bd08711d5b75 100644
> --- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> +++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
> @@ -517,7 +517,6 @@ int st_lsm6dsx_read_tagged_fifo(struct st_lsm6dsx_hw =
*hw)
>  {
>  	u16 pattern_len =3D hw->sip * ST_LSM6DSX_TAGGED_SAMPLE_SIZE;
>  	u16 fifo_len, fifo_diff_mask;
> -	struct st_lsm6dsx_sensor *acc_sensor, *gyro_sensor;
>  	u8 iio_buff[ST_LSM6DSX_IIO_BUFF_SIZE], tag;
>  	bool reset_ts =3D false;
>  	int i, err, read_len;
> @@ -539,9 +538,6 @@ int st_lsm6dsx_read_tagged_fifo(struct st_lsm6dsx_hw =
*hw)
>  	if (!fifo_len)
>  		return 0;
> =20
> -	acc_sensor =3D iio_priv(hw->iio_devs[ST_LSM6DSX_ID_ACC]);
> -	gyro_sensor =3D iio_priv(hw->iio_devs[ST_LSM6DSX_ID_GYRO]);
> -
>  	for (read_len =3D 0; read_len < fifo_len; read_len +=3D pattern_len) {
>  		err =3D st_lsm6dsx_read_block(hw,
>  					    ST_LSM6DSX_REG_FIFO_OUT_TAG_ADDR,
>=20
>=20
>=20

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCXKxWzQAKCRA6cBh0uS2t
rCilAP9/9sJAN8IDRapuxibUz2tmbY4FDKC2bEUW3tz2IUKhqwEAxyyEo/mgqhNx
RQh69uE5Jc/RMXrYfvUXpqy5loL5SQ8=
=Edmp
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
