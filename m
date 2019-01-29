From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 29 Jan 2019 05:53:20 +0000
Subject: Re: [PATCH] ath10k: snoc: remove set but not used variable 'ar_snoc'
Message-Id: <4b16caf3-9a25-99d0-5b35-f27d6e5a5c65@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536200965-121172-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536200965-121172-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

ping...

On 2018/9/6 10:29, YueHaibing wrote:
> From: Yue Haibing <yuehaibing@huawei.com>
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/ath/ath10k/snoc.c: In function 'ath10k_snoc_tx_pipe_cleanup':
> drivers/net/wireless/ath/ath10k/snoc.c:681:22: warning:
>  variable 'ar_snoc' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/net/wireless/ath/ath10k/snoc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
> index fa1843a..2d6ae00 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -678,13 +678,11 @@ static void ath10k_snoc_tx_pipe_cleanup(struct ath10k_snoc_pipe *snoc_pipe)
>  {
>  	struct ath10k_ce_pipe *ce_pipe;
>  	struct ath10k_ce_ring *ce_ring;
> -	struct ath10k_snoc *ar_snoc;
>  	struct sk_buff *skb;
>  	struct ath10k *ar;
>  	int i;
>  
>  	ar = snoc_pipe->hif_ce_state;
> -	ar_snoc = ath10k_snoc_priv(ar);
>  	ce_pipe = snoc_pipe->ce_hdl;
>  	ce_ring = ce_pipe->src_ring;
> 
> 
> .
> 
