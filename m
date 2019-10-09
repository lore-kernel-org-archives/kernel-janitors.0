From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 09 Oct 2019 17:33:45 +0000
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
Message-Id: <CAKwvOdntBXd3OPiCV5adcDjXor886-XnsSxcStAjYBJpuEBrqQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de> <20191009110943.7ff3a08a@gandalf.local.home>
 <CAKwvOdk3OTaAVmbV9Cu+Dzg8zuojjU6ENZfu4cUPaKS2a58d3w@mail.gmail.com> <4d890cae9cbbd873096cb1fadb477cf4632ddb9a.camel@perches.com>
In-Reply-To: <4d890cae9cbbd873096cb1fadb477cf4632ddb9a.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

On Wed, Oct 9, 2019 at 9:38 AM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2019-10-09 at 09:13 -0700, Nick Desaulniers wrote:
> > On Wed, Oct 9, 2019 at 8:09 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> > > On Wed, 9 Oct 2019 14:14:28 +0200 Markus Elfring <Markus.Elfring@web.de> wrote:
> []
> > > > Several functions return values with which useful data processing
> > > > should be performed. These values must not be ignored then.
> > > > Thus use the annotation “__must_check” in the shown function declarations.
> []
> > > I'm curious. How many warnings showed up when you applied this patch?
> >
> > I got zero for x86_64 and arm64 defconfig builds of linux-next with
> > this applied.  Hopefully that's not an argument against the more
> > liberal application of it?  I view __must_check as a good thing, and
> > encourage its application, unless someone can show that a certain
> > function would be useful to call without it.
>
> stylistic trivia, neither agreeing nor disagreeing with the patch
> as I generally avoid reading Markus' patches.
>
> I believe __must_check is best placed before the return type as
> that makes grep for function return type easier to parse.
>
> i.e. prefer
>         [static inline] __must_check <type> <function>(<args...>);
> over
>         [static inline] <type> __must_check <function>(<args...>);
>

+ Miguel
So I just checked `__cold`, and `__cold` is all over the board in
style.  I see it:
1. before anything fs/btrfs/super.c#L101
2. after static before return type (what you recommend) fs/btrfs/super.c#L2318
3. after return type fs/btrfs/inode.c#L9426

Can we pick a style and enforce it via checkpatch? (It's probably not
fun to check for each function attribute in
include/linux/compiler_attributes.h).
-- 
Thanks,
~Nick Desaulniers
