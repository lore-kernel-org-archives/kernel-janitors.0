From: Mukesh Ojha <mojha@codeaurora.org>
Date: Tue, 16 Apr 2019 06:59:42 +0000
Subject: Re: [PATCH] iwlegacy: fix spelling mistake "acumulative" -> "accumulative"
Message-Id: <4c87d5c6-c5f8-c3f5-b0b9-2a70b888a622@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190415103703.11254-1-colin.king@canonical.com>
In-Reply-To: <20190415103703.11254-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Kalle Valo <kvalo@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/15/2019 4:07 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Fix spelling mistakes in rx stats text. I missed these from an earlier
> round of fixing the same spelling mistake.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh

> ---
>   drivers/net/wireless/intel/iwlegacy/3945-debug.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/intel/iwlegacy/3945-debug.c b/drivers/net/wireless/intel/iwlegacy/3945-debug.c
> index a2960032be81..4b912e707f38 100644
> --- a/drivers/net/wireless/intel/iwlegacy/3945-debug.c
> +++ b/drivers/net/wireless/intel/iwlegacy/3945-debug.c
> @@ -185,7 +185,7 @@ il3945_ucode_rx_stats_read(struct file *file, char __user *user_buf,
>   	pos +>   	    scnprintf(buf + pos, bufsz - pos,
>   		      "%-32s     current"
> -		      "acumulative       delta         max\n",
> +		      "accumulative      delta         max\n",
>   		      "Statistics_Rx - CCK:");
>   	pos +>   	    scnprintf(buf + pos, bufsz - pos,
> @@ -273,7 +273,7 @@ il3945_ucode_rx_stats_read(struct file *file, char __user *user_buf,
>   	pos +>   	    scnprintf(buf + pos, bufsz - pos,
>   		      "%-32s     current"
> -		      "acumulative       delta         max\n",
> +		      "accumulative      delta         max\n",
>   		      "Statistics_Rx - GENERAL:");
>   	pos +>   	    scnprintf(buf + pos, bufsz - pos,
> @@ -346,7 +346,7 @@ il3945_ucode_tx_stats_read(struct file *file, char __user *user_buf,
>   	pos +>   	    scnprintf(buf + pos, bufsz - pos,
>   		      "%-32s     current"
> -		      "acumulative       delta         max\n",
> +		      "accumulative      delta         max\n",
>   		      "Statistics_Tx:");
>   	pos +>   	    scnprintf(buf + pos, bufsz - pos,
> @@ -447,7 +447,7 @@ il3945_ucode_general_stats_read(struct file *file, char __user *user_buf,
>   	pos +>   	    scnprintf(buf + pos, bufsz - pos,
>   		      "%-32s     current"
> -		      "acumulative       delta         max\n",
> +		      "accumulative      delta         max\n",
>   		      "Statistics_General:");
>   	pos +>   	    scnprintf(buf + pos, bufsz - pos,
