From: Tony Lindgren <tony@atomide.com>
Date: Fri, 28 Sep 2018 16:50:34 +0000
Subject: Re: [PATCH -next] gpio: omap: Remove set but not used variable 'dev'
Message-Id: <20180928165034.GH5662@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538101068-160486-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538101068-160486-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

* YueHaibing <yuehaibing@huawei.com> [180928 02:13]:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpio/gpio-omap.c: In function 'gpio_omap_cpu_notifier':
> drivers/gpio/gpio-omap.c:1327:17: warning:
>  variable 'dev' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks for noticing this:

Acked-by: Tony Lindgren <tony@atomide.com>
