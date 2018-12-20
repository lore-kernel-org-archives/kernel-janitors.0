From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 20 Dec 2018 07:45:05 +0000
Subject: Re: [PATCH] wil6210: remove set but not used variable 'wdev'
Message-Id: <20181220074505.9A84A609BD@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543996743-137124-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543996743-137124-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Maya Erez <merez@codeaurora.org>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/ath/wil6210/main.c: In function '_wil6210_disconnect':
> drivers/net/wireless/ath/wil6210/main.c:407:23: warning:
>  variable 'wdev' set but not used [-Wunused-but-set-variable]
> 
> It never used since commit ("e1b43407c034 wil6210: refactor disconnect flow")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Reviewed-by: Maya Erez <merez@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

3fe970e76b37 wil6210: remove set but not used variable 'wdev'

-- 
https://patchwork.kernel.org/patch/10713127/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
