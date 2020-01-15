From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 15 Jan 2020 09:18:20 +0000
Subject: Re: [PATCH -next] ath11k: add dependency for struct ath11k member debug
Message-Id: <20200115091820.1A5C0C43383@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213012417.130719-1-maowenan@huawei.com>
In-Reply-To: <20191213012417.130719-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: davem@davemloft.net, msinada@codeaurora.org, periyasa@codeaurora.org, mpubbise@codeaurora.org, julia.lawall@lip6.fr, milehu@codeaurora.org, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Mao Wenan <maowenan@huawei.com> wrote:

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

Arnd already did something what I proposed:
https://patchwork.kernel.org/patch/11321921/

Patch set to Superseded.

-- 
https://patchwork.kernel.org/patch/11289709/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
