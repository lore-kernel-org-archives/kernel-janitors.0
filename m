From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 15 Oct 2019 17:55:18 +0000
Subject: Re: clk: samsung: Checking a kmemdup() call in _samsung_clk_register_pll()
Message-Id: <39a142ae-e0a1-0683-d68c-128b388f480e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7933ce8f-ca1b-6ed8-14b9-59679130dc47@web.de>
 <CA+Ln22GpcMF5e8wjwoRH0wExyoGfta4n3YuaOBNDE+rfqhSZjg@mail.gmail.com>
In-Reply-To: <CA+Ln22GpcMF5e8wjwoRH0wExyoGfta4n3YuaOBNDE+rfqhSZjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, LKML <linux-kernel@vger.kernel.org>

> That said, there is no need to print any warnings or error messages on
> allocation failure, so technically they could be removed.

Do you find information sufficient from the Linux allocation failure report?

Regards,
Markus
