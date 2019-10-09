From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 09 Oct 2019 18:06:15 +0000
Subject: Re: string.h: Mark 34 functions with __must_check
Message-Id: <e1859e39-22de-5693-cd75-bb67dcfe1212@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
 <20191009110943.7ff3a08a@gandalf.local.home>
 <CAKwvOdk3OTaAVmbV9Cu+Dzg8zuojjU6ENZfu4cUPaKS2a58d3w@mail.gmail.com>
 <20191009122735.17415f9c@gandalf.local.home>
 <CAKwvOdkvgeHnQ_SyR7QUqpsmtMPRe1SCJ_XJLQYv-gvLB6rbLg@mail.gmail.com>
 <b8bdfb25-deb8-9da0-3572-408b19bb0507@web.de>
 <CAKwvOd=Jo5UkQN9A9rTJf0WtsxXNjaJ=jxf2gwHFdW8om-fbTQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=Jo5UkQN9A9rTJf0WtsxXNjaJ=jxf2gwHFdW8om-fbTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Desaulniers <ndesaulniers@google.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Coccinelle <cocci@systeme.lip6.fr>

> I reviewed the functions here and believe the ones you added checks
> for all look good.

Thanks for your positive feedback.


> Though Joe's comment on the relative order of where the
> annotation appears in the function declarations should be addressed in
> a V2 IMO.

Would you be looking for a subsequent change also by the means of
the semantic patch language with which the (function) attributes
can be adjusted to the ordering that you would prefer finally?

Regards,
Markus
