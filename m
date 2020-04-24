From: Jerome Pouiller <Jerome.Pouiller@silabs.com>
Date: Fri, 24 Apr 2020 11:39:38 +0000
Subject: Re: [PATCH] staging: wfx: check ssidlen and prevent an array overflow
Message-Id: <2664933.6YeKyBzJok@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200424104235.GA416402@mwanda>
In-Reply-To: <20200424104235.GA416402@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Friday 24 April 2020 12:42:35 CEST Dan Carpenter wrote:
>=20
> We need to cap "ssidlen" to prevent a memcpy() overflow.
>=20
> Fixes: 40115bbc40e2 ("staging: wfx: implement the rest of mac80211 API")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/staging/wfx/sta.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/wfx/sta.c b/drivers/staging/wfx/sta.c
> index c73dbb3a0de8c..3bff0f1e3d9ba 100644
> --- a/drivers/staging/wfx/sta.c
> +++ b/drivers/staging/wfx/sta.c
> @@ -479,7 +479,9 @@ static void wfx_do_join(struct wfx_vif *wvif)
>                 ssidie =3D ieee80211_bss_get_ie(bss, WLAN_EID_SSID);
>         if (ssidie) {
>                 ssidlen =3D ssidie[1];
> -               memcpy(ssid, &ssidie[2], ssidie[1]);
> +               if (ssidlen > IEEE80211_MAX_SSID_LEN)
> +                       ssidlen =3D IEEE80211_MAX_SSID_LEN;
I'd have a little preference for sizeof(ssid) instead of
IEEE80211_MAX_SSID_LEN, but ok.

> +               memcpy(ssid, &ssidie[2], ssidlen);
>         }
>         rcu_read_unlock();
>=20
> --
> 2.26.1
>=20

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

--=20
J=E9r=F4me Pouiller
