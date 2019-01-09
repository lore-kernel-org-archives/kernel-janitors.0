From: Stephen Boyd <sboyd@kernel.org>
Date: Wed, 09 Jan 2019 18:35:02 +0000
Subject: Re: [PATCH -next] clk: imx: fix potential NULL dereference in imx8qxp_lpcg_clk_probe()
Message-Id: <154705890283.15366.13108584006669963345@swboyd.mtv.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545115389-173136-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1545115389-173136-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Michael Turquette <mturquette@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Quoting Wei Yongjun (2018-12-17 22:43:09)
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
> ... when != res == NULL
> e = devm_ioremap(e1, res->start, e2);
> 
> Fixes: 1e3121bfe51a ("clk: imx: add imx8qxp lpcg driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to clk-fixes
