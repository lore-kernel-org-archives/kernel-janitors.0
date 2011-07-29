From: =?iso-8859-1?Q?Jean-Fran=E7ois_Dagenais?= <jeff.dagenais@gmail.com>
Date: Fri, 29 Jul 2011 20:28:12 +0000
Subject: Re: [patch] w1: off by one in w1_f29_remove_slave()
Message-Id: <9C2475AA-829E-4BB8-A3D2-2444803A33D3@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727095557.GL3824@shale.localdomain>
In-Reply-To: <20110727095557.GL3824@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Yup, confirmed, weird that I did not notice a crash, probably lucky shot in=
 the environment I was using it.

On 2011-07-27, at 05:55, Dan Carpenter wrote:

> This reads past the end of the w1_f29_sysfs_bin_files[] array.  I
> don't have this hardware, but I assume it crashes every time the
> function is called.
>=20
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Jean-Fran=E7ois Dagenais <dagenaisj@sonatest.com>
>=20
> diff --git a/drivers/w1/slaves/w1_ds2408.c b/drivers/w1/slaves/w1_ds2408.c
> index c377818..0da4e97 100644
> --- a/drivers/w1/slaves/w1_ds2408.c
> +++ b/drivers/w1/slaves/w1_ds2408.c
> @@ -373,7 +373,7 @@ static int w1_f29_add_slave(struct w1_slave *sl)
> static void w1_f29_remove_slave(struct w1_slave *sl)
> {
> 	int i;
> -	for (i =3D NB_SYSFS_BIN_FILES; i <=3D 0; --i)
> +	for (i =3D NB_SYSFS_BIN_FILES - 1; i <=3D 0; --i)
> 		sysfs_remove_bin_file(&sl->dev.kobj,
> 			&(w1_f29_sysfs_bin_files[i]));
> }
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
