From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 30 Jul 2018 17:54:38 +0000
Subject: Re: [PATCH] ath10k: remove redundant pointers 'dev' and 'noa'
Message-Id: <20180730175438.377C362203@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180709123446.14796-1-colin.king@canonical.com>
In-Reply-To: <20180709123446.14796-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Pointers dev and noa are being assigned but are never used hence they
> are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'dev' set but not used [-Wunused-but-set-variable]
> warning: variable 'noa' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e6712aa1244f ath10k: remove redundant pointers 'dev' and 'noa'

-- 
https://patchwork.kernel.org/patch/10514521/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

