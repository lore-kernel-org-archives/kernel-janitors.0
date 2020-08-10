From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jerome.pouiller@silabs.com>
Date: Mon, 10 Aug 2020 07:34:08 +0000
Subject: Re: [PATCH][next][V2] staging: wfx: fix a handful of spelling mistakes
Message-Id: <1666411.QAX1JtfOtW@pc-42>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200806104701.46123-1-colin.king@canonical.com>
In-Reply-To: <20200806104701.46123-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thursday 6 August 2020 12:47:01 CEST Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There are various spelling mistakes in comments and error messages.
> Fix these.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>=20
> V2: add in some more fixes as spotted by Randy Dunlap
>=20
> ---
>  drivers/staging/wfx/data_rx.c | 2 +-
>  drivers/staging/wfx/data_tx.c | 2 +-
>  drivers/staging/wfx/debug.c   | 6 +++---
>  drivers/staging/wfx/hif_rx.c  | 2 +-
>  drivers/staging/wfx/hif_tx.c  | 4 ++--
>  drivers/staging/wfx/main.c    | 2 +-
>  drivers/staging/wfx/main.h    | 2 +-
>  drivers/staging/wfx/sta.c     | 2 +-
>  8 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/staging/wfx/data_rx.c b/drivers/staging/wfx/data_rx.c
> index 6fb078880742..7fcbbfc53416 100644
> --- a/drivers/staging/wfx/data_rx.c
> +++ b/drivers/staging/wfx/data_rx.c
> @@ -73,7 +73,7 @@ void wfx_rx_cb(struct wfx_vif *wvif,
>         if (arg->rx_flags.encryp)
>                 hdr->flag |=3D RX_FLAG_DECRYPTED;
>=20
> -       // Block ack negociation is offloaded by the firmware. However,
> +       // Block ack negotiation is offloaded by the firmware. However,
>         // re-ordering must be done by the mac80211.
>         if (ieee80211_is_action(frame->frame_control) &&
>             mgmt->u.action.category =3D=3D WLAN_CATEGORY_BACK &&
> diff --git a/drivers/staging/wfx/data_tx.c b/drivers/staging/wfx/data_tx.c
> index 3acf4eb0214d..41f9afd41e14 100644
> --- a/drivers/staging/wfx/data_tx.c
> +++ b/drivers/staging/wfx/data_tx.c
> @@ -234,7 +234,7 @@ static void wfx_tx_fixup_rates(struct ieee80211_tx_ra=
te *rates)
>         int i;
>         bool finished;
>=20
> -       // Firmware is not able to mix rates with differents flags
> +       // Firmware is not able to mix rates with different flags
>         for (i =3D 0; i < IEEE80211_TX_MAX_RATES; i++) {
>                 if (rates[0].flags & IEEE80211_TX_RC_SHORT_GI)
>                         rates[i].flags |=3D IEEE80211_TX_RC_SHORT_GI;
> diff --git a/drivers/staging/wfx/debug.c b/drivers/staging/wfx/debug.c
> index 3f1712b7c919..99c53e1afece 100644
> --- a/drivers/staging/wfx/debug.c
> +++ b/drivers/staging/wfx/debug.c
> @@ -267,7 +267,7 @@ static ssize_t wfx_send_hif_msg_write(struct file *fi=
le,
>         if (count < sizeof(struct hif_msg))
>                 return -EINVAL;
>=20
> -       // wfx_cmd_send() chekc that reply buffer is wide enough, but do =
not
> +       // wfx_cmd_send() checks that reply buffer is wide enough, but do=
es not
>         // return precise length read. User have to know how many bytes s=
hould
>         // be read. Filling reply buffer with a memory pattern may help u=
ser.
>         memset(context->reply, 0xFF, sizeof(context->reply));
> @@ -299,8 +299,8 @@ static ssize_t wfx_send_hif_msg_read(struct file *fil=
e, char __user *user_buf,
>                 return ret;
>         if (context->ret < 0)
>                 return context->ret;
> -       // Be carefull, write() is waiting for a full message while read()
> -       // only return a payload
> +       // Be careful, write() is waiting for a full message while read()
> +       // only returns a payload
>         if (copy_to_user(user_buf, context->reply, count))
>                 return -EFAULT;
>=20
> diff --git a/drivers/staging/wfx/hif_rx.c b/drivers/staging/wfx/hif_rx.c
> index cc7c0cf226ba..1d32973d8ec1 100644
> --- a/drivers/staging/wfx/hif_rx.c
> +++ b/drivers/staging/wfx/hif_rx.c
> @@ -118,7 +118,7 @@ static int hif_keys_indication(struct wfx_dev *wdev,
>=20
>         // SL_PUB_KEY_EXCHANGE_STATUS_SUCCESS is used by legacy secure li=
nk
>         if (body->status && body->status !=3D HIF_STATUS_SLK_NEGO_SUCCESS)
> -               dev_warn(wdev->dev, "secure link negociation error\n");
> +               dev_warn(wdev->dev, "secure link negotiation error\n");
>         memcpy(pubkey, body->ncp_pub_key, sizeof(pubkey));
>         memreverse(pubkey, sizeof(pubkey));
>         wfx_sl_check_pubkey(wdev, pubkey, body->ncp_pub_key_mac);
> diff --git a/drivers/staging/wfx/hif_tx.c b/drivers/staging/wfx/hif_tx.c
> index 5110f9b93762..3b5f4dcc469c 100644
> --- a/drivers/staging/wfx/hif_tx.c
> +++ b/drivers/staging/wfx/hif_tx.c
> @@ -78,7 +78,7 @@ int wfx_cmd_send(struct wfx_dev *wdev, struct hif_msg *=
request,
>=20
>         wfx_bh_request_tx(wdev);
>=20
> -       // NOTE: no timeout is catched async is enabled
> +       // NOTE: no timeout is caught async is enabled
>         if (async)
>                 return 0;
>=20
> @@ -125,7 +125,7 @@ int wfx_cmd_send(struct wfx_dev *wdev, struct hif_msg=
 *request,
>=20
>  // This function is special. After HIF_REQ_ID_SHUT_DOWN, chip won't repl=
y to any
>  // request anymore. We need to slightly hack struct wfx_hif_cmd for that=
 job. Be
> -// carefull to only call this funcion during device unregister.
> +// careful to only call this function during device unregister.
>  int hif_shutdown(struct wfx_dev *wdev)
>  {
>         int ret;
> diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
> index 11dfa088fc86..4263f912760b 100644
> --- a/drivers/staging/wfx/main.c
> +++ b/drivers/staging/wfx/main.c
> @@ -384,7 +384,7 @@ int wfx_probe(struct wfx_dev *wdev)
>         err =3D wfx_sl_init(wdev);
>         if (err && wdev->hw_caps.capabilities.link_mode =3D=3D SEC_LINK_E=
NFORCED) {
>                 dev_err(wdev->dev,
> -                       "chip require secure_link, but can't negociate it=
\n");
> +                       "chip require secure_link, but can't negotiate it=
\n");
>                 goto err0;
>         }
>=20
> diff --git a/drivers/staging/wfx/main.h b/drivers/staging/wfx/main.h
> index c59d375dd3ad..2457cb595b0f 100644
> --- a/drivers/staging/wfx/main.h
> +++ b/drivers/staging/wfx/main.h
> @@ -19,7 +19,7 @@ struct wfx_dev;
>  struct hwbus_ops;
>=20
>  struct wfx_platform_data {
> -       /* Keyset and ".sec" extention will appended to this string */
> +       /* Keyset and ".sec" extension will be appended to this string */
>         const char *file_fw;
>         const char *file_pds;
>         struct gpio_desc *gpio_wakeup;
> diff --git a/drivers/staging/wfx/sta.c b/drivers/staging/wfx/sta.c
> index 4e30ab17a93d..ad63332f690c 100644
> --- a/drivers/staging/wfx/sta.c
> +++ b/drivers/staging/wfx/sta.c
> @@ -214,7 +214,7 @@ static int wfx_get_ps_timeout(struct wfx_vif *wvif, b=
ool *enable_ps)
>         if (chan0 && chan1 && chan0->hw_value !=3D chan1->hw_value &&
>             wvif->vif->type !=3D NL80211_IFTYPE_AP) {
>                 // It is necessary to enable powersave if channels
> -               // are differents.
> +               // are different.
>                 if (enable_ps)
>                         *enable_ps =3D true;
>                 if (wvif->wdev->force_ps_timeout > -1)
> --
> 2.27.0
>=20
>=20

Reviewed-by: J=E9r=F4me Pouiller <jerome.pouiller@silabs.com>

--=20
J=E9r=F4me Pouiller
