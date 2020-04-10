From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 10 Apr 2020 12:25:57 +0000
Subject: Re: drm/tve200: Checking for a failed platform_get_irq() call in tve200_probe()
Message-Id: <9971df1b-0651-fac0-847f-cf07eefe8996@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0263f4fb-c349-7651-b590-8722cdd30c85@web.de>
 <20200410101831.GA27723@ravnborg.org>
 <235b500a-0e5e-9ca3-4be5-9026c7d9f87f@web.de>
 <20200410121406.GA31761@ravnborg.org>
In-Reply-To: <20200410121406.GA31761@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Sam Ravnborg <sam@ravnborg.org>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Tang Bin <tangbin@cmss.chinamobile.com>

>> I found 20 source files from the software “Linux next-20200408”
>> which seem to contain similar update candidates.
>> Would you like to clarify any extensions for improved applications
>> of scripts with the semantic patch language (Coccinelle software)
>> for corresponding analysis and transformation purposes?
> Please just send a series of patches, one for each driver.

I am used to this possibility for years.


> Each changelog needs to explain the rationale behind the change.

I hope to achieve higher confidence also around specific checks
for return values of Linux functions so that unwanted misunderstandings
can be avoided for mentioned implementation details.


> As for coccinelle - I cannot help you.

I might help you more also by the means of this development tool
if related system factors can be improved somehow.

Regards,
Markus
