From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Apr 2020 13:30:20 +0000
Subject: Re: [PATCH] clk/meson: Complete exception handling in meson8b_clkc_init_common()
Message-Id: <ceba9706-0819-54cf-c3d3-9ceb93d31c5e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Bernard Zhao <bernard@vivo.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: opensource.kernel@vivo.com, Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>

> In common init function, when run into err branch, we didn`t
> use kfree to release kzmalloc area, this may bring in memleak

* I suggest to improve also this change description.

* Please move the resource release functions to end of
  the function “meson8b_clkc_init_common” here.
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?id=96c9a7802af7d500a582d89a8b864584fe878c1b#n450

* Will the tag “Fixes” be relevant then for the completed exception handling?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=96c9a7802af7d500a582d89a8b864584fe878c1b#n183

Regards,
Markus
