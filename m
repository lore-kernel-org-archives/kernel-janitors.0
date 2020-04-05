From: Vladimir Zapolskiy <vz@mleia.com>
Date: Sun, 05 Apr 2020 16:31:22 +0000
Subject: Re: [PATCH] rtc: Delete an error message in three functions
Message-Id: <a33be664-7b21-a9a5-de45-7bb24740e927@mleia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <04116352-b464-041c-1939-96440133aa6f@web.de>
In-Reply-To: <04116352-b464-041c-1939-96440133aa6f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

On 4/5/20 6:36 PM, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 5 Apr 2020 17:30:15 +0200
> 
> The function “platform_get_irq” can log an error already.
> Thus omit redundant messages for the exception handling in the
> calling functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/rtc/rtc-fsl-ftm-alarm.c | 4 +---
>  drivers/rtc/rtc-lpc24xx.c       | 4 +---

For LPC24xx/18xx/43xx change

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

>  drivers/rtc/rtc-mt2712.c        | 4 +---
>  3 files changed, 3 insertions(+), 9 deletions(-)
> 

--
Best wishes,
Vladimir
