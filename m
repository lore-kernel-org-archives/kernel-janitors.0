From: Randy Dunlap <rdunlap@infradead.org>
Date: Wed, 02 Sep 2020 15:50:55 +0000
Subject: Re: [PATCH][next] charger-manager: fix incorrect check on charging_duration_ms
Message-Id: <42cb421a-286e-65db-36b1-4fa794758279@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200902133117.108025-1-colin.king@canonical.com>
In-Reply-To: <20200902133117.108025-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Sebastian Reichel <sre@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Anton Vorontsov <anton.vorontsov@linaro.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>

On 9/2/20 6:31 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the duration check on the discharging duration setting is
> checking the charging duration rather than the discharging duration
> due to a cut-n-paste coding error. Fix this by checking the value
> desc->charging_max_duration_ms.
> 
> Addresses-Coverity: ("Copy-paste-error")
> Fixes: 8fcfe088e21a ("charger-manager: Support limit of maximum possible")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Gustavo has a different patch:
https://lore.kernel.org/lkml/20200902153846.GA10327@embeddedor/

> ---
>  drivers/power/supply/charger-manager.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/power/supply/charger-manager.c b/drivers/power/supply/charger-manager.c
> index 07992821e252..44d919954e9e 100644
> --- a/drivers/power/supply/charger-manager.c
> +++ b/drivers/power/supply/charger-manager.c
> @@ -471,7 +471,7 @@ static int check_charging_duration(struct charger_manager *cm)
>  	} else if (cm->battery_status = POWER_SUPPLY_STATUS_NOT_CHARGING) {
>  		duration = curr - cm->charging_end_time;
>  
> -		if (duration > desc->charging_max_duration_ms) {
> +		if (duration > desc->discharging_max_duration_ms) {
>  			dev_info(cm->dev, "Discharging duration exceed %ums\n",

preferably change:	                                        exceeds


>  				 desc->discharging_max_duration_ms);
>  			ret = true;
> 


-- 
~Randy
