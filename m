From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 20 Jul 2020 14:19:06 +0000
Subject: Re: [PATCH] clk: ti: clkctrl: add the missed kfree() for _ti_omap4_clkctrl_setup()
Message-Id: <ddf4efea-0a4b-de0a-e0cd-bdc04f5859d6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b7f0dcda-7ec8-b3d8-ba53-c2720799abbc@web.de>
In-Reply-To: <b7f0dcda-7ec8-b3d8-ba53-c2720799abbc@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, linux-clk@vger.kernel.org, linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>

…
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -655,8 +655,10 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
>  		}
>
>  		hw = kzalloc(sizeof(*hw), GFP_KERNEL);
> -		if (!hw)
> +		if (!hw) {
> +			kfree(clkctrl_name);
>  			return;
> +		}
…

I suggest to use an additional label instead.

 		if (!hw)
-			return;
+			goto free_control_name;


By the way:
How do you think about to replace the label “cleanup” by other jump targets
for better exception handling in this function implementation?

Regards,
Markus
