From: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 06 Nov 2018 16:52:54 +0000
Subject: Re: [PATCH] libertas: remove set but not used variable 'int_type'
Message-Id: <20181106165254.B70E261340@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539569795-176889-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539569795-176889-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Lubomir Rintel <lkundrak@v3.sk>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/wireless/marvell/libertas/if_spi.c: In function 'if_spi_h2c':
> drivers/net/wireless/marvell/libertas/if_spi.c:799:6: warning:
>  variable 'int_type' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction in
> commit d2b21f191753 ("libertas: if_spi, driver for libertas GSPI devices")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> Tested-by: Lubomir Rintel <lkundrak@v3.sk>

Patch applied to wireless-drivers-next.git, thanks.

937a13091cbd libertas: remove set but not used variable 'int_type'

-- 
https://patchwork.kernel.org/patch/10641005/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
