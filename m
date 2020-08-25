From: qianli zhao <zhaoqianligood@gmail.com>
Date: Tue, 25 Aug 2020 08:55:52 +0000
Subject: Re: [PATCH v2] workqueue: Warn when work flush own workqueue
Message-Id: <CAPx_LQEaVq_LFXdhTAkyc_EczurqkLzKcVhb6YKFw6V_0jQbvg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <74f570e0aab48b86f7a157d87c16715289d457f4.1598323824.git.zhaoqianli@xiaomi.com>
 <8aef74ea-5b28-07e1-d66b-91ed9e0920e9@web.de>
In-Reply-To: <8aef74ea-5b28-07e1-d66b-91ed9e0920e9@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Qianli Zhao <zhaoqianli@xiaomi.com>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Markus

Thanks for your suggestion,and sorry for my poor wording.

On Tue, Aug 25, 2020 at 4:00 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > Flushing own workqueue or work self in work context will lead to
> > a deadlock.
>
> I imagine that the wording “or work self” can become clearer another bit.
>
>
> > Catch this incorrect usage and issue a warning when issue happened
>
> * Would you like to mark the end of such a sentence with a dot?
>
> * How do you think about to adjust the repetition of the word “issue”?

How about below changelog?

workqueue: Warn when work flush own workqueue

Flushing itself or own workqueue in work context will
lead to a deadlock.
Catch this incorrect usage and warning when issue happened.

>
>
> …
> > - update comment
> > ---
> >  kernel/workqueue.c | 10 +++++++---
>
> I suggest to replace these triple dashes by a blank line.
Ok
>
>
> …
> > @@ -2585,6 +2585,7 @@ static int rescuer_thread(void *__rescuer)
> >   * @target_work: work item being flushed (NULL for workqueue flushes)
> >   *
> >   * %current is trying to flush the whole @target_wq or @target_work on it.
> > + * If a work flushing own workqueue or itself will lead to a deadlock.
>
> I stumble on understanding challenges for the wording “work flushing”.
> Can an adjustment help in comparison to the term “work item”?

How about below comment?

* If a work item flushing own workqueue or itself will lead to a deadlock.

>
> Regards,
> Markus
