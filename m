From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
Date: Tue, 12 May 2020 09:03:16 +0000
Subject: Re: [PATCH] staging: wfx: unlock on error path
Message-Id: <2556639.E3UUflA7rB@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200512083656.GA251760@mwanda>
In-Reply-To: <20200512083656.GA251760@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org

On Tuesday 12 May 2020 10:36:56 CEST Dan Carpenter wrote:
>=20
> We need to release the tx_lock on the error path before returning.
>=20
> Fixes: d1c015b4ef6f ("staging: wfx: rewrite wfx_hw_scan()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Not tested.
>=20
>  drivers/staging/wfx/scan.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/wfx/scan.c b/drivers/staging/wfx/scan.c
> index 76761e4960dd7..eff1be9fb28f8 100644
> --- a/drivers/staging/wfx/scan.c
> +++ b/drivers/staging/wfx/scan.c
> @@ -57,8 +57,10 @@ static int send_scan_req(struct wfx_vif *wvif,
>         wvif->scan_abort =3D false;
>         reinit_completion(&wvif->scan_complete);
>         timeout =3D hif_scan(wvif, req, start_idx, i - start_idx);
> -       if (timeout < 0)
> +       if (timeout < 0) {
> +               wfx_tx_unlock(wvif->wdev);
>                 return timeout;
> +       }
>         ret =3D wait_for_completion_timeout(&wvif->scan_complete, timeout=
);
>         if (req->channels[start_idx]->max_power !=3D wvif->vif->bss_conf.=
txpower)
>                 hif_set_output_power(wvif, wvif->vif->bss_conf.txpower);
> --
> 2.26.2
>=20
>=20

Good catch!

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

--=20
J=E9r=F4me Pouiller
