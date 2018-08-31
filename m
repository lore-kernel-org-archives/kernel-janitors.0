From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Fri, 31 Aug 2018 09:17:57 +0000
Subject: Re: [PATCH -next] rtc: mrst: remove set but not used variable 'valid'
Message-Id: <20180831091757.GN16561@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1535681739-156599-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1535681739-156599-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 31/08/2018 02:15:39+0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/rtc/rtc-mrst.c: In function 'mrst_procfs':
> drivers/rtc/rtc-mrst.c:264:29: warning:
>  variable 'valid' set but not used [-Wunused-but-set-variable]
>   unsigned char rtc_control, valid;
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/rtc/rtc-mrst.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
