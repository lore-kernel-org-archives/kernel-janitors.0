From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Sun, 22 Sep 2019 02:46:49 +0000
Subject: Re: [PATCH] rtc: r7301: Use devm_platform_ioremap_resource() in rtc7301_rtc_probe()
Message-Id: <CAC5umyjWuFH4iADS=_KYWsL=osdw1o56cdabjNftgSDsXzzLUw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8c17a59c-82ff-aa6b-5653-a38d786d3e83@web.de>
In-Reply-To: <8c17a59c-82ff-aa6b-5653-a38d786d3e83@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Rob Herring <robh@kernel.org>

2019年9月21日(土) 20:49 Markus Elfring <Markus.Elfring@web.de>:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Sep 2019 13:43:07 +0200
>
> Simplify this function implementation by using a known wrapper function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Akinobu Mita <akinobu.mita@gmail.com>
