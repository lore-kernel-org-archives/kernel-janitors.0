From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Fri, 14 Oct 2005 13:35:16 +0000
Subject: Re: [KJ] [PATCH] Get rid of yield()
Message-Id: <29495f1d0510140635i75c9dfd2wbf3fa41c4a181a25@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051013191321.GA22138@masoud.ir>
In-Reply-To: <20051013191321.GA22138@masoud.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/14/05, Matthew Wilcox <matthew@wil.cx> wrote:
> On Thu, Oct 13, 2005 at 03:13:21PM -0400, Masoud Sharbiani wrote:
> > Hello,
> > the following patch removes yield() from all drivers. They have been replaced by schedule_timeout() or cond_resched(). Please verify and comment.
>
> You didn't even compile-test these, did you?
>
> > diff --git a/drivers/net/depca.c b/drivers/net/depca.c
> > --- a/drivers/net/depca.c
> > +++ b/drivers/net/depca.c
> > @@ -762,9 +762,7 @@ static int __init depca_hw_init (struct
> >               /* Trigger an initialization just for the interrupt. */
> >               outw(INEA | INIT, DEPCA_DATA);
> >
> > -             delay = jiffies + HZ/50;
> > -             while (time_before(jiffies, delay))
> > -                     yield();
> > +             schedule_timeout(HZ/50);
> >
> >               irqnum = probe_irq_off(irq_mask);
> >
>
> This one adds a warning -- the delay variable is no longer used.

And from a functional perspective, this is clearly a case where there
is only one state that will match how the old code worked --
TASK_UNINTERRUPTIBLE. If one were to use TASK_INTERRUPTIBLE, there is
no guarantee that a single schedule_timeout(HZ/50) call would last the
full request time, so you'd need to loop there as well.

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
