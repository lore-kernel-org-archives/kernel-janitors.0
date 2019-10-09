From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 09 Oct 2019 16:31:41 +0000
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
Message-Id: <CAKwvOd=Jkd_qJULB+i1u31VJAex6KB=wFAyXO04V0UcAAEZeXw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de> <954c5d70-742f-7b0e-57ad-ea967e93be89@rasmusvillemoes.dk>
 <20191009135522.GA20194@kadam> <b1f055ec-b4ec-d0ed-a03d-7d9828fa9440@rasmusvillemoes.dk>
 <20191009143000.GD13286@kadam>
In-Reply-To: <20191009143000.GD13286@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Oct 9, 2019 at 7:30 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Oct 09, 2019 at 04:21:20PM +0200, Rasmus Villemoes wrote:
> > On 09/10/2019 15.56, Dan Carpenter wrote:
> > > That's because glibc strlen is annotated with __attribute_pure__ which
> > > means it has no side effects.
> >
> > I know, except it has nothing to do with glibc headers. Just try the
> > same thing in the kernel. gcc itself knows this about __builtin_strlen()
> > etc. If anything, we could annotate some of our non-standard functions
> > (say, memchr_inv) with __pure - then we'd both get the Wunused-value in
> > the nonsense cases, and allow gcc to optimize or reorder the calls.
>
> Huh.  You're right.  GCC already knows.  So this patch is pointless like
> you say.

Is it? None of the functions in include/linux/string.h are currently
marked __pure today.  (Side note, I'm surprised that any function that
accepts a pointer could be considered pure. I could reassign pointed
to value without changing the pointers value. I can see strlen being
"pure" for string literals, but not for char[].  This is something
I'll play with more, I've already spotted one missed optimization in
LLVM: https://bugs.llvm.org/show_bug.cgi?idC624).

I think it would be an interesting study to see how often functions
that have return codes are ok to not check vs aren't ok (in a large
production codebase like the Linux kernel), similar to how 97% of
cases fallthrough is unintentional (which to me sounds like maybe the
default behavior of the language is incorrect).
-- 
Thanks,
~Nick Desaulniers
