From: Kalle Valo <kvalo@codeaurora.org>
Date: Sat, 13 Oct 2018 17:05:54 +0000
Subject: Re: [PATCH] rtl8xxxu: Remove set but not used variables 'usedesc40' and 'seq_number'
Message-Id: <20181013170554.3879D60B72@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539008219-149058-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539008219-149058-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c: In function 'rtl8xxxu_tx':
> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:4925:7: warning:
>  variable 'usedesc40' set but not used [-Wunused-but-set-variable]
> 
> drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_core.c:4921:6: warning:
>  variable 'seq_number' set but not used [-Wunused-but-set-variable]
> 
> 'usedesc40' and 'seq_number' are not used any more after
> commit b59415c2dd08 ("rtl8xxxu: Split filling of TX descriptors into separate functions")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

03ce6f8a6776 rtl8xxxu: Remove set but not used variables 'usedesc40' and 'seq_number'

-- 
https://patchwork.kernel.org/patch/10630829/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
