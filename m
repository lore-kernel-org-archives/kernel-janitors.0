From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 11 Oct 2018 09:49:42 +0000
Subject: Re: [PATCH][next] ath10k: fix out of bound read on array ath10k_rates
Message-Id: <20181011094942.AE70660C7D@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181005215609.13935-1-colin.king@canonical.com>
In-Reply-To: <20181005215609.13935-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Sriram R <srirrama@codeaurora.org>, "David S . Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> An out-of-bounds read on array ath10k_rates is occurring because
> the maximum number of elements is currently based on the size of
> the array and not the number of elements in the array. Fix this
> by using ARRAY_SIZE instead of sizeof.
> 
> Detected by CoverityScan, CID#1473918 ("Out-of-bounds read")
> 
> Fixes: f279294e9ee2 ("ath10k: add support for configuring management packet rate")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

This is already fixed in ath-next.

error: patch failed: drivers/net/wireless/ath/ath10k/mac.c:164
error: drivers/net/wireless/ath/ath10k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Rejected.

-- 
https://patchwork.kernel.org/patch/10628815/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
