From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 16 Sep 2016 05:32:33 +0000
Subject: Re: clk/Renesas-MSTP: Less function calls in cpg_mstp_clocks_init() after error detection
Message-Id: <4a7d20c9-d080-80a4-6529-bc9fa1b7a186@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
 <b945de99-815a-b380-e13c-17b01e0febad@users.sourceforge.net>
 <CAMuHMdX=We-N--Fc0KWD_p8AmnBMYDW9b560VGKi+SZ5k85e9A@mail.gmail.com>
 <50646b53-663f-f77f-a79e-2422b5687688@users.sourceforge.net>
 <CAMuHMdWgK7HSqL+XWdrzDZkvmg5rb3MtykYNkS1amm5HgnOBAg@mail.gmail.com>
In-Reply-To: <CAMuHMdWgK7HSqL+XWdrzDZkvmg5rb3MtykYNkS1amm5HgnOBAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michael Turquette <mturquette@baylibre.com>, Simon Horman <horms+renesas@verge.net.au>, Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

>> * Should it usually be determined quicker if a required resource like
>>   memory could be acquired before trying the next allocation?
> 
> Note that if memory allocation fails in this driver, the system won't
> boot at all.

Thanks for this information.


> So even not checking for allocation failures at all could be acceptable.

I find this opinion interesting somehow.

I would generally prefer to check return values from various function calls
immediately instead of keeping the discussed source code structure unchanged.

Regards,
Markus
