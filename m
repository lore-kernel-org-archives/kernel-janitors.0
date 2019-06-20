From: Quentin Deslandes <quentin.deslandes@itdev.co.uk>
Date: Thu, 20 Jun 2019 08:14:46 +0000
Subject: Re: [PATCH] staging: vt6656: fix indentation on break statement
Message-Id: <20190620081443.GA19564@qd-ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190619165405.7784-1-colin.king@canonical.com>
In-Reply-To: <20190619165405.7784-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jun 19, 2019 at 05:54:05PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The break statement is indented one level too deep, fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/vt6656/card.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6656/card.c b/drivers/staging/vt6656/card.c
> index 08fc03d8740e..56cd77fd9ea0 100644
> --- a/drivers/staging/vt6656/card.c
> +++ b/drivers/staging/vt6656/card.c
> @@ -166,7 +166,7 @@ static void vnt_calculate_ofdm_rate(u16 rate, u8 bb_type,
>  			*tx_rate = 0x8b;
>  			*rsv_time = 30;
>  		}
> -			break;
> +		break;
>  	case RATE_9M:
>  		if (bb_type == BB_TYPE_11A) {
>  			*tx_rate = 0x9f;
> -- 
> 2.20.1
> 

Reviewed-by: Quentin Deslandes <quentin.deslandes@itdev.co.uk>

Regards,
Quentin
