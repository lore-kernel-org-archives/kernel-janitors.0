From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 01 May 2020 16:08:58 +0000
Subject: Re: [PATCH v3] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <a4e38d72-ae8f-9a20-b7c5-7e6880f6642c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200501154033.GA25730@udknight>
In-Reply-To: <20200501154033.GA25730@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang YanQing <udknight@gmail.com>, Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

> The check supports below formats:

I suggest to omit the concrete examples.
I would prefer the explicit wording for the support of (Unicode) ellipses
also in the shown commit titles.

Will the document “submitting-patches.rst” need a corresponding adjustment?


> The check doesn't support below formats:

How do you think about to extend error diagnostics for patch checking?


> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface"

Missing closing parenthesis


> Fixes: 6c73698904aa pinctrl: qcom: Introduce readl/writel accessors

Missing enclosing delimiters


> Fixes: 3fd6e7d9a146 (ASoC: tas571x: New driver for TI TAS571x power amplifiers)
> Fixes: 55697cbb44e4 ("arm64: dts: renesas: r8a779{65,80,90}: Add IPMMU devices nodes)

Missing quotation characters


> Fixes: ba35f8588f47 (“ipvlan: Defer multicast / broadcast processing to a work-queue”)
…
> Fixes: 03f6fc6de919 ('ASoC: rt5682: Add the soundwire support')

Would we like to tolerate such quotation character alternatives?


> Fixes:      9b1640686470 ("scsi: lpfc: Fix use-after-free mailbox cmd completion")

How do you think about to tolerate extra white-space characters around
the commit identifier?


> Note: this patch also fixes double quotation mark issue for normal git
>       commit description, and now it supports double quotation mark in
>       title line, for example:
>       Commit e33e2241e272 ("Revert "cfg80211: Use 5MHz bandwidth by default
>       when checking usable channels"")

I find that such an example should trigger further software development considerations
for a safe data format description.


>  v2:
>  1: Add support for double quotation mark in title line, suggested by Markus Elfring.

I guess that the clarification is still evolving also around this aspect.

Regards,
Markus
