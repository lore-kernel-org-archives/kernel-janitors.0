From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 09 Oct 2019 17:33:57 +0000
Subject: Re: string.h: Mark 34 functions with __must_check
Message-Id: <CAKwvOd=Jo5UkQN9A9rTJf0WtsxXNjaJ=jxf2gwHFdW8om-fbTQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de> <20191009110943.7ff3a08a@gandalf.local.home>
 <CAKwvOdk3OTaAVmbV9Cu+Dzg8zuojjU6ENZfu4cUPaKS2a58d3w@mail.gmail.com>
 <20191009122735.17415f9c@gandalf.local.home> <CAKwvOdkvgeHnQ_SyR7QUqpsmtMPRe1SCJ_XJLQYv-gvLB6rbLg@mail.gmail.com>
 <b8bdfb25-deb8-9da0-3572-408b19bb0507@web.de>
In-Reply-To: <b8bdfb25-deb8-9da0-3572-408b19bb0507@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Steven Rostedt <rostedt@goodmis.org>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

On Wed, Oct 9, 2019 at 10:04 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > Ah, granted, I was surprised, too.
>
> Thanks for this view.

I mean, it's a good thing that we don't have any issues that this
patch would catch today.  Seems Steven and I were surprised
(pessimistic?).

>
>
> > Maybe would be helpful to mention that in the commit message.
>
> My Linux software build resources might be too limited to take
> more system configuration variations safely into account
> for this issue.

That's understandable. I think if the patch bakes in linux-next, it
might flush out some problematic cases in other ARCH's.

> Would you like to achieve further checks here?

I reviewed the functions here and believe the ones you added checks
for all look good.  I value Rasmus' feedback, so I'd like to hear what
he thinks about my earlier comments.  I have no comment if we should
go further/annotate more, other than that that can be done in a follow
up patch.  Though Joe's comment on the relative order of where the
annotation appears in the function declarations should be addressed in
a V2 IMO.
-- 
Thanks,
~Nick Desaulniers
