From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 19 Dec 2019 13:38:18 +0000
Subject: Re: [PATCH -next] ath11k: add dependency for struct ath11k member debug
Message-Id: <875zic77w5.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213012417.130719-1-maowenan@huawei.com>
In-Reply-To: <20191213012417.130719-1-maowenan@huawei.com> (Mao Wenan's
 message of "Fri, 13 Dec 2019 09:24:17 +0800")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: linux-wireless@vger.kernel.org, milehu@codeaurora.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, ath11k@lists.infradead.org, julia.lawall@lip6.fr, mpubbise@codeaurora.org, msinada@codeaurora.org, periyasa@codeaurora.org, davem@davemloft.net

Mao Wenan <maowenan@huawei.com> writes:

> If CONFIG_ATH11K, CONFIG_MAC80211_DEBUGFS are set,
> and CONFIG_ATH11K_DEBUGFS is not set, below error can be found,
> drivers/net/wireless/ath/ath11k/debugfs_sta.c: In function ath11k_dbg_sta_open_htt_peer_stats:
> drivers/net/wireless/ath/ath11k/debugfs_sta.c:411:4: error: struct ath11k has no member named debug
>   ar->debug.htt_stats.stats_req = stats_req;
>
> It is to add the dependency for the member of struct ath11k.
>
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  drivers/net/wireless/ath/ath11k/debugfs_sta.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/debugfs_sta.c b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
> index 3c5f931..bcc51d7 100644
> --- a/drivers/net/wireless/ath/ath11k/debugfs_sta.c
> +++ b/drivers/net/wireless/ath/ath11k/debugfs_sta.c
> @@ -408,7 +408,9 @@ ath11k_dbg_sta_open_htt_peer_stats(struct inode *inode, struct file *file)
>  		return -ENOMEM;
>  
>  	mutex_lock(&ar->conf_mutex);
> +#ifdef CONFIG_ATH11K_DEBUGFS
>  	ar->debug.htt_stats.stats_req = stats_req;
> +#endif

ifdefs are ugly and I don't think this is the root cause for the
problem. I suspect (but not sure!) that ATH11K_DEBUGFS should depend on
MAC80211_DEBUGFS, not DEBUG_FS like it does now. Or would there be a
valid reason to have ATH11K_DEBUGFS enabled but not MAC80211_DEBUGFS?

Then we could also change Makefile to this:

ath11k-$(CONFIG_ATH11K_DEBUGFS) += debugfs_sta.o

And hopefully get rid of an ifdef:

drivers/net/wireless/ath/ath11k/debug.h:#ifdef CONFIG_MAC80211_DEBUGFS
drivers/net/wireless/ath/ath11k/debug.h:#else /* !CONFIG_MAC80211_DEBUGFS */
drivers/net/wireless/ath/ath11k/debug.h:#endif /* CONFIG_MAC80211_DEBUGFS*/

Care to try this out?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
