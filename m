From: Satyam Sharma <satyam@infradead.org>
Date: Thu, 30 Aug 2007 21:33:09 +0000
Subject: Re: [PATCH] trivial - constify sched.h
Message-Id: <alpine.LFD.0.999.0708310239340.31519@enigma.security.iitk.ac.in>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1188247231.18004.129.camel@localhost> <20070827213323.GA1759@martell.zuzino.mipt.ru>
 <Pine.LNX.4.64.0708302120290.24730@fbirervta.pbzchgretzou.qr>
 <alpine.LFD.0.999.0708310121121.28360@enigma.security.iitk.ac.in>
 <Pine.LNX.4.64.0708302247070.10266@fbirervta.pbzchgretzou.qr>
In-Reply-To: <Pine.LNX.4.64.0708302247070.10266@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Thu, 30 Aug 2007, Jan Engelhardt wrote:
> 
> On Aug 31 2007 02:11, Satyam Sharma wrote:
> >> So that you can actually pass in a const struct task_struct * without having
> >> to cast it back to [non-const].
> >
> >... which makes zero sense, because ...
> >
> >> Why one would have a const struct task_struct * in the first place
> >> is a different matter.
> >
> >... exactly.
> >
> >> But see http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;hwadbfbf4cf96fedf9b75bb330704828c187b190
> >
> >That commit const-ified struct timespec * or struct timeval * arguments,
> >which made sense because: (1) those functions really did not modify the
> >passed structs, and, (2) callers that pass in const struct timeval *
> >or const struct timespec * are indeed plausible (because one can plausibly
> >have const timeval/timespec structs). As the changelog suggested, those
> >callers
> >
> >were having to cast away the const qualifier before passing to
> >these functions to avoid seeing "passing argument discards qualifiers"
> >warnings. While (1) holds true for the sched.h case here, (2) does not
> >(and there are no warnings to shut up either).
> 
> "those callers". There was _exactly one_ caller, and that was an out-of-tree
> module. There were not any in-kernel callers before, and it did not generate
> any warning. That is perhaps why no one had constified it before me.

You've completely missed the point -- it is _plausible_ that callers
(even if just _one_) have const timespec/timeval structs, which is why
that commit made sense as I mentioned above (to shut up the warning that
would otherwise occur). This does not hold true for the sched.h / struct
task_struct case here -- I cannot imagine a const task_struct.

> This does
> not mean we should wait for a caller to pop up before constifying IMHO.

Going about const-ifying such function arguments as in here (for the sake
of type safety, where the function does not modify that argument), could
easily lead to *zillions* of patches such as this which would have
absolutely _zero_ impact on the actual kernel that gets built.

As I said, if someone really wants to do this, please go about constifying
_data_ instead -- that would make a (positive) difference.
