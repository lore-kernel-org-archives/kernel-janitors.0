From: David Miller <davem@davemloft.net>
Date: Mon, 14 Apr 2008 04:54:52 +0000
Subject: Re: [PATCH] drivers/atm/horizon.c: stop inlining largish static
Message-Id: <20080413.215452.31407494.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200804081221.42465.vda.linux@googlemail.com>
In-Reply-To: <200804081221.42465.vda.linux@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vda.linux@googlemail.com
Cc: chas@cmf.nrl.navy.mil, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Denys Vlasenko <vda.linux@googlemail.com>
Date: Tue, 8 Apr 2008 12:21:42 +0200

> drivers/atm/horizon.c has unusually large number
> of static inline functions - 36.
> 
> I looked through them. Most of them seems to be small enough,
> but a few are big, others are using udelay or busy loop,
> and as such are better not be inlined.
> 
> This patch removes "inline" from these static functions
> (regardless of number of callsites - gcc nowadays auto-inlines
> statics with one callsite).
> 
> Size difference for 32bit x86:
>    text    data     bss     dec     hex filename
>    8201     180       6    8387    20c3 linux-2.6-ALLYES/drivers/atm/horizon.o
>    7840     180       6    8026    1f5a linux-2.6.inline-ALLYES/drivers/atm/horizon.o
> 
> Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>

Applied to net-2.6.26, thanks Denys.
