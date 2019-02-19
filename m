From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 19 Feb 2019 15:14:50 +0000
Subject: Re: [PATCH] libertas_tf: remove set but not used variable 'flags'
Message-Id: <20190219151450.2A3F9608D2@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213014917.164506-1-yuehaibing@huawei.com>
In-Reply-To: <20190213014917.164506-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Colin Ian King <colin.king@canonical.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/marvell/libertas_tf/main.c: In function 'lbtf_rx':
> drivers/net/wireless/marvell/libertas_tf/main.c:554:15: warning:
>  variable 'flags' set but not used [-Wunused-but-set-variable]
> 
> It never used and can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Acked-by: Steve deRosier <derosier@cal-sierra.com>

Patch applied to wireless-drivers-next.git, thanks.

e97cb6ea71b0 libertas_tf: remove set but not used variable 'flags'

-- 
https://patchwork.kernel.org/patch/10808997/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
