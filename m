From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Tue, 15 Oct 2019 14:49:39 +0000
Subject: Re: clk: samsung: Checking a kmemdup() call in _samsung_clk_register_pll()
Message-Id: <CA+Ln22GpcMF5e8wjwoRH0wExyoGfta4n3YuaOBNDE+rfqhSZjg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7933ce8f-ca1b-6ed8-14b9-59679130dc47@web.de>
In-Reply-To: <7933ce8f-ca1b-6ed8-14b9-59679130dc47@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hi Markus,

2019年10月12日(土) 23:17 Markus Elfring <Markus.Elfring@web.de>:
>
> Hello,
>
> I tried another script for the semantic patch language out.
> This source code analysis approach points out that the implementation
> of the function “_samsung_clk_register_pll” contains also a call
> of the function “kmemdup”.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/samsung/clk-pll.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n1275
> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/clk/samsung/clk-pll.c#L1275

Thanks for the report.

>
> * Do you find the usage of the format string “%s: could not allocate
>   rate table for %s\n” still appropriate at this place?

Yes, AFAICT there is nothing wrong with that format string.

>
> * Is there a need to adjust the error handling here?

No, there isn't much that can be done if we fail the allocation at
such an early stage.

That said, there is no need to print any warnings or error messages on
allocation failure, so technically they could be removed. It doesn't
really give us anything in case of existing code, though, and only
makes a potential for merge conflicts, so I'd just leave it alone.

Best regards,
Tomasz
