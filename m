From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 29 Apr 2019 14:50:39 +0000
Subject: Re: [PATCH] ath6kl: remove redundant check of status != 0
Message-Id: <20190429145039.3C462605A2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190404134723.24667-1-colin.king@canonical.com>
In-Reply-To: <20190404134723.24667-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> The check on status not being zero is redundant as previous code
> paths that set status to an error value break out of the while
> loop and hence status is never non-zero at the check. Remove
> this redundant code.
> 
> Addresses-Coverity: ("Logically dead code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e643da21e19a ath6kl: remove redundant check of status != 0

-- 
https://patchwork.kernel.org/patch/10885625/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
