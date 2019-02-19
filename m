From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 19 Feb 2019 15:18:01 +0000
Subject: Re: [PATCH] rtl818x_pci: Remove set but not used variables 'io_addr, mem_addr'
Message-Id: <20190219151801.F3006608D4@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218075226.183964-1-yuehaibing@huawei.com>
In-Reply-To: <20190218075226.183964-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, Colin Ian King <colin.king@canonical.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c: In function 'rtl8180_probe':
> drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c:1727:15: warning:
>  variable 'io_addr' set but not used [-Wunused-but-set-variable]
> 
> drivers/net/wireless/realtek/rtl818x/rtl8180/dev.c:1726:16: warning:
>  variable 'mem_addr' set but not used [-Wunused-but-set-variable]
> 
> They're never used since introduction.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

b9b81d152cfb rtl818x_pci: Remove set but not used variables 'io_addr, mem_addr'

-- 
https://patchwork.kernel.org/patch/10817425/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
