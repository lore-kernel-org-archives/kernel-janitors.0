From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 04 Aug 2020 08:31:52 +0000
Subject: Re: [PATCH] memory: jz4780-nemc: Fix return value check in jz4780_nemc_probe()
Message-Id: <20200804083152.GA26771@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200804082403.76297-1-weiyongjun1@huawei.com>
In-Reply-To: <20200804082403.76297-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Tue, Aug 04, 2020 at 08:24:03AM +0000, Wei Yongjun wrote:
> In case of error, the function devm_ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: f046e4a3f0b9 ("memory: jz4780_nemc: Only request IO memory the driver will use")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/memory/jz4780-nemc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Thanks for the patch. The fix was already posted by Dan:
https://lore.kernel.org/lkml/20200803143607.GC346925@mwanda/

Best regards,
Krzysztof
