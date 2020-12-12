From: Joe Perches <joe@perches.com>
Date: Sat, 12 Dec 2020 18:48:55 +0000
Subject: Re: mmc: atmel-mci: Reduce scope for the variable =?UTF-8?Q?=E2=80=9Cslot=E2=80=9D?= in atmci_reques
Message-Id: <03bb4d4436ca7022effbf23551ada24ff9eeb4c6.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <466b4c6d-032f-fbcc-58ac-75f6f39d734f@web.de>
 <20201210151035.GC1578121@piout.net>
 <ec71d7b8-a36b-04f5-77a8-22874ac241e1@web.de>
 <20201210170723.GD1578121@piout.net>
 <2667790c-fad2-aaa9-36e8-6be66949ac8d@web.de>
 <20201210182150.GE1578121@piout.net>
 <4c0d8efe-de25-f168-8b8d-b7f1ede6c6b1@web.de>
 <20201211080301.GC1781038@piout.net>
 <031a64e4261e1543a136d737436abefd63dbaee1.camel@perches.com>
 <20201212131727.GL1781038@piout.net>
In-Reply-To: <20201212131727.GL1781038@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Markus Elfring <Markus.Elfring@web.de>, Dan Carpenter <dan.carpenter@oracle.com>, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org

On Sat, 2020-12-12 at 14:17 +0100, Alexandre Belloni wrote:
> On 12/12/2020 01:16:39-0800, Joe Perches wrote:
> > In this case Alexandre it seems true, but in the generic case
> > it may be false.  It may depend on stack size and location.
> > 
> > For instance, with large structs declared either at the top
> > of a function or in separate branches within the function:
>
> I think you realize your example is way more complicated than
> initializing basic type variable to 0 or NULL which has probably been
> optimized forever.

Maybe.

Markus does a lot of what most (or perhaps some) consider thoughtless.

A generic point might be maximizing the local scope of declarations.

Maximizing the local scope can make reading easier as the type of an
automatic used for a temporary purpose can be found closer to the code
that uses it.  This is especially true for long line-count functions.

IMO: it's a reasonable goal though in this instance perhaps unnecessary.

cheers, Joe
