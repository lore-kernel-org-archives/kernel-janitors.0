From: Jerome Pouiller <Jerome.Pouiller@silabs.com>
Date: Mon, 04 Nov 2019 10:42:43 +0000
Subject: Re: [PATCH v2] staging: wfx: Fix a memory leak in 'wfx_upload_beacon'
Message-Id: <4126113.6ZGdBP45BV@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191102155945.20205-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191102155945.20205-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Saturday 2 November 2019 16:59:45 CET Christophe JAILLET wrote:
> The current code is a no-op, because all it can do is 'dev_kfree_skb(NULL=
)'
> Remove the test before 'dev_kfree_skb()'
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> V2: remove the 'if(...)', 'dev_kfree_skb()' can handle NULL.
> ---
>  drivers/staging/wfx/sta.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/wfx/sta.c b/drivers/staging/wfx/sta.c
> index 688586e823c0..93f3739b5f3a 100644
> --- a/drivers/staging/wfx/sta.c
> +++ b/drivers/staging/wfx/sta.c
> @@ -906,8 +906,7 @@ static int wfx_upload_beacon(struct wfx_vif *wvif)
>         wfx_fwd_probe_req(wvif, false);
>=20
>  done:
> -       if (!skb)
> -               dev_kfree_skb(skb);
> +       dev_kfree_skb(skb);
>         return ret;
>  }
>=20
> --
> 2.20.1
>=20

In add, value of skb is tested earlier in function. So, it is guaranteed to=
 be=20
never NULL.

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

--=20
J=E9r=F4me Pouiller
