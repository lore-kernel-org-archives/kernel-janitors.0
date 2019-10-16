From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Wed, 16 Oct 2019 11:43:37 +0000
Subject: Re: clk: samsung: Checking a kmemdup() call in _samsung_clk_register_pll()
Message-Id: <CA+Ln22FCH-q-joG6i=K2u=3vZTwwytkk0Q48oKekGkVb+VtL3Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7933ce8f-ca1b-6ed8-14b9-59679130dc47@web.de> <CA+Ln22GpcMF5e8wjwoRH0wExyoGfta4n3YuaOBNDE+rfqhSZjg@mail.gmail.com>
 <39a142ae-e0a1-0683-d68c-128b388f480e@web.de>
In-Reply-To: <39a142ae-e0a1-0683-d68c-128b388f480e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>, kernel-janitors@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, LKML <linux-kernel@vger.kernel.org>

2019年10月16日(水) 2:55 Markus Elfring <Markus.Elfring@web.de>:
>
> > That said, there is no need to print any warnings or error messages on
> > allocation failure, so technically they could be removed.
>
> Do you find information sufficient from the Linux allocation failure report?

A backtrace should be enough for this kind of a failure that shouldn't
normally happen and if happens, then the rest of the system must be in
a state already about to fail anyway.

Best regards,
Tomasz
