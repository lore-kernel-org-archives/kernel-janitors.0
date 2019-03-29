From: George Spelvin <lkml@sdf.org>
Date: Fri, 29 Mar 2019 04:10:12 +0000
Subject: Re: [RESEND PATCH v2 4/5] lib/list_sort: Simplify and remove MAX_LIST_LENGTH_BITS
Message-Id: <201903290410.x2T4ACjG014546@sdf.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1552704200.git.lkml@sdf.org>,
    <f63c410e0ff76009c9b58e01027e751ff7fdb749.1552704200.git.lkml@sdf.org>,
    <20190328150851.5d261d1a72e2ca86a1c141c0@linux-foundation.org>
In-Reply-To: <20190328150851.5d261d1a72e2ca86a1c141c0@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: akpm@linux-foundation.org, lkml@sdf.org, lkp@intel.com, sfr@canb.auug.org.au
Cc: andriy.shevchenko@linux.intel.com, daniel.wagner@siemens.com, dchinner@redhat.com, don.mullis@gmail.com, geert@linux-m68k.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk, st5pub@yandex.ru

Than you all for the build warning report.

The warning produced by gcc versions 4.9, 7.3, 8.1, whatever version
Stephen Rothwell is running, is:
lib/list_sort.c:17:36: warning: __pure__ attribute ignored [-Wattributes]

The relevant code is:
10: /*
11:  * By declaring the compare function with the __pure attribute, we give
12:  * the compiler more opportunity to optimize.  Ideally, we'd use this in
13:  * the prototype of list_sort(), but that would involve a lot of churn
14:  * at all call sites, so just cast the function pointer passed in.
15:  */
16: typedef int __pure __attribute__((nonnull(2,3))) (*cmp_func)(void *,
17: 		struct list_head const *, struct list_head const *);

As the comment says, the purpose of the __pure attribute is to tell
the compiler that, after a call via a function pointer of this
type, memory is not clobbered and it is not necessary to reload
any cached list pointers.

This is, of course, purely optional and may be deleted harmlessly.
I just checked, and that makes no difference at all to gcc-8 code
generation, so there's no point messing with #ifdef.

There are only two questions: how to update the comment, and how
to submit the fix. I'm thinking of
/*
 * A more accurate type for comparison functions.  Ideally, we'd use
 * this in the prototype of list_sort(), but that would involve a lot of
 * churn at all call sites, so just cast the function pointer passed in.
 *
 * This could also include __pure to give the compiler more opportunity
 * to optimize, but that elicits an "attribute ignored" warning on
 * GCC <= 8.1, and doesn't change GCC 8.3's code generation at all,
 * so it's omitted.
 */

How to submit the fix: Andrew, do you prefer a replacement patch
or a small fix patch?  I'll assume the latter and send it in a few
minutes.
