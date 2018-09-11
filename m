From: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>
Date: Tue, 11 Sep 2018 12:58:54 +0000
Subject: Re: [PATCH] qtnfmac: remove set but not used variable 'vif'
Message-Id: <20180911125853.2j7cflclfhkbpgct@bars>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536668904-13110-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536668904-13110-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Igor Mitsyanko <imitsyanko@quantenna.com>, Avinash Patil <avinashp@quantenna.com>, Sergey Matyukevich <smatyukevich@quantenna.com>, Kalle Valo <kvalo@codeaurora.org>, Sergei Maksimenko <smaksimenko@quantenna.com>, Vasily Ulyanov <vulyanov@quantenna.com>, Andrey Shevchenko <ashevchenko@quantenna.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/quantenna/qtnfmac/cfg80211.c: In function 'qtnf_dump_survey':
> drivers/net/wireless/quantenna/qtnfmac/cfg80211.c:694:19: warning:
>  variable 'vif' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks !

Reviewed-by: Sergey Matyukevich <sergey.matyukevich.os@quantenna.com>

Regards,
Sergey
