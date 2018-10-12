From: David Miller <davem@davemloft.net>
Date: Fri, 12 Oct 2018 16:48:55 +0000
Subject: Re: [PATCH net-next] net: cdc_ncm: remove set but not used variable 'ctx'
Message-Id: <20181012.094855.1242230536249147806.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539308953-185007-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539308953-185007-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: oliver@neukum.org, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 12 Oct 2018 01:49:13 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/usb/cdc_ncm.c: In function 'cdc_ncm_status':
> drivers/net/usb/cdc_ncm.c:1603:22: warning:
>  variable 'ctx' set but not used [-Wunused-but-set-variable]
>   struct cdc_ncm_ctx *ctx;
> 
> It not used any more after
> commit fa83dbeee558 ("net: cdc_ncm: remove redundant "disconnected" flag")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied.
