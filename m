From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Date: Sun, 17 Feb 2008 17:17:47 +0000
Subject: Re: [PATCH 1/4] : More use DIV_ROUND_UP
Message-Id: <200802171817.48155.bzolnier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0802161548370.1185@pc-041.diku.dk>
In-Reply-To: <Pine.LNX.4.58.0802161548370.1185@pc-041.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Saturday 16 February 2008, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The kernel.h macro DIV_ROUND_UP performs the computation (((n) + (d) - 1) /
> (d)) but is perhaps more readable.
> 
> An extract of the semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @haskernel@
> @@
> 
> #include <linux/kernel.h>
> 
> @depends on haskernel@
> expression n,d;
> @@
> 
> (
> - (n + d - 1) / d
> + DIV_ROUND_UP(n,d)
> |
> - (n + (d - 1)) / d
> + DIV_ROUND_UP(n,d)
> )
> 
> @depends on haskernel@
> expression n,d;
> @@
> 
> - DIV_ROUND_UP((n),d)
> + DIV_ROUND_UP(n,d)
> 
> @depends on haskernel@
> expression n,d;
> @@
> 
> - DIV_ROUND_UP(n,(d))
> + DIV_ROUND_UP(n,d)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

applied, thanks
