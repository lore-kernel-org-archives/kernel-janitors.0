From: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 11 May 2017 18:49:45 +0000
Subject: Re: [PATCH 1/9] mtd: cfi_cmdset_0020: Drop unnecessary static
Message-Id: <20170511184945.GJ70297@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493928654-18768-1-git-send-email-Julia.Lawall@lip6.fr>
 <1493928654-18768-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1493928654-18768-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, keescook@chromium.org, kernel-janitors@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

On Thu, May 04, 2017 at 10:10:46PM +0200, Julia Lawall wrote:
> Drop static on a local variable, when the variable is initialized before
> any use on every possible execution path through the function.  The static
> has no benefit, and dropping it reduces the code size.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @bad exists@
> position p;
> identifier x;
> type T;
> @@
> 
> static T x@p;
> ...
> x = <+...x...+>
> 
> @@
> identifier x;
> expression e;
> type T;
> position p != bad.p;
> @@
> 
> -static
>  T x@p;
>  ... when != x
>      when strict
> ?x = e;
> // </smpl>
> 
> The change in code size is indicates by the following output from the size
> command.
> 
> before:
>    text    data     bss     dec     hex filename
>   16671      48      16   16735    415f drivers/mtd/chips/cfi_cmdset_0020.o
> 
> after:
>    text    data     bss     dec     hex filename
>   16639      48       8   16695    4137 drivers/mtd/chips/cfi_cmdset_0020.o
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied patches 1 and 2 to l2-mtd.git/next, for 4.13.
