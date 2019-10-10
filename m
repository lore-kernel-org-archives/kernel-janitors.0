From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Thu, 10 Oct 2019 07:20:39 +0000
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
Message-Id: <b35d2c1a-641f-b97f-8335-066693dfe37a@rasmusvillemoes.dk>
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
To: Nick Desaulniers <ndesaulniers@google.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>

On 09/10/2019 18.31, Nick Desaulniers wrote:
> On Wed, Oct 9, 2019 at 7:30 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>
>> On Wed, Oct 09, 2019 at 04:21:20PM +0200, Rasmus Villemoes wrote:
>>> On 09/10/2019 15.56, Dan Carpenter wrote:
>>>> That's because glibc strlen is annotated with __attribute_pure__ which
>>>> means it has no side effects.
>>>
>>> I know, except it has nothing to do with glibc headers. Just try the
>>> same thing in the kernel. gcc itself knows this about __builtin_strlen()
>>> etc. If anything, we could annotate some of our non-standard functions
>>> (say, memchr_inv) with __pure - then we'd both get the Wunused-value in
>>> the nonsense cases, and allow gcc to optimize or reorder the calls.
>>
>> Huh.  You're right.  GCC already knows.  So this patch is pointless like
>> you say.
> 
> Is it? None of the functions in include/linux/string.h are currently
> marked __pure today. 

As I said, gcc knows this about the standard C functions, the ones it
has a __builtin_* version of. So it doesn't matter if the user adds a
__pure annotation or not (be it in libc or kernel headers). For example,
here's a line from gcc's builtins.def

DEF_LIB_BUILTIN        (BUILT_IN_STRCMP, "strcmp",
BT_FN_INT_CONST_STRING_CONST_STRING, ATTR_PURE_NOTHROW_NONNULL_LEAF)

so gcc knows that __builtin_strcmp is not just pure, but its argument
can also be assumed to be non-NULL, etc. (OK, the kernel disables the
use of that knowledge, but this is irrelevant to this discussion).

In constrast, e.g. abs and most libm functions is

DEF_LIB_BUILTIN        (BUILT_IN_ABS, "abs", BT_FN_INT_INT,
ATTR_CONST_NOTHROW_LEAF_LIST)

i.e. "attribute(__const__)" (se below).

 (Side note, I'm surprised that any function that
> accepts a pointer could be considered pure. I could reassign pointed
> to value without changing the pointers value.

Probably depends on your definition of pure. What matters is gcc's, which is

'const'
     Many functions do not examine any values except their arguments,
     and have no effects except the return value.  Basically this is
     just slightly more strict class than the 'pure' attribute below,
     since function is not allowed to read global memory.

     Note that a function that has pointer arguments and examines the
     data pointed to must _not_ be declared 'const'.  Likewise, a
     function that calls a non-'const' function usually must not be
     'const'.  It does not make sense for a 'const' function to return
     'void'.

'pure'
     Many functions have no effects except the return value and their
     return value depends only on the parameters and/or global
     variables.  Such a function can be subject to common subexpression
     elimination and loop optimization just as an arithmetic operator
     would be.  These functions should be declared with the attribute
     'pure'.  For example,

          int square (int) __attribute__ ((pure));

     says that the hypothetical function 'square' is safe to call fewer
     times than the program says.

     Some common examples of pure functions are 'strlen' or 'memcmp'.
     Interesting non-pure functions are functions with infinite loops or
     those depending on volatile memory or other system resource, that
     may change between two consecutive calls (such as 'feof' in a
     multithreading environment).

And yes, gcc knows perfectly well that more or less any write to memory
(except in the very few cases where it can prove no aliasing)
"invalidates" the result of a pure function. In some very simple cases,
that means it can hoist a strlen() call out of a badly written loop like

for (i = 0; i < strlen(s); ++i)

but the loop body can't be very complicated before that fails. Example:
https://godbolt.org/z/f0PPRt . I gave up trying to decipher what clang
produced.

(BTW, the pure example in the docs is bad, because that function is
likely to be const and not just pure.)

I can see strlen being
> "pure" for string literals, but not for char[].  This is something
> I'll play with more, I've already spotted one missed optimization in
> LLVM: https://bugs.llvm.org/show_bug.cgi?idC624).

I see that compiler_attributes unconditionally #defines __pure, but
there's no reference to clang docs. Do they exist?

> I think it would be an interesting study to see how often functions
> that have return codes are ok to not check vs aren't ok (in a large
> production codebase like the Linux kernel), similar to how 97% of
> cases fallthrough is unintentional (which to me sounds like maybe the
> default behavior of the language is incorrect).

Again, _please_ do not confuse the name __must_check with what it
actually does and means. It only means you get a warning if you throw
away the result completely, it does not mean the return value must
soonish be subject to some if-condition (because how'd you define or
implement that...).

To reiterate:

(1) for __pure functions, it makes no sense to add __must_check, because
gcc already warns
(2) all the standard-C string functions are already __pure, even if
linux/string.h does not declare them that way - so one shouldn't expect
any new warnings at least for those functions
(3) for the non-standard string functions (memchr_inv), I'd rather mark
them __pure than __must_check, since the former is effectively a
superset of the latter. We can then bikeshed whether the standard ones
should be marked __pure as well for consistency (and perhaps benefit of
clang, in case clang does not know __builtin_strlen is pure).
(4) The kmalloc() wrappers (kstrdup etc.) are a whole different story.
We're not marking kmalloc() itself, only krealloc(), so I don't see why
kstrdup() should be __must_check. Yes, it would catch a silly
instant-leak like

  kstrdup(foo);

but I really don't think that ever happens in practice. And again,
there's no point making kstrdup() __must_check unless we also decide
that it's worth it for kmalloc() and friends.

Rasmus
