From: Domen Puncer <domen@coderock.org>
Date: Sat, 07 Feb 2004 21:31:31 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/net/wireless/strip.c MIN/MAX
Message-Id: <200402072231.31256.domen@coderock.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <402505A9.8060903@gmx.net>
In-Reply-To: <402505A9.8060903@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 07 of February 2004 21:24, Michael Veeck wrote:

<snip>

> >>-       int sx_size = MAX(STRIP_ENCAP_SIZE(MAX_RECV_MTU), 4096);
> >>+       int sx_size = max((int)STRIP_ENCAP_SIZE(MAX_RECV_MTU), 4096);
> >
> > max_t?
>
> Changed that to max_t and min_t. A newbie queston: What should when be
> preferred and why?

min_t/max_t when there are different type arguments.
Because it looks nicer? :-)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
