From: Greg KH <greg@kroah.com>
Date: Sat, 14 Feb 2004 04:55:52 +0000
Subject: Re: [Kernel-janitors] [PATCH] - 2.6.2 - security.h - compiler cleanups
Message-Id: <20040214045552.GA19957@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200402122141.59608.ron@rongage.org>
In-Reply-To: <200402122141.59608.ron@rongage.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Feb 13, 2004 at 10:45:24PM +0000, Matthew Wilcox wrote:
> static int foo(int x, int __unused y)
> 
> also doesn't warn, and that's the same syntax as __user, which gives me
> the warm fuzzies.

This is much more sane and nice.

Can we get a warning from the compiler if we actually use a variable
marked __unused?

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
