From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Oct 2019 18:45:18 +0000
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
Message-Id: <20191009184518.GF13286@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
 <954c5d70-742f-7b0e-57ad-ea967e93be89@rasmusvillemoes.dk>
 <20191009135522.GA20194@kadam>
 <b1f055ec-b4ec-d0ed-a03d-7d9828fa9440@rasmusvillemoes.dk>
 <20191009143000.GD13286@kadam>
 <CAKwvOd=Jkd_qJULB+i1u31VJAex6KB=wFAyXO04V0UcAAEZeXw@mail.gmail.com>
In-Reply-To: <CAKwvOd=Jkd_qJULB+i1u31VJAex6KB=wFAyXO04V0UcAAEZeXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>

On Wed, Oct 09, 2019 at 09:31:41AM -0700, Nick Desaulniers wrote:
> On Wed, Oct 9, 2019 at 7:30 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Wed, Oct 09, 2019 at 04:21:20PM +0200, Rasmus Villemoes wrote:
> > > On 09/10/2019 15.56, Dan Carpenter wrote:
> > > > That's because glibc strlen is annotated with __attribute_pure__ which
> > > > means it has no side effects.
> > >
> > > I know, except it has nothing to do with glibc headers. Just try the
> > > same thing in the kernel. gcc itself knows this about __builtin_strlen()
> > > etc. If anything, we could annotate some of our non-standard functions
> > > (say, memchr_inv) with __pure - then we'd both get the Wunused-value in
> > > the nonsense cases, and allow gcc to optimize or reorder the calls.
> >
> > Huh.  You're right.  GCC already knows.  So this patch is pointless like
> > you say.
> 
> Is it? None of the functions in include/linux/string.h are currently
> marked __pure today.

I've already embarrassed myself with my ignorance once so I may as well
keep talking now...  GCC did complain about the unused result even
though we don't declare them as __pure.  So GCC rule must have this rule
built in.

We were discussing in a different thread that standard says that
memcpy() pointers can't be NULL (even when we're copying zero bytes) so
GCC will assume that's true.  If you have:

	memcpy(foo, bar, 0);

	if (foo)
		*foo = 0;


GCC will sometimes remove the condition.  This doesn't affect the kernel
because we use -fno-delete-null-pointer-checks.
https://groups.google.com/forum/#!msg/syzkaller-netbsd-bugs/8B4CIKN0Xz8/wRvIUWxiAgAJ

Weird, huh?

regards,
dan carpenter
