From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Wed, 09 Oct 2019 14:21:20 +0000
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
Message-Id: <b1f055ec-b4ec-d0ed-a03d-7d9828fa9440@rasmusvillemoes.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
 <954c5d70-742f-7b0e-57ad-ea967e93be89@rasmusvillemoes.dk>
 <20191009135522.GA20194@kadam>
In-Reply-To: <20191009135522.GA20194@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>

On 09/10/2019 15.56, Dan Carpenter wrote:
> [ I haven't reviewed the original patch ]
> 
> On Wed, Oct 09, 2019 at 03:26:18PM +0200, Rasmus Villemoes wrote:
>> On 09/10/2019 14.14, Markus Elfring wrote:
>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>> Date: Wed, 9 Oct 2019 13:53:59 +0200
>>>
>>> Several functions return values with which useful data processing
>>> should be performed. These values must not be ignored then.
>>> Thus use the annotation “__must_check” in the shown function declarations.
>>
>> This _might_ make sense for those that are basically kmalloc() wrappers
>> in one way or another [1]. But what's the point of annotating pure
>> functions such as strchr, strstr, memchr etc? Nobody is calling those
>> for their side effects (they don't have any...), so obviously the return
>> value is used. If somebody does a strcmp() without using the result, so
>> what? OK, it's odd code that might be worth flagging, but I don't think
>> that's the kind of thing one accidentally adds.
> 
> 
> 	if (ret) {
> 		-EINVAL;
> 	}
> 
> People do occasionally make mistakes like this.  It can't hurt to
> warn them as early as possible about nonsense code.

In that case, ret (which I guess comes from one of these functions) is
indeed used. And gcc should already complain about that "statement with
no effect" for the -EINVAL; line. So I don't see how adding these
annotations would change anything.

>> And, for the
>> standard C functions, -Wall already seems to warn about an unused
>> call:
>>
>>  #include <string.h>
>> int f(const char *s)
>> {
>> 	strlen(s);
>> 	return 3;
>> }
>> $ gcc -Wall -o a.o -c a.c
>> a.c: In function ‘f’:
>> a.c:5:2: warning: statement with no effect [-Wunused-value]
>>   strlen(s);
>>   ^~~~~~~~~
> 
> That's because glibc strlen is annotated with __attribute_pure__ which
> means it has no side effects.

I know, except it has nothing to do with glibc headers. Just try the
same thing in the kernel. gcc itself knows this about __builtin_strlen()
etc. If anything, we could annotate some of our non-standard functions
(say, memchr_inv) with __pure - then we'd both get the Wunused-value in
the nonsense cases, and allow gcc to optimize or reorder the calls.

Rasmus
