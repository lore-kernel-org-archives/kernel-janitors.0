From: Akash Asthana <akashast@codeaurora.org>
Date: Mon, 27 Jul 2020 07:55:58 +0000
Subject: Re: [PATCH] i2c: qcom-geni: fix spelling mistake "unepxected" -> "unexpected"
Message-Id: <74e71d14-9f27-6a44-f253-4756ba124695@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191103212204.13606-1-colin.king@canonical.com>
In-Reply-To: <20191103212204.13606-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alok Chauhan <alokc@codeaurora.org>, Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 11/4/2019 2:52 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in an error message string, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 17abf60c94ae..387fb5a83471 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -98,7 +98,7 @@ static const struct geni_i2c_err_log gi2c_log[] = {
>   	[GP_IRQ0] = {-EIO, "Unknown I2C err GP_IRQ0"},
>   	[NACK] = {-ENXIO, "NACK: slv unresponsive, check its power/reset-ln"},
>   	[GP_IRQ2] = {-EIO, "Unknown I2C err GP IRQ2"},
> -	[BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unepxected start/stop"},
> +	[BUS_PROTO] = {-EPROTO, "Bus proto err, noisy/unexpected start/stop"},
>   	[ARB_LOST] = {-EAGAIN, "Bus arbitration lost, clock line undriveable"},
>   	[GP_IRQ5] = {-EIO, "Unknown I2C err GP IRQ5"},
>   	[GENI_OVERRUN] = {-EIO, "Cmd overrun, check GENI cmd-state machine"},

The patch is still applying cleanly on tip.

Reviewed-by: Akash Asthana <akashast@codeauror.org>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,\na Linux Foundation Collaborative Project
