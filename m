From: Joe Perches <joe@perches.com>
Date: Thu, 09 Apr 2020 15:29:49 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <bcdfa5ae68b8cb7d9324a89aedf452f6209b570c.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
         <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
         <4b7e1cf3-6fa7-60af-a1d3-2457339dbe8a@wanadoo.fr>
         <efb5a518fdc47f0120b94a7e8a95d275c0f4ad43.camel@perches.com>
         <60c732a1-aa4e-afab-d223-894a67713003@wanadoo.fr>
In-Reply-To: <60c732a1-aa4e-afab-d223-894a67713003@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, apw@canonical.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2020-04-09 at 09:24 +0200, Christophe JAILLET wrote:
> I think that, at least printk(), WARN() and co, and panic() should also 
> be handled the same way.

Maybe.

> A few files (5 according to my grep) also have something like:
>     #define pr_fmt(fmt) "bcache: %s()" fmt "\n", __func__
> and then sometimes a mix of pr_xxx() with either trailing \n or not.

Didn't know about those.

> Maybe those should be handled manually to be consistent and avoid a "\n" 
> in pr_fmt which is not widely used in other files

More likely the pr_fmt should have the \n removed and added
to the uses.

$ git grep -P 'define\s+pr_fmt.*\\n'
drivers/clocksource/timer-davinci.c:#define pr_fmt(fmt) "%s: " fmt "\n", __func__
drivers/md/bcache/bcache.h:#define pr_fmt(fmt) "bcache: %s() " fmt "\n", __func__
drivers/md/bcache/bset.c:#define pr_fmt(fmt) "bcache: %s() " fmt "\n", __func__
lib/math/prime_numbers.c:#define pr_fmt(fmt) "prime numbers: " fmt "\n"
lib/percpu-refcount.c:#define pr_fmt(fmt) "%s: " fmt "\n", __func__
lib/test_hash.c:#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt "\n"
tools/usb/usbip/libsrc/usbip_common.h:#define pr_fmt(fmt)       "%s: %s: " fmt "\n", PROGNAME
