From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 16 Oct 2019 10:55:22 +0000
Subject: Re: clk: samsung: Checking a kmemdup() call in _samsung_clk_register_pll()
Message-Id: <285fab33-0513-8a6b-f30d-f602c4e5108e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7933ce8f-ca1b-6ed8-14b9-59679130dc47@web.de>
 <CA+Ln22GpcMF5e8wjwoRH0wExyoGfta4n3YuaOBNDE+rfqhSZjg@mail.gmail.com>
In-Reply-To: <CA+Ln22GpcMF5e8wjwoRH0wExyoGfta4n3YuaOBNDE+rfqhSZjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, LKML <linux-kernel@vger.kernel.org>

>> * Is there a need to adjust the error handling here?
>
> No, there isn't much that can be done if we fail the allocation at
> such an early stage.

Can it matter to perform the setting “pll->rate_count” only according
to a null pointer check for the variable “pll->rate_table”
because of the function call “kmemdup”?

Regards,
Markus
