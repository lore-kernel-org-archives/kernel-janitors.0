From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 10 Dec 2020 17:07:23 +0000
Subject: Re: [PATCH] mmc: atmel-mci: =?utf-8?Q?Redu?= =?utf-8?Q?ce_scope_for_the_variable_=E2=80=9Cslot?= =?u
Message-Id: <20201210170723.GD1578121@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <466b4c6d-032f-fbcc-58ac-75f6f39d734f@web.de>
 <20201210151035.GC1578121@piout.net>
 <ec71d7b8-a36b-04f5-77a8-22874ac241e1@web.de>
In-Reply-To: <ec71d7b8-a36b-04f5-77a8-22874ac241e1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-arm-kernel@lists.infradead.org

On 10/12/2020 17:35:31+0100, Markus Elfring wrote:
> >> A local variable was used only within an if branch.
> >> Thus move the definition for the variable “slot” into the corresponding
> >> code block.
> >>
> >
> > What is the improvement here?
> 
> A possible refactoring.
> https://refactoring.com/catalog/reduceScopeOfVariable.html
> 

I quote:
"Since declarations of variables in many cases costs computational
cycles, you may end up wasting time for nothing."

This is false, it doesn't.

I also quote:
"When I'm writing new code I find I don't scope my temps any less than
method scope. This is because I keep my methods short, so reducing scope
any further doesn't add much value. The value of this refactoring is in
breaking up a large method."

Is that function large? It is not.


> 
> > This makes the code harder to read.
> 
> Can the extra null pointer initialisation trigger a source code analysis warning
> like “Addresses-Coverity: ("Unused value")” for this function implementation?
> 

Did you check, does it? It doesn't.

Are you wasting maintainer and reviewer's time? Yes you are.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
