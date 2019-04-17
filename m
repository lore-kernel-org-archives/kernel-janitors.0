From: Mukesh Ojha <mojha@codeaurora.org>
Date: Wed, 17 Apr 2019 06:43:20 +0000
Subject: Re: [PATCH] watchdog: intel_scu_watchdog: fix spelling mistake: "set_hearbeat" -> "set_heartbeat"
Message-Id: <8149cea7-d7dd-2907-3f85-caba792b7cf0@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190416133318.21045-1-colin.king@canonical.com>
In-Reply-To: <20190416133318.21045-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/16/2019 7:03 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a pr_debug message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   drivers/watchdog/intel_scu_watchdog.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/intel_scu_watchdog.c b/drivers/watchdog/intel_scu_watchdog.c
> index 0caab6241eb7..718f7db35bec 100644
> --- a/drivers/watchdog/intel_scu_watchdog.c
> +++ b/drivers/watchdog/intel_scu_watchdog.c
> @@ -224,7 +224,7 @@ static int intel_scu_set_heartbeat(u32 t)
>   		 watchdog_device.timer_tbl_ptr->freq_hz);
>   	pr_debug("set_heartbeat: timer_set is %x (hex)\n",
>   		 watchdog_device.timer_set);
> -	pr_debug("set_hearbeat: timer_margin is %x (hex)\n", timer_margin);
> +	pr_debug("set_heartbeat: timer_margin is %x (hex)\n", timer_margin);
>   	pr_debug("set_heartbeat: threshold is %x (hex)\n",
>   		 watchdog_device.threshold);
>   	pr_debug("set_heartbeat: soft_threshold is %x (hex)\n",
