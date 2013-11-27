From: DaeSeok Youn <daeseok.youn@gmail.com>
Date: Wed, 27 Nov 2013 07:33:17 +0000
Subject: Re: [PATCH] kernel/fork.c : remove local 'oldmm' and retval
Message-Id: <CAHb8M2AvVx2KcUv7q2Q-z-KgERuvEW68L9Oc_XromUTEcQvfpA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2547094.3YTvOEEdct@daeseok-laptop>
In-Reply-To: <2547094.3YTvOEEdct@daeseok-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2013/11/27 Julia Lawall <julia.lawall@lip6.fr>:
> On Tue, 26 Nov 2013, Eric W. Biederman wrote:
>
>> Daeseok Youn <daeseok.youn@gmail.com> writes:
>>
>> > From cec2f201f0dc99a33a58d9d1e0452140bb0993a1 Mon Sep 17 00:00:00 2001
>> > From: Daeseok Youn <daeseok.youn@lge.com>
>> > Date: Wed, 27 Nov 2013 09:54:41 +0900
>> > Subject: [PATCH] kernel/fork.c : remove local 'oldmm' and retval
>> >
>> >  Local oldmm is used only for increaing mm_users field
>> >  in current->mm. When clone_flags have a CLONE_VM flag,
>> >  current->mm is assigning to local 'mm'.
>> >  Local retval is used only for returning -ENOMEM value.
>> >  When dup_mm() is failed, just return -ENOMEM.
>>
>> You are making the generated code worse, and the source less
>> comprehensible.
>>
>> You are adding additional exit points making it harder to analyze the
>> function.
>
> There is neverthless a lot of code that just does return XXX; if there is
> nothng else to do in the error-handling code.
>
> Here I find at least the retval = -ENOMEM; at top level confusing.
> Already, the previous if+goto that is not error handling code is a little
> bit of a surprise, but the retval = -ENOMEM; in the main flow of execution
> suggests that for some reason the error handling code is being put after
> the if, for some reason, which does sometimes happen too.  But then it
> turns out that this is not error handling code.  It may still succeed or
> fail.  So it could be clearer to put the retval = -ENOMEM; inside the if
> just before the goto, if the goto is what is wanted.

Thanks for your comment.
actually I sent a e-mail before I get your e-mail.
I think "-ENOMEM" is enough to explain to fail by dup_mm() without
it has not error handling in "if (!mm)".

>
> On the other hand for kernel code maybe it is better not to touch what
> work, so it is more of a general esthetic comment.

Yes, you're right. if codes is explained what it is wanted without any comment,
I think that codes are good, too.

As a newbie, I didn't understand local oldmm what it means.
Because I found if clone flags has "CLONE_VM", child will be shared
address space with
parent. And then oldmm doesn't match completely what it is meaning of.
(just my opinion :) )

please let me know if I'm wrong.

Thanks.
Daeseok Youn.

>
> julia
>
>
>> You are introducing races and expense by not caching current->mm in
>> oldmm.
>>
>> This looks like code churn for no good reason, and that will result in
>> worse code.
>>
>> ick.
>>
>> Eric
>>
>> >  Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
>> > ---
>> >  kernel/fork.c |   16 +++++-----------
>> >  1 file changed, 5 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/kernel/fork.c b/kernel/fork.c
>> > index 728d5be..022a0af 100644
>> > --- a/kernel/fork.c
>> > +++ b/kernel/fork.c
>> > @@ -857,8 +857,7 @@ fail_nocontext:
>> >
>> >  static int copy_mm(unsigned long clone_flags, struct task_struct *tsk)
>> >  {
>> > -   struct mm_struct *mm, *oldmm;
>> > -   int retval;
>> > +   struct mm_struct *mm;
>> >
>> >     tsk->min_flt = tsk->maj_flt = 0;
>> >     tsk->nvcsw = tsk->nivcsw = 0;
>> > @@ -874,28 +873,23 @@ static int copy_mm(unsigned long clone_flags, struct task_struct *tsk)
>> >      *
>> >      * We need to steal a active VM for that..
>> >      */
>> > -   oldmm = current->mm;
>> > -   if (!oldmm)
>> > +   if (!current->mm)
>> >             return 0;
>> >
>> >     if (clone_flags & CLONE_VM) {
>> > -           atomic_inc(&oldmm->mm_users);
>> > -           mm = oldmm;
>> > +           mm = current->mm;
>> > +           atomic_inc(&mm->mm_users);
>> >             goto good_mm;
>> >     }
>> >
>> > -   retval = -ENOMEM;
>> >     mm = dup_mm(tsk);
>> >     if (!mm)
>> > -           goto fail_nomem;
>> > +           return -ENOMEM;
>> >
>> >  good_mm:
>> >     tsk->mm = mm;
>> >     tsk->active_mm = mm;
>> >     return 0;
>> > -
>> > -fail_nomem:
>> > -   return retval;
>> >  }
>> >
>> >  static int copy_fs(unsigned long clone_flags, struct task_struct *tsk)
>> --
>> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
