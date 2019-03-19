From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Tue, 19 Mar 2019 10:56:39 +0000
Subject: Re: [RESEND PATCH v2 0/5] lib/sort & lib/list_sort: faster and smaller
Message-Id: <fb5ef3c2-2346-bbe8-351c-67f6b8735f19@rasmusvillemoes.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1552704199.git.lkml@sdf.org>
 <cover.1552704200.git.lkml@sdf.org>
In-Reply-To: <cover.1552704200.git.lkml@sdf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Spelvin <lkml@sdf.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: Andrey Abramov <st5pub@yandex.ru>, Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Wagner <daniel.wagner@siemens.com>, Don Mullis <don.mullis@gmail.com>, Dave Chinner <dchinner@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On 19/03/2019 09.15, George Spelvin wrote:
> 
> Because CONFIG_RETPOLINE has made indirect calls much more expensive,
> I thought I'd try to reduce the number made by the library sort
> functions.

For the series,

Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>

and let's have more commits with such detailed changelogs and references
to academic work combined with "but in the real world we have to do this
and that tradeoff..." :)
