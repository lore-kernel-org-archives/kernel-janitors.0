From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 06 Nov 2018 16:58:27 +0000
Subject: Re: [PATCH] rtlwifi: btcoex: remove set but not used variable 'ppsc'
Message-Id: <20181106165827.768EA6049C@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540194675-65562-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1540194675-65562-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Larry Finger <Larry.Finger@lwfinger.net>, Colin Ian King <colin.king@canonical.com>, Nathan Chancellor <natechancellor@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c: In function 'halbtc_leave_lps':
> drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c:295:21: warning:
>  variable 'ppsc' set but not used [-Wunused-but-set-variable]
> 
> drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c: In function 'halbtc_enter_lps':
> drivers/net/wireless/realtek/rtlwifi/btcoexist/halbtcoutsrc.c:318:21: warning:
>  variable 'ppsc' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction in
> commit aa45a673b291 ("rtlwifi: btcoexist: Add new mini driver")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Ping-Ke Shih <pkshih@realtek.com>

Patch applied to wireless-drivers-next.git, thanks.

9198f460ec9d rtlwifi: btcoex: remove set but not used variable 'ppsc'

-- 
https://patchwork.kernel.org/patch/10651825/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
