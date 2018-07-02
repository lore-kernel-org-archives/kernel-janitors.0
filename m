From: Johan Hovold <johan@kernel.org>
Date: Mon, 02 Jul 2018 08:59:33 +0000
Subject: Re: [PATCH][next] gnss: make struct ubx_gserial_ops static
Message-Id: <20180702085933.GG9802@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180630112246.942-1-colin.king@canonical.com>
In-Reply-To: <20180630112246.942-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hovold <johan@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Sat, Jun 30, 2018 at 12:22:46PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The structure ubx_gserial_ops is local to the source and does not need
> to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> symbol 'ubx_gserial_ops' was not declared. Should it be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This was reported by the kbuild test robot and an automated RFC patch
submitted was a while back.

I prefer this man-generated one with a proper commit message, so:

Acked-by: Johan Hovold <johan@kernel.org>

> ---
>  drivers/gnss/ubx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gnss/ubx.c b/drivers/gnss/ubx.c
> index 902b6854b7db..12568aebb7f6 100644
> --- a/drivers/gnss/ubx.c
> +++ b/drivers/gnss/ubx.c
> @@ -59,7 +59,7 @@ static int ubx_set_power(struct gnss_serial *gserial,
>  	return -EINVAL;
>  }
>  
> -const struct gnss_serial_ops ubx_gserial_ops = {
> +static const struct gnss_serial_ops ubx_gserial_ops = {
>  	.set_power = ubx_set_power,
>  };

Thanks,
Johan
