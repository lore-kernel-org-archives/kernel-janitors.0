From: Stephen Boyd <sboyd@kernel.org>
Date: Tue, 20 Mar 2018 17:18:55 +0000
Subject: Re: [PATCH -next] clk: hisilicon: fix potential NULL dereference in hisi_clk_alloc()
Message-Id: <152156633511.183971.8534897713854322596@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1521555574-29189-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1521555574-29189-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiancheng Xue <xuejiancheng@hisilicon.com>, Markus Elfring <elfring@users.sourceforge.net>, Michael Turquette <mturquette@baylibre.com>, Shawn Guo <shawn.guo@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>, tianshuliang <tianshuliang@hisilicon.com>
Cc: linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

Quoting Wei Yongjun (2018-03-20 07:19:34)
> platform_get_resource() may fail and return NULL, so we should
> better check it's return value to avoid a NULL pointer dereference
> a bit later in the code.
> 
> This is detected by Coccinelle semantic patch.
> 
> @@
> expression pdev, res, n, t, e, e1, e2;
> @@
> 
> res = platform_get_resource(pdev, t, n);
> + if (!res)
> +   return -EINVAL;
> ... when != res = NULL
> e = devm_ioremap(e1, res->start, e2);
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Please add Fixes: tags.

This is an old one.

Fixes: 322269163a36 ("clk: hisilicon: add hisi_clk_alloc function.")

Applied to clk-next.
