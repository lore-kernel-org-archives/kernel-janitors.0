From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 01 May 2020 18:15:04 +0000
Subject: Re: [PATCH] libertas_tf: Avoid a null pointer dereference in if_usb_disconnect()
Message-Id: <93740048-acc1-b140-3b91-a659408091ac@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin Ian King <colin.king@canonical.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Kalle Valo <kvalo@codeaurora.org>, Lubomir Rintel <lkundrak@v3.sk>, Steve deRosier <derosier@cal-sierra.com>

> Currently there is a check if priv is null when calling lbtf_remove_card
> but not in a previous call to if_usb_reset_dev that can also dereference
> priv.  Fix this by also only calling lbtf_remove_card if priv is null.

I suggest to recheck this description (and the corresponding patch subject).


=E2=80=A6
> +++ b/drivers/net/wireless/marvell/libertas_tf/if_usb.c
> @@ -247,10 +247,10 @@ static void if_usb_disconnect(struct usb_interface =
*intf)
>
>  	lbtf_deb_enter(LBTF_DEB_MAIN);
>
> -	if_usb_reset_device(priv);
> -
> -	if (priv)
> +	if (priv) {
> +		if_usb_reset_device(priv);
>  		lbtf_remove_card(priv);
> +	}
>
>  	/* Unlink and free urb */
>  	if_usb_free(cardp);

The patch code proposes to move a specific function call into an if branch
according to a null pointer check.

Regards,
Markus
