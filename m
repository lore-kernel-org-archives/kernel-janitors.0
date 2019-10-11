From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 11 Oct 2019 05:15:53 +0000
Subject: Re: Searching for missing variable checks
Message-Id: <dd1adf86-1bc1-2ffe-1af8-3d7082c5a468@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
 <954c5d70-742f-7b0e-57ad-ea967e93be89@rasmusvillemoes.dk>
In-Reply-To: <954c5d70-742f-7b0e-57ad-ea967e93be89@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, Steven Rostedt <rostedt@goodmis.org>, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Coccinelle <cocci@systeme.lip6.fr>
Cc: LKML <linux-kernel@vger.kernel.org>

> The problem is the __must_check does not mean that the
> return value must be followed by a comparison to NULL and bailing out
> (that can't really be checked), it simply ensures the return value is
> assigned somewhere or used in an if(). So foo->bar = kstrdup() not
> followed by a check of foo->bar won't warn.

Higher level source code analysis tools like the semantic patch language
(Coccinelle software) can help to find such missing checks.
Would you like to point any additional development tools out
for this purpose?

Regards,
Markus
