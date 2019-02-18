From: Christian Lamparter <chunkeey@gmail.com>
Date: Mon, 18 Feb 2019 16:04:49 +0000
Subject: Re: [PATCH] carl9170: clean up a clamp() call
Message-Id: <2108216.StK4OeqmAv@debian64>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218093154.GC7712@kadam>
In-Reply-To: <20190218093154.GC7712@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christian Lamparter <chunkeey@googlemail.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Monday, February 18, 2019 10:31:54 AM CET Dan Carpenter wrote:
> The parameter order for clamp is supposed to be clamp(value, low, high).
> When we write it in this order it's equivalent to
> min(head->plcp[3] & 0x7f, 75) which works in this context where the min
> is zero.  But it's not a correct use of the API.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Christian Lamparter <chunkeey@gmail.com>

> ---
>  drivers/net/wireless/ath/carl9170/rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/carl9170/rx.c b/drivers/net/wireless/ath/carl9170/rx.c
> index f7c2f19e81c1..8e154f6364a3 100644
> --- a/drivers/net/wireless/ath/carl9170/rx.c
> +++ b/drivers/net/wireless/ath/carl9170/rx.c
> @@ -427,7 +427,7 @@ static int carl9170_rx_mac_status(struct ar9170 *ar,
>  		if (head->plcp[6] & 0x80)
>  			status->enc_flags |= RX_ENC_FLAG_SHORT_GI;
>  
> -		status->rate_idx = clamp(0, 75, head->plcp[3] & 0x7f);
> +		status->rate_idx = clamp(head->plcp[3] & 0x7f, 0, 75);
>  		status->encoding = RX_ENC_HT;
>  		break;
>  
> 
