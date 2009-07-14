From: Ben Dooks <ben-linux@fluff.org>
Date: Tue, 14 Jul 2009 22:53:20 +0000
Subject: Re: [PATCH 5/5] drivers/i2c: Use resource_size
Message-Id: <20090714225320.GA10277@fluff.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907050837160.27464@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907050837160.27464-QfmoRoYWmW9knbxzx/v8hQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sun, Jul 05, 2009 at 08:37:50AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use the function resource_size, which reduces the chance of introducing
> off-by-one errors in calculating the resource size.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> struct resource *res;
> @@
> 
> - (res->end - res->start) + 1
> + resource_size(res)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

I'll class these as fixes and have applied them to my
tree for linus.

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
