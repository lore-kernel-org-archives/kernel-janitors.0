From: Mukesh Ojha <mojha@codeaurora.org>
Date: Sun, 31 Mar 2019 07:27:49 +0000
Subject: Re: [PATCH] iwlegacy: remove redundant assignment to *res
Message-Id: <d4097a41-9d4e-866d-73c3-f9c978c9d7fd@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190330201422.8024-1-colin.king@canonical.com>
In-Reply-To: <20190330201422.8024-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 3/31/2019 1:44 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Currently 1 is being assigned to *res and then it is immediately
> updated with the computed result.  The first assignment is
> redundant and can be removed.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/net/wireless/intel/iwlegacy/4965.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/net/wireless/intel/iwlegacy/4965.c b/drivers/net/wireless/intel/iwlegacy/4965.c
> index ce4144a89217..a20b6c885047 100644
> --- a/drivers/net/wireless/intel/iwlegacy/4965.c
> +++ b/drivers/net/wireless/intel/iwlegacy/4965.c
> @@ -577,7 +577,6 @@ il4965_math_div_round(s32 num, s32 denom, s32 * res)
>   		sign = -sign;
>   		denom = -denom;
>   	}
> -	*res = 1;
>   	*res = ((num * 2 + denom) / (denom * 2)) * sign;
>   
>   	return 1;
