From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 09 Oct 2019 16:42:27 +0000
Subject: Re: string.h: Mark 34 functions with __must_check
Message-Id: <074dfd38-dc1d-3795-ab75-a17c24b36844@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
 <954c5d70-742f-7b0e-57ad-ea967e93be89@rasmusvillemoes.dk>
In-Reply-To: <954c5d70-742f-7b0e-57ad-ea967e93be89@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Steven Rostedt <rostedt@goodmis.org>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>
Cc: LKML <linux-kernel@vger.kernel.org>

> You're also not consistent - strlen() is not annotated.

Would you like to integrate any additional function annotations?


> And, for the standard C functions, -Wall already seems to warn about
> an unused call:

This detail is nice, isn't it?


> a.c:5:2: warning: statement with no effect [-Wunused-value]
>   strlen(s);

Are there any differences to consider for the Linux function variant?


> The problem is the __must_check does not mean that the
> return value must be followed by a comparison to NULL and bailing out
> (that can't really be checked), it simply ensures the return value is
> assigned somewhere or used in an if(). So foo->bar = kstrdup() not
> followed by a check of foo->bar won't warn. So one would essentially
> only catch instant-leaks.

How do you think about to improve the source code analysis support
any further?

Regards,
Markus
