From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 09 Oct 2019 16:40:59 +0000
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
Message-Id: <CAKwvOdkvgeHnQ_SyR7QUqpsmtMPRe1SCJ_XJLQYv-gvLB6rbLg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de> <20191009110943.7ff3a08a@gandalf.local.home>
 <CAKwvOdk3OTaAVmbV9Cu+Dzg8zuojjU6ENZfu4cUPaKS2a58d3w@mail.gmail.com> <20191009122735.17415f9c@gandalf.local.home>
In-Reply-To: <20191009122735.17415f9c@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Oct 9, 2019 at 9:27 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Wed, 9 Oct 2019 09:13:17 -0700
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> > On Wed, Oct 9, 2019 at 8:09 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> > >
> > > I'm curious. How many warnings showed up when you applied this patch?
> >
> > I got zero for x86_64 and arm64 defconfig builds of linux-next with
> > this applied.  Hopefully that's not an argument against the more
> > liberal application of it?  I view __must_check as a good thing, and
> > encourage its application, unless someone can show that a certain
> > function would be useful to call without it.
>
> Not at all, I was just curious, because I would have expected patches
> to fix possible bugs with it.

Ah, granted, I was surprised, too.  Maybe would be helpful to mention
that in the commit message.
-- 
Thanks,
~Nick Desaulniers
