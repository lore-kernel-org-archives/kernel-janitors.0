From: Steven Rostedt <rostedt@goodmis.org>
Date: Wed, 09 Oct 2019 15:09:43 +0000
Subject: Re: [PATCH] string.h: Mark 34 functions with __must_check
Message-Id: <20191009110943.7ff3a08a@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
In-Reply-To: <75f70e5e-9ece-d6d1-a2c5-2f3ad79b9ccb@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Nick Desaulniers <ndesaulniers@google.com>, LKML <linux-kernel@vger.kernel.org>

On Wed, 9 Oct 2019 14:14:28 +0200
Markus Elfring <Markus.Elfring@web.de> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 9 Oct 2019 13:53:59 +0200
> 
> Several functions return values with which useful data processing
> should be performed. These values must not be ignored then.
> Thus use the annotation “__must_check” in the shown function declarations.
> 
> Add also corresponding parameter names for adjusted functions.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>

I'm curious. How many warnings showed up when you applied this patch?

-- Steve
