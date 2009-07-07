From: Hannes Eder <hannes@hanneseder.net>
Date: Tue, 07 Jul 2009 23:54:14 +0000
Subject: Re: [PATCH] vlynq: remove duplicated #include
Message-Id: <154e089b0907071654o46145717h17ac558aa4d524e0@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907072336.14767.florian@openwrt.org>
In-Reply-To: <200907072336.14767.florian@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <florian@openwrt.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, Jul 7, 2009 at 23:36, Florian Fainelli<florian@openwrt.org> wrote:
> Remove duplicated #include('s) in drivers/vlynq/vlynq.c

The following little script catches more of these issues, though it
might be a bit fragile:

#!/bin/bash
find . -name "*.c" | \
while read file; do
    dblinc=$(grep "^#include <" $file | sort | uniq -c | grep -v "^      1 ")
    [ "$dblinc" != "" ] && echo $file: $dblinc
done

when ran from the linux-2.6 src tree, the output is something like
(lines starting with '#' are my annotations):

./mm/slab.c: 3 #include <linux/kmalloc_sizes.h>
# this is a false positive
./mm/slqb.c: 2 #include <linux/seq_file.h>
# I did not look a this one
./mm/shmem.c: 2 #include <linux/vfs.h>
# this is a hit
# the rest (about 50 hits) skipped

Do you want to investigate this issues?

Cheers,
Hannes
