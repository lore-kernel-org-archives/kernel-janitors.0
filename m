From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 31 Jul 2018 07:20:29 +0000
Subject: Re: [PATCH] ray_cs: remove redundant pointer 'p'
Message-Id: <20180731072029.1243B607BD@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180720180740.21018-1-colin.king@canonical.com>
In-Reply-To: <20180720180740.21018-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer 'p' is being assigned but is never used hence it is
> redundant and can be removed. Also re-work if statement to remove
> redundant assignment of p.
> 
> Cleans up clang warning:
> warning: variable 'p' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

f21bcefcf91c ray_cs: remove redundant pointer 'p'

-- 
https://patchwork.kernel.org/patch/10538143/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

