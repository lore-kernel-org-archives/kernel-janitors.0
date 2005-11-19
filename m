From: Nish Aravamudan <nish.aravamudan@gmail.com>
Date: Sat, 19 Nov 2005 18:27:37 +0000
Subject: Re: [KJ] [PATCH] drivers/cdrom/aztcd.c: busy loop updates + error
Message-Id: <29495f1d0511191027v362b2a2ewde5019c9dd29a96d@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <437ED2A4.8040308@comhem.se>
In-Reply-To: <437ED2A4.8040308@comhem.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 11/19/05, Daniel Marjam=E4ki <daniel.marjamaki@comhem.se> wrote:
>
>
> Thanks for the feedback Nish!
>
>
>  > Nope, you *must* set the state before calling schedule_timeout. We
>  > have even simplified this further by adding
>  > schedule_timeout_interruptible() and
>  > schedule_timeout_uninterruptible(). Same for all the others.
>
> I wasn't aware of that. I've changed to schedule_timeout_interruptible..
> I cannot find any attempts to disable interrupts during the busy loops in=
 the
> original code. Therefore I think it should be safe to say "interruptible".

Looks good.

>  > Is this fixing a bug you've actually seen? Otherwise you're changing
>  > functionality without a real reason.
>
> I thought it was a bad idea not to handle errors.
> But I can really see your point and therefore I removed these changes from
> my patch.

Certainly generally you are correct. But the kernel is a sensitive
beast. Does this driver have a maintainer? May be worth posting to
LKML if not asking if anyone uses the driver (perhaps referring to the
appropriate CONFIG_ option(s) that enable it), and asking if they
would be willing to test your patch.

> The new suggested patch looks like this:
> Changes:
> * Sleep during busy loops
> * Time out is based on elapsed time

Patch looks good, but is AZT_TIMEOUT used anywhere now (can we get rid
of it completely)?

Thanks,
Nish

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
