From: David Miller <davem@davemloft.net>
Date: Fri, 26 Apr 2019 16:07:47 +0000
Subject: Re: [PATCH -next] NFC: st95hf: remove set but not used variables 'dev, nfcddev'
Message-Id: <20190426.120747.1538732968291927600.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190425020720.46560-1-yuehaibing@huawei.com>
In-Reply-To: <20190425020720.46560-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: sameo@linux.intel.com, daniel@zonque.org, dagmcr@gmail.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 25 Apr 2019 02:07:20 +0000

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/nfc/st95hf/core.c: In function 'st95hf_irq_thread_handler':
> drivers/nfc/st95hf/core.c:786:26: warning:
>  variable 'nfcddev' set but not used [-Wunused-but-set-variable]
> 
> drivers/nfc/st95hf/core.c:784:17: warning:
>  variable 'dev' set but not used [-Wunused-but-set-variable]
> 
> They are never used since introduction in
> commit cab47333f0f7 ("NFC: Add STMicroelectronics ST95HF driver")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thank you.
