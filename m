From: Stephen Boyd <sboyd@kernel.org>
Date: Thu, 08 Aug 2019 15:05:25 +0000
Subject: Re: [PATCH] clk: Use seq_puts() in possible_parent_show()
Message-Id: <20190808150526.9F2A1217D7@mail.kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5961554a-6416-48ea-44e2-d8e3c7576af0@web.de>
In-Reply-To: <5961554a-6416-48ea-44e2-d8e3c7576af0@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Quoting Markus Elfring (2019-07-01 13:24:37)
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 Jul 2019 22:20:40 +0200
> 
> A string which did not contain a data format specification should be put
> into a sequence. Thus use the corresponding function “seq_puts”.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Applied to clk-next
