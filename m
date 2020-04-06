From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 06 Apr 2020 16:19:33 +0000
Subject: Re: [PATCH][next] ath11k: fix error message to correctly report the command that failed
Message-Id: <20200406161933.72BDCC433F2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200327192639.363354-1-colin.king@canonical.com>
In-Reply-To: <20200327192639.363354-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, John Crispin <john@phrozen.org>, ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Currently the error message refers to the command WMI_TWT_DIeABLE_CMDID
> which looks like a cut-n-paste mangled typo. Fix the message to match
> the command WMI_BSS_COLOR_CHANGE_ENABLE_CMDID that failed.
> 
> Fixes: 5a032c8d1953 ("ath11k: add WMI calls required for handling BSS color")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

9a8074e3bcd7 ath11k: fix error message to correctly report the command that failed

-- 
https://patchwork.kernel.org/patch/11462997/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
