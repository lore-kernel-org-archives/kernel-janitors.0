From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Fri, 14 Oct 2005 14:17:38 +0000
Subject: Re: [KJ] [PATCH] Get rid of yield()
Message-Id: <29495f1d0510140717y264682bfyc27f9f1e464156f7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051013191321.GA22138@masoud.ir>
In-Reply-To: <20051013191321.GA22138@masoud.ir>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 10/14/05, Matthew Wilcox <matthew@wil.cx> wrote:
> On Fri, Oct 14, 2005 at 06:35:16AM -0700, Nish Aravamudan wrote:
> > And from a functional perspective, this is clearly a case where there
> > is only one state that will match how the old code worked --
> > TASK_UNINTERRUPTIBLE. If one were to use TASK_INTERRUPTIBLE, there is
> > no guarantee that a single schedule_timeout(HZ/50) call would last the
> > full request time, so you'd need to loop there as well.
>
> Do you think it's worth putting a WARN_ON(current->state = TASK_RUNNING)
> into schedule_timeout(), or are there legitimate reasons for occasionally
> calling schedule_timeout() with the task in TASK_RUNNING?

I don't think there are any callers currently that are so broken -- I
fixed the ones I found, at least, with the patchsets to use msleep()
et al. I try to keep my eye on it, but haven't had much time for KJ
patches lately.

And now that we have schedule_timeout_interruptible() and
schedule_timeout_uninterruptible(), the number of direct callers of
schedule_timeout() should be pretty small (and get smaller with time).

There is *no* reason, though, for calling schedule_timeout() with
TASK_RUNNING, that I can think of. I guess one could design code that
might or might not sleep depending on some variable and set the state
to TASK_{UN,}INTERRUPTIBLE or TASK_RUNNING, respectively, and then
call schedule_timeout(). That would be nasty code, though, and
probably would never have been accepted by the community :)

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
