From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 30 Jul 2018 17:57:33 +0000
Subject: Re: [PATCH] ath6kl: remove redundant variables netlen, orig_buf, orig_len, dropped and stats
Message-Id: <20180730175733.B6B8B60B15@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180709131720.6668-1-colin.king@canonical.com>
In-Reply-To: <20180709131720.6668-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Variables netlen, orig_buf, orig_len, dropped and stats are assigned values
> but are never used hence they are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'netlen' set but not used [-Wunused-but-set-variable]
> warning: variable 'orig_buf' set but not used [-Wunused-but-set-variable]
> warning: variable 'orig_len' set but not used [-Wunused-but-set-variable]
> warning: variable 'dropped' set but not used [-Wunused-but-set-variable]
> warning: variable 'stats' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

619c9700a8fe ath6kl: remove redundant variables netlen, orig_buf, orig_len, dropped and stats

-- 
https://patchwork.kernel.org/patch/10514565/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

