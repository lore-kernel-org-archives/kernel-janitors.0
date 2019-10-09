From: Joe Perches <joe@perches.com>
Date: Wed, 09 Oct 2019 16:38:33 +0000
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
Message-Id: <4d890cae9cbbd873096cb1fadb477cf4632ddb9a.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
         <20191009110943.7ff3a08a@gandalf.local.home>
         <CAKwvOdk3OTaAVmbV9Cu+Dzg8zuojjU6ENZfu4cUPaKS2a58d3w@mail.gmail.com>
In-Reply-To: <CAKwvOdk3OTaAVmbV9Cu+Dzg8zuojjU6ENZfu4cUPaKS2a58d3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Nick Desaulniers <ndesaulniers@google.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, 2019-10-09 at 09:13 -0700, Nick Desaulniers wrote:
> On Wed, Oct 9, 2019 at 8:09 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> > On Wed, 9 Oct 2019 14:14:28 +0200 Markus Elfring <Markus.Elfring@web.de> wrote:
[]
> > > Several functions return values with which useful data processing
> > > should be performed. These values must not be ignored then.
> > > Thus use the annotation “__must_check” in the shown function declarations.
[]
> > I'm curious. How many warnings showed up when you applied this patch?
> 
> I got zero for x86_64 and arm64 defconfig builds of linux-next with
> this applied.  Hopefully that's not an argument against the more
> liberal application of it?  I view __must_check as a good thing, and
> encourage its application, unless someone can show that a certain
> function would be useful to call without it.

stylistic trivia, neither agreeing nor disagreeing with the patch
as I generally avoid reading Markus' patches.

I believe __must_check is best placed before the return type as
that makes grep for function return type easier to parse.

i.e. prefer
	[static inline] __must_check <type> <function>(<args...>);
over
	[static inline] <type> __must_check <function>(<args...>);
