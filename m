From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Wed, 09 Oct 2019 13:26:18 +0000
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
Message-Id: <954c5d70-742f-7b0e-57ad-ea967e93be89@rasmusvillemoes.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
In-Reply-To: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>

On 09/10/2019 14.14, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 9 Oct 2019 13:53:59 +0200
> 
> Several functions return values with which useful data processing
> should be performed. These values must not be ignored then.
> Thus use the annotation “__must_check” in the shown function declarations.

This _might_ make sense for those that are basically kmalloc() wrappers
in one way or another [1]. But what's the point of annotating pure
functions such as strchr, strstr, memchr etc? Nobody is calling those
for their side effects (they don't have any...), so obviously the return
value is used. If somebody does a strcmp() without using the result, so
what? OK, it's odd code that might be worth flagging, but I don't think
that's the kind of thing one accidentally adds. You're also not
consistent - strlen() is not annotated. And, for the standard C
functions, -Wall already seems to warn about an unused call:

 #include <string.h>
int f(const char *s)
{
	strlen(s);
	return 3;
}
$ gcc -Wall -o a.o -c a.c
a.c: In function ‘f’:
a.c:5:2: warning: statement with no effect [-Wunused-value]
  strlen(s);
  ^~~~~~~~~

[1] Just might. The problem is the __must_check does not mean that the
return value must be followed by a comparison to NULL and bailing out
(that can't really be checked), it simply ensures the return value is
assigned somewhere or used in an if(). So foo->bar = kstrdup() not
followed by a check of foo->bar won't warn. So one would essentially
only catch instant-leaks. __must_check is much better suited for
functions that mutate a passed-in or global object, e.g.
start_engine(engine).

Rasmus
