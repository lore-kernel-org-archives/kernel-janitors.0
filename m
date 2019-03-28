From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 28 Mar 2019 22:08:51 +0000
Subject: Re: [RESEND PATCH v2 4/5] lib/list_sort: Simplify and remove MAX_LIST_LENGTH_BITS
Message-Id: <20190328150851.5d261d1a72e2ca86a1c141c0@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1552704200.git.lkml@sdf.org>
        <f63c410e0ff76009c9b58e01027e751ff7fdb749.1552704200.git.lkml@sdf.org>
In-Reply-To: <f63c410e0ff76009c9b58e01027e751ff7fdb749.1552704200.git.lkml@sdf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: George Spelvin <lkml@sdf.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrey Abramov <st5pub@yandex.ru>, Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Wagner <daniel.wagner@siemens.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, Don Mullis <don.mullis@gmail.com>, Dave Chinner <dchinner@redhat.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Tue, 19 Mar 2019 08:16:00 +0000 George Spelvin <lkml@sdf.org> wrote:

> Rather than a fixed-size array of pending sorted runs, use the ->prev
> links to keep track of things.  This reduces stack usage, eliminates
> some ugly overflow handling, and reduces the code size.
> 
> Also:
> * merge() no longer needs to handle NULL inputs, so simplify.
> * The same applies to merge_and_restore_back_links(), which is renamed
>   to the less ponderous merge_final().  (It's a static helper function,
>   so we don't need a super-descriptive name; comments will do.)
> * Document the actual return value requirements on the (*cmp)()
>   function; some callers are already using this feature.
> 
> x86-64 code size 1086 -> 739 bytes (-347)
> 
> (Yes, I see checkpatch complaining about no space after comma in
> "__attribute__((nonnull(2,3,4,5)))".  Checkpatch is wrong.)

x86_64 allnoconfig with gcc-7.3.0:

lib/list_sort.c:17:36: warning: __pure__ attribute ignored [-Wattributes]
   struct list_head const *, struct list_head const *);
