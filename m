From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 10 Oct 2019 07:25:42 +0000
Subject: Re: string.h: Mark 34 functions with __must_check
Message-Id: <359bd081-44fb-e9a7-8ba9-bafeeecebc25@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
 <20191009110943.7ff3a08a@gandalf.local.home>
 <ce96b27e-5f7b-fca7-26ae-13729e886d46@web.de>
 <CAHp75VdrUg6nBfYV-ZoiwWhu6caaQB8-FCSeQFH0GrBX33WhVg@mail.gmail.com>
In-Reply-To: <CAHp75VdrUg6nBfYV-ZoiwWhu6caaQB8-FCSeQFH0GrBX33WhVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andy.shevchenko@gmail.com>, kernel-janitors@vger.kernel.org, kasan-dev@googlegroups.com
Cc: Steven Rostedt <rostedt@goodmis.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, LKML <linux-kernel@vger.kernel.org>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>

>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/test_kasan.c?id=b92a953cb7f727c42a15ac2ea59bf3cf9c39370d#n595
>
> The *test* word must have given you a clue that the code you a looking
> at is not an ordinary one.

The proposed extension of function annotations can be tested also together
with this source file example, can't it?
Other system configuration variations might become more interesting
for further software components.

Regards,
Markus
