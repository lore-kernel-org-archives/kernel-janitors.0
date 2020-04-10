From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 10 Apr 2020 10:56:25 +0000
Subject: Re: drm/tve200: Checking for a failed platform_get_irq() call in tve200_probe()
Message-Id: <235b500a-0e5e-9ca3-4be5-9026c7d9f87f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0263f4fb-c349-7651-b590-8722cdd30c85@web.de>
 <20200410101831.GA27723@ravnborg.org>
In-Reply-To: <20200410101831.GA27723@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Sam Ravnborg <sam@ravnborg.org>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

> The right way to check for errors is to check if the return value is
> less than 0.

Thanks for your constructive feedback.

I was unsure if I noticed another programming mistake.


> Could you please audit all uses of platform_get_irq() in drivers/gpu/

I found 20 source files from the software “Linux next-20200408”
which seem to contain similar update candidates.
Would you like to clarify any extensions for improved applications
of scripts with the semantic patch language (Coccinelle software)
for corresponding analysis and transformation purposes?


> and send a series of patches, one for each driver.

Do other contributors know the affected software module better than me?

Regards,
Markus
