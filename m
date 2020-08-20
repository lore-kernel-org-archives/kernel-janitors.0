From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
Date: Thu, 20 Aug 2020 09:13:05 +0000
Subject: Re: [PATCH 4/6] staging: wfx/debug.c: Fix spelling mistake "carefull" => "careful"
Message-Id: <3146523.GL6Gmh1C2x@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <834139101223e627665c939388cd7c542920c531.1597913333.git.usuraj35@gmail.com> <ec3e765875adfe59f1d8d8ef2c610d6423116f55.1597913333.git.usuraj35@gmail.com>
In-Reply-To: <ec3e765875adfe59f1d8d8ef2c610d6423116f55.1597913333.git.usuraj35@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: gregkh@linuxfoundation.org, Suraj Upadhyay <usuraj35@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thursday 20 August 2020 10:50:57 CEST Suraj Upadhyay wrote:
>=20
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>  drivers/staging/wfx/debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/wfx/debug.c b/drivers/staging/wfx/debug.c
> index 3f1712b7c919..5772e2375370 100644
> --- a/drivers/staging/wfx/debug.c
> +++ b/drivers/staging/wfx/debug.c
> @@ -299,7 +299,7 @@ static ssize_t wfx_send_hif_msg_read(struct file *fil=
e, char __user *user_buf,
>                 return ret;
>         if (context->ret < 0)
>                 return context->ret;
> -       // Be carefull, write() is waiting for a full message while read()
> +       // Be careful, write() is waiting for a full message while read()

Already fixed by commit c9638363f02d ("staging: wfx: fix a handful of
spelling mistakes").

--=20
J=E9r=F4me Pouiller
