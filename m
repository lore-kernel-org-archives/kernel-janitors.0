From: Kalle Valo <kvalo@codeaurora.org>
Date: Sat, 13 Oct 2018 17:27:12 +0000
Subject: Re: [PATCH] ath10k: htt: remove some dead code
Message-Id: <20181013172712.EAAB860BF7@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181011080920.GA15131@mwanda>
In-Reply-To: <20181011080920.GA15131@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Anilkumar Kolli <akolli@codeaurora.org>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We added an unnecessary condition here in commit a904417fc876 ("ath10k:
> add extended per sta tx statistics support").  "legacy_rate_idx" is a u8
> so it can't be negative.  The caller doesn't pass negatives either.  I
> have deleted this code.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e3bfecd5cd37 ath10k: htt: remove some dead code

-- 
https://patchwork.kernel.org/patch/10636255/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
