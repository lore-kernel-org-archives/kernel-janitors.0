From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 05 Oct 2018 08:38:32 +0000
Subject: Re: [PATCH] b43: remove set but not used variable 'wl'
Message-Id: <20181005083832.7D0B36076A@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538712945-141866-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538712945-141866-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Colin Ian King <colin.king@canonical.com>, linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/broadcom/b43/main.c: In function 'b43_one_core_detach':
> drivers/net/wireless/broadcom/b43/main.c:5496:17: warning:
>  variable 'wl' set but not used [-Wunused-but-set-variable]
>  
> After commit 644aa4d62096 ("b43: remove list of IEEE 802.11 devices")
> 'wl' is not used any more.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

a7dd5d7c2dd8 b43: remove set but not used variable 'wl'

-- 
https://patchwork.kernel.org/patch/10627361/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
