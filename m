From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 20 Dec 2018 16:47:01 +0000
Subject: Re: [PATCH] ath10k: remove set but not used variable 'num_tdls_vifs'
Message-Id: <20181220164701.CED3C607F1@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541669570-110540-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541669570-110540-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_sta_state':
> drivers/net/wireless/ath/ath10k/mac.c:6238:7: warning:
>  variable 'num_tdls_vifs' set but not used [-Wunused-but-set-variable]
> 
> 'num_tdls_vifs' not used any more after
>   9a993cc1ea95 ("ath10k: fix the logic of limiting tdls peer counts")
> 
> Also, remove the single called function ath10k_mac_tdls_vifs_count
> and ath10k_mac_tdls_vifs_count_iter.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

bff70e5f78e9 ath10k: remove set but not used variable 'num_tdls_vifs'

-- 
https://patchwork.kernel.org/patch/10673841/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
