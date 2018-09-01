From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 01 Sep 2018 07:21:07 +0000
Subject: Re: [PATCH v3] rsi: remove set but not used variables 'header_size' and 'tx_params'
Message-Id: <8a827e79-ddd0-da00-6a16-d2b6e8809f51@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535707647-191888-1-git-send-email-yuehaibing@huawei.com>
 <1535786170-169698-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535786170-169698-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kalle Valo <kvalo@codeaurora.org>, Pavani Muthyala <pavani.muthyala@redpinesignals.com>, Kees Cook <keescook@chromium.org>, Colin Ian King <colin.king@canonical.com>, Amitkumar Karwar <amit.karwar@redpinesignals.com>, Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>, Sushant Kumar Mishra <sushant.mishra@redpinesignals.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2018/9/1 15:16, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/net/wireless/rsi/rsi_91x_hal.c: In function 'rsi_send_data_pkt':
> drivers/net/wireless/rsi/rsi_91x_hal.c:288:5: warning:
>  variable 'header_size' set but not used [-Wunused-but-set-variable]
>=20
> 'tx_params' only used for 'header_size' dereferenced=EF=BCOso also

sorry..., there is some messy code, Also missing changelog, I'll fix.

> can be removed.
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/wireless/rsi/rsi_91x_hal.c | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/drivers/net/wireless/rsi/rsi_91x_hal.c b/drivers/net/wireles=
s/rsi/rsi_91x_hal.c
> index 01edf96..182b066 100644
> --- a/drivers/net/wireless/rsi/rsi_91x_hal.c
> +++ b/drivers/net/wireless/rsi/rsi_91x_hal.c
> @@ -282,10 +282,8 @@ int rsi_send_data_pkt(struct rsi_common *common, str=
uct sk_buff *skb)
>  	struct rsi_hw *adapter =3D common->priv;
>  	struct ieee80211_vif *vif;
>  	struct ieee80211_tx_info *info;
> -	struct skb_info *tx_params;
>  	struct ieee80211_bss_conf *bss;
>  	int status =3D -EINVAL;
> -	u8 header_size;
> =20
>  	if (!skb)
>  		return 0;
> @@ -297,8 +295,6 @@ int rsi_send_data_pkt(struct rsi_common *common, stru=
ct sk_buff *skb)
>  		goto err;
>  	vif =3D info->control.vif;
>  	bss =3D &vif->bss_conf;
> -	tx_params =3D (struct skb_info *)info->driver_data;
> -	header_size =3D tx_params->internal_hdr_size;
> =20
>  	if (((vif->type =3D NL80211_IFTYPE_STATION) ||
>  	     (vif->type =3D NL80211_IFTYPE_P2P_CLIENT)) &&
>=20
>=20
> .
>=20
