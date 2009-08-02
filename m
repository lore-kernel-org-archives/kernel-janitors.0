From: Borislav Petkov <petkovbb@googlemail.com>
Date: Sun, 02 Aug 2009 13:51:22 +0000
Subject: Re: [PATCH 15/15] drivers/ide/ide-cd.c: Use DIV_ROUND_CLOSEST
Message-Id: <20090802135122.GA15279@liondog.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908021049350.15557@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908021049350.15557@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Aug 02, 2009 at 10:49:54AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
> but is perhaps more readable.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @haskernel@
> @@
> 
> #include <linux/kernel.h>
> 
> @depends on haskernel@
> expression x,__divisor;
> @@
> 
> - (((x) + ((__divisor) / 2)) / (__divisor))
> + DIV_ROUND_CLOSEST(x,__divisor)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Borislav Petkov <petkovbb@gmail.com>

-- 
Regards/Gruss,
    Boris.
