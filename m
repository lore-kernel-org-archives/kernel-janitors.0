From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 17 Dec 2020 06:45:42 +0000
Subject: Re: [PATCH][next] ath11k: add missing null check on allocated skb
Message-Id: <20201217064542.EEE98C433C6@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201214232417.84556-1-colin.king@canonical.com>
In-Reply-To: <20201214232417.84556-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Currently the null check on a newly allocated skb is missing and
> this can lead to a null pointer dereference is the allocation fails.
> Fix this by adding a null check and returning -ENOMEM.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: 43ed15e1ee01 ("ath11k: put hw to DBS using WMI_PDEV_SET_HW_MODE_CMDID")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-current branch of ath.git, thanks.

292bff9480c8 ath11k: add missing null check on allocated skb

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201214232417.84556-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
