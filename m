From: Mukesh Ojha <mojha@codeaurora.org>
Date: Fri, 05 Apr 2019 06:50:34 +0000
Subject: Re: [PATCH] ath6kl: remove redundant check of status != 0
Message-Id: <f46c3ce4-dc62-2897-60b9-455e46c72e58@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404134723.24667-1-colin.king@canonical.com>
In-Reply-To: <20190404134723.24667-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/4/2019 7:17 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> The check on status not being zero is redundant as previous code
> paths that set status to an error value break out of the while
> loop and hence status is never non-zero at the check. Remove
> this redundant code.
>
> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/net/wireless/ath/ath6kl/htc_pipe.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath6kl/htc_pipe.c b/drivers/net/wireless/ath/ath6kl/htc_pipe.c
> index 434b66829646..c68848819a52 100644
> --- a/drivers/net/wireless/ath/ath6kl/htc_pipe.c
> +++ b/drivers/net/wireless/ath/ath6kl/htc_pipe.c
> @@ -898,9 +898,6 @@ static int htc_process_trailer(struct htc_target *target, u8 *buffer,
>   			break;
>   		}
>   
> -		if (status != 0)
> -			break;
> -
>   		/* advance buffer past this record for next time around */
>   		buffer += record->len;
>   		len -= record->len;
