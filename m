From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Date: Sun, 10 May 2020 07:41:16 +0000
Subject: Re: [PATCH] net: usb: qmi_wwan: remove redundant assignment to variable status
Message-Id: <87a72gck4j.fsf@miraculix.mork.no>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509215756.506840-1-colin.king@canonical.com>
        <20200509215756.506840-2-colin.king@canonical.com>
In-Reply-To: <20200509215756.506840-2-colin.king@canonical.com> (Colin King's
        message of "Sat, 9 May 2020 22:57:56 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:

> From: Colin Ian King <colin.king@canonical.com>
>
> The variable status is being initializeed with a value that is never read
> and it is being updated later with a new value. The initialization
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/usb/qmi_wwan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
> index 4bb8552a00d3..b0eab6e5279d 100644
> --- a/drivers/net/usb/qmi_wwan.c
> +++ b/drivers/net/usb/qmi_wwan.c
> @@ -719,7 +719,7 @@ static int qmi_wwan_change_dtr(struct usbnet *dev, bo=
ol on)
> =20
>  static int qmi_wwan_bind(struct usbnet *dev, struct usb_interface *intf)
>  {
> -	int status =3D -1;
> +	int status;
>  	u8 *buf =3D intf->cur_altsetting->extra;
>  	int len =3D intf->cur_altsetting->extralen;
>  	struct usb_interface_descriptor *desc =3D &intf->cur_altsetting->desc;


Yes, looks like this initialization was made redundant when the CDC
descriptor parsing was moved to usbcore. Thanks.

Adding Fixes for documentation only, not as a stable hint.  This is
cleanup only and not suitable for stable IMHO.

Acked-by: Bj=C3=B8rn Mork <bjorn@mork.no>
Fixes: 8492ed45aa5d ("qmi-wwan: use common parser")
