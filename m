From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 19 Jan 2015 22:06:29 +0000
Subject: Re: [PATCH] s390: char: Free memory on error path.
Message-Id: <m9jv55$djq$1@ger.gmane.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1421704920-29820-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1421704920-29820-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi there,

this is my first patch, so feel free to show me anything I did wrong, so=20
that I can improve next proposals.
Thanks in advance.

CJ

Le 19/01/2015 23:02, Christophe Jaillet a =E9crit :
> Free allocated page in case of error returned by hmcdrv_ftp_startup.
>
> Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/s390/char/hmcdrv_ftp.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/s390/char/hmcdrv_ftp.c b/drivers/s390/char/hmcdrv_ft=
p.c
> index 4bd6332..f6e00af 100644
> --- a/drivers/s390/char/hmcdrv_ftp.c
> +++ b/drivers/s390/char/hmcdrv_ftp.c
> @@ -199,8 +199,10 @@ int hmcdrv_ftp_probe(void)
>  =20
>   	rc =3D hmcdrv_ftp_startup();
>  =20
> -	if (rc)
> +	if (rc) {
> +		free_page((unsigned long) ftp.buf);
>   		return rc;
> +	}
>  =20
>   	rc =3D hmcdrv_ftp_do(&ftp);
>   	free_page((unsigned long) ftp.buf);


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
