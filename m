From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 12 Dec 2020 13:17:27 +0000
Subject: Re: mmc: atmel-mci: Reduce =?utf-8?Q?scope?= =?utf-8?Q?_for_the_variable_=E2=80=9Cslot=E2=80=9D?= in
Message-Id: <20201212131727.GL1781038@piout.net>
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
In-Reply-To: <031a64e4261e1543a136d737436abefd63dbaee1.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, kernel-janitors@vger.kernel.org, linux-mmc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Markus Elfring <Markus.Elfring@web.de>, Dan Carpenter <dan.carpenter@oracle.com>, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org

On 12/12/2020 01:16:39-0800, Joe Perches wrote:
> On Fri, 2020-12-11 at 09:03 +0100, Alexandre Belloni wrote:
> > On 11/12/2020 07:34:41+0100, Markus Elfring wrote:
> > > > > How do you think about a patch like “staging: speakup: remove redundant initialization
> > > > > of pointer p_key” for comparison?
> > > > > https://lore.kernel.org/patchwork/patch/1199128/
> > > > > https://lore.kernel.org/driverdev-devel/20200223153954.420731-1-colin.king@canonical.com/
> > > > > 
> > > > > Would you tolerate to omit the initialisation for the variable “slot”?
> > > > 
> > > > If you were able to provide one good technical reason.
> > > 
> > > I find that the positions of variable definitions (and similar assignments) influence
> > > the generation of executable code.
> > > 
> > And you are wrong, it doesn't.
> 
> I rarely reply or read any Markus' emails as everything
> from Markus goes into a 'don't read' folder but I was cc'd
> directly on one from someone else recently so I think I
> should reply to this one too.
> 
> In this case Alexandre it seems true, but in the generic case
> it may be false.  It may depend on stack size and location.
> 
> For instance, with large structs declared either at the top
> of a function or in separate branches within the function:
> 

I think you realize your example is way more complicated than
initializing basic type variable to 0 or NULL which has probably been
optimized forever.

This patch is just unnecessary churn that was generated without giving
any thought. It was easy to check whether the patch actually improved
anything. It doesn't and makes readability worse.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
