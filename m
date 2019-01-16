From: Scott Branden <scott.branden@broadcom.com>
Date: Wed, 16 Jan 2019 18:06:26 +0000
Subject: Re: [PATCH -next] soc: bcm: bcm2835-pm: Make local symbol static
Message-Id: <50481a6e-53de-96ef-11c9-421568d7b7e5@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547617457-60066-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1547617457-60066-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>
Cc: kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Looks good.

On 2019-01-15 9:44 p.m., Wei Yongjun wrote:
> Fixes the following sparse warning:
>
> drivers/soc/bcm/bcm2835-power.c:556:32: warning:
>   symbol 'bcm2835_reset_ops' was not declared. Should it be static?
>
> Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains under a new binding.")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Acked-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   drivers/soc/bcm/bcm2835-power.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/bcm/bcm2835-power.c b/drivers/soc/bcm/bcm2835-power.c
> index 4841295..9351349 100644
> --- a/drivers/soc/bcm/bcm2835-power.c
> +++ b/drivers/soc/bcm/bcm2835-power.c
> @@ -553,7 +553,7 @@ static int bcm2835_reset_status(struct reset_controller_dev *rcdev,
>   	}
>   }
>   
> -const struct reset_control_ops bcm2835_reset_ops = {
> +static const struct reset_control_ops bcm2835_reset_ops = {
>   	.reset = bcm2835_reset_reset,
>   	.status = bcm2835_reset_status,
>   };
>
>
>
