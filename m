From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 19 Feb 2019 15:09:44 +0000
Subject: Re: [PATCH] rsi: remove set but not used variables 'info, vif'
Message-Id: <20190219150944.1C579608C6@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218075156.183879-1-yuehaibing@huawei.com>
In-Reply-To: <20190218075156.183879-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, Siva Rebbagondla <siva8118@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/rsi/rsi_91x_main.c: In function 'rsi_prepare_skb':
> drivers/net/wireless/rsi/rsi_91x_main.c:127:24: warning:
>  variable 'vif' set but not used [-Wunused-but-set-variable]
> 
> drivers/net/wireless/rsi/rsi_91x_main.c:124:28: warning:
>  variable 'info' set but not used [-Wunused-but-set-variable]
> 
> They're not used any more since 160ee2a11ce0 ("rsi: fill rx_params only once.")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

6f6e4f98ee52 rsi: remove set but not used variables 'info, vif'

-- 
https://patchwork.kernel.org/patch/10817423/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
