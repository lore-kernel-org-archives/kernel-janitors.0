From: Jerome Pouiller <Jerome.Pouiller@silabs.com>
Date: Wed, 09 Oct 2019 14:06:27 +0000
Subject: Re: [PATCH][next] staging: wfx: fix swapped arguments in memset call
Message-Id: <1869130.EaR14QUEFT@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191009094602.19663-1-colin.king@canonical.com>
In-Reply-To: <20191009094602.19663-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wednesday 9 October 2019 11:46:08 CEST Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> The memset appears to have the 2nd and 3rd arguments in the wrong
> order, fix this by swapping these around into the correct order.
>=20
> Addresses-Coverity: ("Memset fill truncated")
> Fixes: 4f8b7fabb15d ("staging: wfx: allow to send commands to chip")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/wfx/debug.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/wfx/debug.c b/drivers/staging/wfx/debug.c
> index 8de16ad7c710..761ad9b4f27e 100644
> --- a/drivers/staging/wfx/debug.c
> +++ b/drivers/staging/wfx/debug.c
> @@ -226,7 +226,7 @@ static ssize_t wfx_send_hif_msg_write(struct file *fi=
le, const char __user *user
>         // wfx_cmd_send() chekc that reply buffer is wide enough, but do =
not
>         // return precise length read. User have to know how many bytes s=
hould
>         // be read. Filling reply buffer with a memory pattern may help u=
ser.
> -       memset(context->reply, sizeof(context->reply), 0xFF);
> +       memset(context->reply, 0xFF, sizeof(context->reply));
>         request =3D memdup_user(user_buf, count);
>         if (IS_ERR(request))
>                 return PTR_ERR(request);

Ouch! I realize that "-Wmemset-transposed-args" and/or "-Wmemset-elt-size"
don't catch this case.

Thank you for your attentive reading.

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

--=20
J=E9r=F4me Pouiller
