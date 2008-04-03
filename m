From: David Miller <davem@davemloft.net>
Date: Thu, 03 Apr 2008 22:00:21 +0000
Subject: Re: [PATCH] drivers/atm/ambassador.c: stop inlining largish static
Message-Id: <20080403.150021.230322261.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200804010314.58117.vda.linux@googlemail.com>
In-Reply-To: <200804010314.58117.vda.linux@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vda.linux@googlemail.com
Cc: chas@cmf.nrl.navy.mil, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Denys Vlasenko <vda.linux@googlemail.com>
Date: Tue, 1 Apr 2008 03:14:58 +0200

> This patch removes "inline" from these static functions
> (regardless of number of callsites - gcc nowadays auto-inlines
> statics with one callsite).
> 
> Size difference for 32bit x86:
>    text    data     bss     dec     hex filename
>   10209    8488       4   18701    490d linux-2.6-ALLYES/drivers/atm/ambassador.o
>    9462    8488       4   17954    4622 linux-2.6.inline-ALLYES/drivers/atm/ambassador.o
> 
> Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>

I've applied this to net-2.6.26, if John doesn't like it we
can fix it or revert.
