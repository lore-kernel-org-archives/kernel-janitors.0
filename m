From: Vicente Feito <vicente.feito@gmail.com>
Date: Tue, 08 Feb 2005 08:10:15 +0000
Subject: Re: [KJ] updated kj-devel.pl
Message-Id: <200502080810.15817.vicente.feito@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502041215.01436.vicente.feito@gmail.com>
In-Reply-To: <200502041215.01436.vicente.feito@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello.
On Tuesday 08 February 2005 12:46 am, you wrote:
> Vicente Feito wrote:
> > According to the kj-devel.pl modified script I've sent (which I guess not
> > much people must be using).
> > I've removed the strlen and sprintf warning cause it's ok to use them,
> > amazingly the DO and DONT's document in kerneljanitors.org says that it's
> > not correct, but checking the linux/Documentation/cli_sti_removal.txt
> > file I've found that it's ok to use it, I've tried contacting the author
> > of the document with no luck yet.
> > Thank you.
> > PS: I'm not sending patches because this is not the official devel.pl
> > that it's on the janitors page. I would like to hear if someone is using
> > it, or everybody is using the other tools.
>
> I find the <module>: "You must use the init mechanism" checking
> a little too strong.  Not everything in linux/*.c has to be built
> as a module, so the tool needs to allow for that.
> And not everything is a device driver, but we should be able to
> use the tool anyway, to test for all applicable problems... IMO.

You're right, but I think it's important people know that, what do you think 
if I change that by this: "If you're building a module, be concious you must 
use the init mechanism", would that be better? I agree that may be a little 
bit annoying if you're not building anything as module and that message 
displays on you 50 times. What do you think?

> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> This message could be a little better:
> Using foo[] it's recommended against *foo
>
> How about:
> Using foo[] is recommended over *foo: saves memory references & code.
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Definitively, I'll change that right away, I didn't want to use long messages, 
but in some cases it's better.

>
> spinlock misuse detection is often not straightforward.
> E.g., in kernel/acct.c (2.6.11-rc3), I'm getting:
> Lock closed on line 115
> Lock closed on line 162
> Obtained spinlock on line 198, but never unlocked.
> acct.c:198:             spin_lock(&acct_globals.lock);
>
>
> Lock closed on line 247
> Lock closed on line 263
> Lock closed on line 521
> ^^^^^^^^^^^^^^ these line numbers appear to be off by 1 line.
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> More later.
Yes, besides the fact that line numbers are off by 1 in this case, there's a 
big problem with line numbers, because everything is going to the same array, 
so if you use lots of files the line part doesn't give you correct 
information anymore, I'll be fixing that right away, cause I think solving 
that not only permit having correct line numbers but the possibility of 
adding all the .h files too (of course the ones inside the *.c file).

Vicente.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
