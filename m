From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 13 Oct 2019 08:45:09 +0000
Subject: Re: clk: rockchip: Checking a kmemdup() call in rockchip_clk_register_pll()
Message-Id: <29d12079-d888-e090-da5a-c407c13d696b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e96505a8-b554-f61e-3940-0b9e9c7850ff@web.de>
 <5801053.xxhhKtLrcJ@diego>
In-Reply-To: <5801053.xxhhKtLrcJ@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/rockchip/clk-pll.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n913
>> https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/clk/rockchip/clk-pll.c#L913
>>
>> * Do you find the usage of the format string “%s: could not allocate
>>   rate table for %s\n” still appropriate at this place?
>
> If there is an internal "no-memory" output from inside kmemdup now,
> I guess the one in the clock driver would be a duplicate and could go away.

How do you think about to recheck information sources around
the Linux allocation failure report?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=da94001239cceb93c132a31928d6ddc4214862d5#n878


>> * Is there a need to adjust the error handling here?
>
> There is no need for additional error handling.

If you would like to omit the macro call “WARN”, I would expect also
to express a corresponding null pointer check.


> Like if the rate-table could not be duplicated,
> the clock will still report the correct clockrate
> you can just not set a new rate.

How much will a different system configuration matter finally?
(Do you really want to treat this setting as “optional”?)


> And for a system it's always better to have the clock driver present
> than for all device-drivers to fail probing. Especially as this start as
> core clock driver, so there is no deferring possible.

I imagine that such a view can be clarified further.

Regards,
Markus
