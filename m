From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 29 Jan 2007 17:59:47 +0000
Subject: Re: [KJ] replacing "__FUNCTION__" with "__func__"?
Message-Id: <20070129175947.GB5546@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701271038360.9089@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Jan 27, 2007 at 10:42:33AM -0500, Robert P. J. Day wrote:
> 
>   given what you read here:
> 
> http://gcc.gnu.org/onlinedocs/gcc-4.1.1/gcc/Function-Names.html
> 
>   i briefly imagined replacing occurrences of "__FUNCTION__" with
> "__func__" until i counted the number of times the former occurs in
> the source tree:  7903.
> 
> ouch.
> 
>   in any event, it doesn't really matter since kernel.h contains:
> 
> #define __FUNCTION__ (__func__)

That's for gcc 2.95 thing, IIRC, which is not supported any longer.

> so i imagine it's best to let this one go.  i doubt anyone would
> approve of a single cleanup *that* disruptive.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
