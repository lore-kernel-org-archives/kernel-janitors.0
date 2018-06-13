From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 13 Jun 2018 11:51:23 +0000
Subject: Re: ath10k: fix memory leak of tpc_stats
Message-Id: <20180613115123.F3D0F60717@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180527211702.23778-1-colin.king@canonical.com>
In-Reply-To: <20180527211702.23778-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin Ian King <colin.king@canonical.com> wrote:

> Currently tpc_stats is allocated and is leaked on the return
> path if num_tx_chain is greater than WMI_TPC_TX_N_CHAIN. Avoid
> this leak by performing the check on num_tx_chain before the
> allocation of tpc_stats.
> 
> Detected by CoverityScan, CID#1469422 ("Resource Leak")
> Fixes: 4b190675ad06 ("ath10k: fix kernel panic while reading tpc_stats")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

260e629bbf44 ath10k: fix memory leak of tpc_stats

-- 
https://patchwork.kernel.org/patch/10429553/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

