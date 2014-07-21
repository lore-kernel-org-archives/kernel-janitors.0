From: Dimitri Sivanich <sivanich@sgi.com>
Date: Mon, 21 Jul 2014 20:12:09 +0000
Subject: Re: [PATCH 3/4] drivers/misc/sgi-gru/grukdump.c: drop negativity check for unsgined req.gid
Message-Id: <20140721201209.GA19927@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1405605307-13657-1-git-send-email-andrey.krieger.utkin@gmail.com>
In-Reply-To: <1405605307-13657-1-git-send-email-andrey.krieger.utkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Acked-by: Dimitri Sivanich <sivanich@sgi.com>

On Thu, Jul 17, 2014 at 04:55:07PM +0300, Andrey Utkin wrote:
> [linux-3.16-rc5/drivers/misc/sgi-gru/grukdump.c:199]: (style) Checking if
> unsigned variable 'gid' is less than zero.
>=20
>     if (req.gid >=3D gru_max_gids || req.gid < 0)
>         return -EINVAL;
>=20
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80461
> Reported-by: David Binderman <dcb314@hotmail.com>
> Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
> ---
>  drivers/misc/sgi-gru/grukdump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/misc/sgi-gru/grukdump.c b/drivers/misc/sgi-gru/grukd=
ump.c
> index a3700a5..e0e0e7e 100644
> --- a/drivers/misc/sgi-gru/grukdump.c
> +++ b/drivers/misc/sgi-gru/grukdump.c
> @@ -196,7 +196,7 @@ int gru_dump_chiplet_request(unsigned long arg)
>  		return -EFAULT;
> =20
>  	/* Currently, only dump by gid is implemented */
> -	if (req.gid >=3D gru_max_gids || req.gid < 0)
> +	if (req.gid >=3D gru_max_gids)
>  		return -EINVAL;
> =20
>  	gru =3D GID_TO_GRU(req.gid);
> --=20
> 1.8.5.5
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
