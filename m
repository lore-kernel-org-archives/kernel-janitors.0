From: WANG Cong <xiyou.wangcong@gmail.com>
Date: Fri, 06 Apr 2007 13:58:46 +0000
Subject: Re: [KJ] how about a "NO-OP" macro or something?
Message-Id: <20070406135846.GB3784@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0704060702440.26640@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0704060702440.26640@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Apr 06, 2007 at 07:06:04AM -0400, Robert P. J. Day wrote:
>
>  it's amusing how many source/header files use the construct "do { }
>while (0)" to define macros into nothingness:
>
>  $ grep -r "do { } while (0)" * | wc -l
>  1051
>
>  i'm guessing it's *way* too late to do anything about it now, but
>wouldn't it have made more sense to define a "NO-OP" macro or
>something to represent the empty operation?  just thinking out loud.
>
>rday
>

Oh, don't touch that. Let me tell you why 'do{...}while(0)' is a good thing.

Please think this question: how to put a group of C statements together in a macro defination?
Yeah, it's easy for you. Maybe you can give the following code at once.

	#define foo(a) init((a)); do_with((a)); destroy((a))

This works well when you just want do something like this:

	foo(a);

But how about the following situation?

	if (something_is_true)
		foo(a);

It is not what you really want. Another solution? OK. Maybe this one is better.

        #define foo(a) {init((a)); do_with((a)); destroy((a));}

But how about the last semicolon? Now, you will realize that 'do{...}while(0)' can help you. You can use it to solve the above problem:

        #define foo(a) do {init((a)); do_with((a));destroy((a));} while (0)

Hmm, this looks like nice. You should know it is useful now. But it still has a problem. You can't get a 'return value' from the function-like macro. But what if I want one? Try this:

        #define foo(a) ({init((a)); do_with((a)); destroy((a));})

You can also find such code from linux kernel source code.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
