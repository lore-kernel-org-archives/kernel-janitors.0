From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Wed, 16 Oct 2019 11:44:18 +0000
Subject: Re: clk: samsung: Checking a kmemdup() call in _samsung_clk_register_pll()
Message-Id: <CA+Ln22Ft47yJx5hO0YNOobJDGtg7t0_DPdeBif3LmMcn8gyykw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7933ce8f-ca1b-6ed8-14b9-59679130dc47@web.de> <CA+Ln22GpcMF5e8wjwoRH0wExyoGfta4n3YuaOBNDE+rfqhSZjg@mail.gmail.com>
 <285fab33-0513-8a6b-f30d-f602c4e5108e@web.de>
In-Reply-To: <285fab33-0513-8a6b-f30d-f602c4e5108e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, kernel-janitors@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, LKML <linux-kernel@vger.kernel.org>

2019年10月16日(水) 19:55 Markus Elfring <Markus.Elfring@web.de>:
>
> >> * Is there a need to adjust the error handling here?
> >
> > No, there isn't much that can be done if we fail the allocation at
> > such an early stage.
>
> Can it matter to perform the setting “pll->rate_count” only according
> to a null pointer check for the variable “pll->rate_table”
> because of the function call “kmemdup”?

It would be a good practice indeed, but looking from the code,
pll->rate_table is checked elsewhere, not pll->rate_count.

Best regards,
Tomasz
