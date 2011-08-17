From: Jean-Francois Dagenais <jeff.dagenais@gmail.com>
Date: Wed, 17 Aug 2011 18:45:06 +0000
Subject: Re: [patch v2] w1: fix for loop in w1_f29_remove_slave()
Message-Id: <CC07C792-D6D1-4D76-8384-14470E5B0075@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727095557.GL3824@shale.localdomain> <9C2475AA-829E-4BB8-A3D2-2444803A33D3@gmail.com> <CAOmT4fS1OqQb5KOOeFnGHt1tnYGBRutVrAZ4cXB6n=hou5fn8w@mail.gmail.com> <20110730081958.GA5575@shale.localdomain>
In-Reply-To: <20110730081958.GA5575@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: bojan prtvar <prtvar.b@gmail.com>, Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Andrew Morton <akpm@linux-foundation.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> The for loop was looking for i <=3D 0 instead of i >=3D 0 so this
> function never did anything.  Also we started with i > NB_SYSFS_BIN_FILES=
 instead of "NB_SYSFS_BIN_FILES - 1" which is an
> off by one bug.
>=20
> Reported-by: Bojan Prtvar <prtvar.b@gmail.com>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Jean-Fran=E7ois Dagenais <dagenaisj@sonatest.com>
> ---
> v2:  fix >=3D vs <>=20
> diff --git a/drivers/w1/slaves/w1_ds2408.c b/drivers/w1/slaves/w1_ds2408.c
> index c377818..7c8cdb8 100644
> --- a/drivers/w1/slaves/w1_ds2408.c
> +++ b/drivers/w1/slaves/w1_ds2408.c
> @@ -373,7 +373,7 @@ static int w1_f29_add_slave(struct w1_slave *sl)
> static void w1_f29_remove_slave(struct w1_slave *sl)
> {
> 	int i;
> -	for (i =3D NB_SYSFS_BIN_FILES; i <=3D 0; --i)
> +	for (i =3D NB_SYSFS_BIN_FILES - 1; i >=3D 0; --i)
> 		sysfs_remove_bin_file(&sl->dev.kobj,
> 			&(w1_f29_sysfs_bin_files[i]));
> }

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
