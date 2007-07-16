From: Cripps <acripps@gmail.com>
Date: Mon, 16 Jul 2007 17:33:10 +0000
Subject: Re: [KJ] [third][PATCH 3/4][2.6 drivers/net/skfp/smt.c:]replace SIZE
Message-Id: <c6711b6b0707161033s155ed673g1b28911decf0a20@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070716141818.30653.70760.sendpatchset@shcherbakov.homelinux.net>
In-Reply-To: <20070716141818.30653.70760.sendpatchset@shcherbakov.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I just assumed that the original maintainer of the code had a good reason
for writing the loop in the way he did. and cleaned up the piece that
pertained to my project. The way it is now still compiles with no errors, so
it must not be *entirely* broken (if at all).
Thanks for the comments. If the piece of code in question can actually use
some cleaning up, maybe you should get in contact with the maintainer and
talk it out ... as I've learned from previous attempts though, that change
is beyond the scope of this patch, and as such shouldn't be touched in this
patch. :)
-acripps

On 7/16/07, Matthew Wilcox <matthew@wil.cx> wrote:
>
> On Mon, Jul 16, 2007 at 07:06:36PM +0200, walter harms wrote:
> > your patch seems ok but the stile here ...
> >
> > pd=smt_pdef;
> > for(i=ARRAY_SIZE(smt_pdef);i;i--) {
> >       if (pd->ptype = type)
> >               break ;
> >       else pd++;
> > }
> >
> > normally i would say it should be more like
> for(i=0;i<ARRAY_SIZE(smt_pdef);i++) (rule of least surprise)
> > but i have no clue why he did it not this way.
>
> I can think of three possible reasons:
>
> 1. Speed.  Many processors have a 'branch if not zero' instruction.
> You can often eliminate one instruction per loop by counting down to
> zero instead of up to N.
>
> 2. Duplicate entries.  If you want to find the last item in the list
> which has ptype = type, you need to start at the end, not the front.
>
> 3. Speed.  If you're likely to be removing entries from a list in the
> opposite order to which you added them (a stack rather than a queue),
> you'll find it more quickly on average if you start at the end than at
> the beginning.
>
> There may be other reasons for iterating in the opposite direction;
> those are just three possible reasons that popped into my head when you
> asked the question.
>
> --
> "Bill, look, we understand that you're interested in selling us this
> operating system, but compare it to ours.  We can't possibly take such
> a retrograde step."
>
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
