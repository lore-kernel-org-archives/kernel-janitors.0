From: Ingo Molnar <mingo@elte.hu>
Date: Mon, 28 Mar 2011 05:08:44 +0000
Subject: Re: [PATCH v2] x86: page: get_order() optimization
Message-Id: <20110328050844.GC26322@elte.hu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301215556-8898-1-git-send-email-mcsim.planeta@gmail.com>
 <20110327113323.GA27825@elte.hu>
 <1301246136.2291.49.camel@debian>
In-Reply-To: <1301246136.2291.49.camel@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maksym Planeta <mcsim.planeta@gmail.com>
Cc: mingo@redhat.com, kernel-janitors@vger.kernel.org, namhyung@gmail.com, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Jan Beulich <JBeulich@novell.com>


* Maksym Planeta <mcsim.planeta@gmail.com> wrote:

> On Sat, 27/03/2011 at 13:33 +0200, Ingo Molnar wrote:
> > Just wondering, what's the before/after 'size vmlinux' effect on a 'make 
> > defconfig' x86 kernel? Does the optimization make the kernel smaller as well, 
> > besides making it faster?
> 
> Thank you for advice. I didn't really mentioned it. So without my patch:
> 
> size vmlinux
>    text	   data	    bss	    dec	    hex	filename
> 7915025	1253060	1122304	10290389	 9d04d5	vmlinux
> 
> And with it: 
> 
> size vmlinux
>    text	   data	    bss	    dec	    hex	filename
> 7919150	1251364	1122304	10292818	 9d0e52	vmlinux
> 
> Size increased. But I discovered that if I replace "inline" with
> "__always_inline" in get_order(), size will be following:
> 
> size vmlinux
>    text	   data	    bss	    dec	    hex	filename
> 7914481	1249252	1122304	10286037	 9cf3d5	vmlinux
> 
> And this is less than with same modification in asm-general:
> 
> size vmlinux
>    text	   data	    bss	    dec	    hex	filename
> 7914713	1249268	1122304	10286285	 9cf4cd	vmlinux
> 
> With my patch and "__always_inline" instead of just "inline" size will
> be the smallest.

Weird, that's an unexpected resut.

Have you looked at the disassembly, why does the size increase? I'd expect such 
a straight assembly optimization to result in smaller code: in the non-constant 
case it should be the same size as before, in the constant case it should be 
smaller, because BSR should be smaller than an open-coded search loop, right?

One sidenote, defconfig turns these on:

 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_OPTIMIZE_INLINING=y

And some versions of GCC arent very good with these.

Thanks,

	Ingo
