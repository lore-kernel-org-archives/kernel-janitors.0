From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 09 Oct 2019 20:06:52 +0000
Subject: Re: string.h: Mark 34 functions with __must_check
Message-Id: <ce96b27e-5f7b-fca7-26ae-13729e886d46@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
 <20191009110943.7ff3a08a@gandalf.local.home>
In-Reply-To: <20191009110943.7ff3a08a@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Steven Rostedt <rostedt@goodmis.org>, kernel-janitors@vger.kernel.org, kasan-dev@googlegroups.com
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, LKML <linux-kernel@vger.kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>

> I'm curious. How many warnings showed up when you applied this patch?

I suggest to take another look at six places in a specific source file
(for example).
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib=
/test_kasan.c?id=B92a953cb7f727c42a15ac2ea59bf3cf9c39370d#n595
https://elixir.bootlin.com/linux/v5.4-rc2/source/lib/test_kasan.c#L595

Regards,
Markus
