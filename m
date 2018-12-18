From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 18 Dec 2018 09:48:43 +0000
Subject: Re: [PATCH -next] clk: imx: fix potential NULL dereference in imx8qxp_lpcg_clk_probe()
Message-Id: <CAOMZO5C1+bxWtapaBrdzf0o3Q30BkBNHLg9=4K5ZsxBk6s2DWw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545115389-173136-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1545115389-173136-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org, linux-clk <linux-clk@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>

Hi Wei,

On Tue, Dec 18, 2018 at 4:36 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:

>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!res)
> +               return -EINVAL;
>         base = devm_ioremap(dev, res->start, resource_size(res));

Wouldn't it be better to use devm_ioremap_resource(), which does the NULL check?
