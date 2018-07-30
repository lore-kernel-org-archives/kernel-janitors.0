From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 30 Jul 2018 17:56:39 +0000
Subject: Re: [PATCH] ath5k: remove redundant pointer rf
Message-Id: <20180730175639.BF40362012@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180709124138.14996-1-colin.king@canonical.com>
In-Reply-To: <20180709124138.14996-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>, "Luis R . Rodriguez" <mcgrof@do-not-panic.com>, "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> Pointer rf is being assigned but is never used hence it is redundant
> and can be removed.
> 
> Cleans up two clang warnings:
> warning: variable 'rf' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

e8c38062efc6 ath5k: remove redundant pointer rf

-- 
https://patchwork.kernel.org/patch/10514529/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

