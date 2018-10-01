From: Kalle Valo <kvalo@codeaurora.org>
Date: Mon, 01 Oct 2018 14:08:58 +0000
Subject: Re: [PATCH] wil6210: remove set but not used variable 'start'
Message-Id: <20181001140858.36A7260C1B@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536669139-14848-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536669139-14848-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Maya Erez <merez@codeaurora.org>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/ath/wil6210/pm.c: In function 'wil_suspend_keep_radio_on':
> drivers/net/wireless/ath/wil6210/pm.c:193:16: warning:
>  variable 'start' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Reviewed-by: Maya Erez <merez@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

ec95e84c3955 wil6210: remove set but not used variable 'start'

-- 
https://patchwork.kernel.org/patch/10595613/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
