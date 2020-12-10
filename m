From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 10 Dec 2020 18:21:50 +0000
Subject: Re: [PATCH] mmc: atmel-mci: =?utf-8?Q?Redu?= =?utf-8?Q?ce_scope_for_the_variable_=E2=80=9Cslot?= =?u
Message-Id: <20201210182150.GE1578121@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <466b4c6d-032f-fbcc-58ac-75f6f39d734f@web.de>
 <20201210151035.GC1578121@piout.net>
 <ec71d7b8-a36b-04f5-77a8-22874ac241e1@web.de>
 <20201210170723.GD1578121@piout.net>
 <2667790c-fad2-aaa9-36e8-6be66949ac8d@web.de>
In-Reply-To: <2667790c-fad2-aaa9-36e8-6be66949ac8d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org

On 10/12/2020 18:23:05+0100, Markus Elfring wrote:
> >> Can the extra null pointer initialisation trigger a source code analysis warning
> >> like “Addresses-Coverity: ("Unused value")” for this function implementation?
> >>
> >
> > Did you check, does it? It doesn't.
> >
> > Are you wasting maintainer and reviewer's time? Yes you are.
> 
> How do you think about a patch like “staging: speakup: remove redundant initialization
> of pointer p_key” for comparison?
> https://lore.kernel.org/patchwork/patch/1199128/
> https://lore.kernel.org/driverdev-devel/20200223153954.420731-1-colin.king@canonical.com/
> 
> Would you tolerate to omit the initialisation for the variable “slot”?
> 

If you were able to provide one good technical reason.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
