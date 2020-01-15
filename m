From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 15 Jan 2020 09:19:03 +0000
Subject: Re: [PATCH] ath11k: fix up some error paths
Message-Id: <20200115091903.7EC3FC4479C@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213105448.b7lic5ddih6c3sqy@kili.mountain>
In-Reply-To: <20191213105448.b7lic5ddih6c3sqy@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: John Crispin <john@phrozen.org>, Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>, Anilkumar Kolli <akolli@codeaurora.org>, Bhagavathi Perumal S <bperumal@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There are two error paths where "ret" wasn't set.  Ideally the compiler
> would have warned about these bugs, but we initialized "ret" to zero so
> it silenced the warning.  I have removed that.  Also if
> ath11k_hal_srng_get_entrysize() fails then we need to free some
> resources before returning.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Failed to apply:

error: patch failed: drivers/net/wireless/ath/ath11k/dp_tx.c:646
error: drivers/net/wireless/ath/ath11k/dp_tx.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11290443/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
