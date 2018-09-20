From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 20 Sep 2018 12:12:32 +0000
Subject: Re: [PATCH] qtnfmac: remove set but not used variable 'vif'
Message-Id: <20180920121232.45382602A7@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536668904-13110-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536668904-13110-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Igor Mitsyanko <imitsyanko@quantenna.com>, Avinash Patil <avinashp@quantenna.com>, Sergey Matyukevich <smatyukevich@quantenna.com>, Sergei Maksimenko <smaksimenko@quantenna.com>, Vasily Ulyanov <vulyanov@quantenna.com>, Andrey Shevchenko <ashevchenko@quantenna.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/quantenna/qtnfmac/cfg80211.c: In function 'qtnf_dump_survey':
> drivers/net/wireless/quantenna/qtnfmac/cfg80211.c:694:19: warning:
>  variable 'vif' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Reviewed-by: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>

Patch applied to wireless-drivers-next.git, thanks.

93ed990e3a6e qtnfmac: remove set but not used variable 'vif'

-- 
https://patchwork.kernel.org/patch/10595609/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
