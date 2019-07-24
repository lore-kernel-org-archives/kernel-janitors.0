From: Christian Lamparter <chunkeey@gmail.com>
Date: Wed, 24 Jul 2019 19:42:48 +0000
Subject: Re: [PATCH] carl9170: remove set but not used variable 'udev'
Message-Id: <CAAd0S9BvTfRyUVkQzcczyNkU_oeU5hNdK3KVQzLsU21b4JGNTQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190724015411.66525-1-yuehaibing@huawei.com>
In-Reply-To: <20190724015411.66525-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>

On Wed, Jul 24, 2019 at 3:48 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/net/wireless/ath/carl9170/usb.c: In function 'carl9170_usb_disconnect':
> drivers/net/wireless/ath/carl9170/usb.c:1110:21: warning:
>  variable 'udev' set but not used [-Wunused-but-set-variable]
>
> It is not used, so can be removed.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
Isn't this the same patch you sent earlier:

https://patchwork.kernel.org/patch/11027909/

From what I can tell, it's the same but with an extra [-next], I
remember that I've acked that one
but your patch now does not have it? Is this an oversight, because I'm
the maintainer for this
driver. So, in my opinion at least the "ack" should have some value
and shouldn't be "ignored".

Look, from what I know, Kalle is not ignoring you, It's just that
carl9170 is no longer top priority.
So please be patient. As long as its queued in the patchwork it will
get considered.

Cheers,
Christian

>  drivers/net/wireless/ath/carl9170/usb.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/carl9170/usb.c b/drivers/net/wireless/ath/carl9170/usb.c
> index 99f1897a775d..486957a04bd1 100644
> --- a/drivers/net/wireless/ath/carl9170/usb.c
> +++ b/drivers/net/wireless/ath/carl9170/usb.c
> @@ -1107,12 +1107,10 @@ static int carl9170_usb_probe(struct usb_interface *intf,
>  static void carl9170_usb_disconnect(struct usb_interface *intf)
>  {
>         struct ar9170 *ar = usb_get_intfdata(intf);
> -       struct usb_device *udev;
>
>         if (WARN_ON(!ar))
>                 return;
>
> -       udev = ar->udev;
>         wait_for_completion(&ar->fw_load_wait);
>
>         if (IS_INITIALIZED(ar)) {
>
>
>
