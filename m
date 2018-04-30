From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Apr 2018 09:03:25 +0000
Subject: Re: [PATCH 10/61] gpio: simplify getting .drvdata
Message-Id: <CACRpkday+d9iGeX+CRHTEyC=w+oNUK-8oTy0HqugO5PRhHn62w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-11-wsa+renesas@sang-engineering.com>
 <b0c1e303-ca95-8bc8-a5d4-65e75dc8398a@ti.com>
In-Reply-To: <b0c1e303-ca95-8bc8-a5d4-65e75dc8398a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Thu, Apr 19, 2018 at 5:14 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 04/19/2018 09:05 AM, Wolfram Sang wrote:
>>
>> We should get drvdata from struct device directly. Going via
>> platform_device is an unneeded step back and forth.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>
>> Build tested only. buildbot is happy. Please apply individually.
>
>
> for gpio-omap.c:
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

Hm I only see the responses not the actual patch, I guess I will find it
sooner or later.

Wolfram: if I don't find it, poke me with something sharp so I get to apply it.

Yours,
Linus Walleij
