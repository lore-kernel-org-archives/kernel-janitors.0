From: Satyam Sharma <satyam@infradead.org>
Date: Thu, 30 Aug 2007 20:53:14 +0000
Subject: Re: [PATCH] trivial - constify sched.h
Message-Id: <alpine.LFD.0.999.0708310121121.28360@enigma.security.iitk.ac.in>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1188247231.18004.129.camel@localhost> <20070827213323.GA1759@martell.zuzino.mipt.ru>
 <Pine.LNX.4.64.0708302120290.24730@fbirervta.pbzchgretzou.qr>
In-Reply-To: <Pine.LNX.4.64.0708302120290.24730@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Joe Perches <joe@perches.com>, Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Thu, 30 Aug 2007, Jan Engelhardt wrote:
> 
> On Aug 28 2007 01:33, Alexey Dobriyan wrote:
> >
> >On Mon, Aug 27, 2007 at 01:40:31PM -0700, Joe Perches wrote:
> >> Add const to some struct task_struct * uses
> >
> >Why, oh, why?
> 
> 
> So that you can actually pass in a const struct task_struct * without having
> to cast it back to [non-const].

... which makes zero sense, because ...

> Why one would have a const struct task_struct * in the first place
> is a different matter.

... exactly.

> But see http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;hwadbfbf4cf96fedf9b75bb330704828c187b190

That commit const-ified struct timespec * or struct timeval * arguments,
which made sense because: (1) those functions really did not modify the
passed structs, and, (2) callers that pass in const struct timeval *
or const struct timespec * are indeed plausible (because one can plausibly
have const timeval/timespec structs). As the changelog suggested, those
callers were having to cast away the const qualifier before passing to
these functions to avoid seeing "passing argument discards qualifiers"
warnings. While (1) holds true for the sched.h case here, (2) does not
(and there are no warnings to shut up either).

If one really wants to go about "constifying" the kernel, then I think
there's a lot of _data_ out there that should first be made const-
qualified. xxx_ops function tables, and the like.
