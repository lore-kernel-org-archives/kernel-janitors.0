From: Florian Fainelli <florian@openwrt.org>
Date: Wed, 08 Jul 2009 06:40:43 +0000
Subject: Re: [PATCH] vlynq: remove duplicated #include
Message-Id: <200907080840.44451.florian@openwrt.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907072336.14767.florian@openwrt.org> <154e089b0907071654o46145717h17ac558aa4d524e0@mail.gmail.com>
In-Reply-To: <154e089b0907071654o46145717h17ac558aa4d524e0@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Huang Weiyi <weiyi.huang@gmail.com>

Hi Hannes,

Le Wednesday 08 July 2009 01:54:14 Hannes Eder, vous avez écrit :
> On Tue, Jul 7, 2009 at 23:36, Florian Fainelli<florian@openwrt.org> wrote:
> > Remove duplicated #include('s) in drivers/vlynq/vlynq.c
>
> The following little script catches more of these issues, though it
> might be a bit fragile:
>
> #!/bin/bash
> find . -name "*.c" | \
> while read file; do
>     dblinc=$(grep "^#include <" $file | sort | uniq -c | grep -v "^      1
> ") [ "$dblinc" != "" ] && echo $file: $dblinc
> done
>
> when ran from the linux-2.6 src tree, the output is something like
> (lines starting with '#' are my annotations):
>
> ./mm/slab.c: 3 #include <linux/kmalloc_sizes.h>
> # this is a false positive
> ./mm/slqb.c: 2 #include <linux/seq_file.h>
> # I did not look a this one
> ./mm/shmem.c: 2 #include <linux/vfs.h>
> # this is a hit
> # the rest (about 50 hits) skipped
>
> Do you want to investigate this issues?

I will not, at least not now, but Huang (CC'd) might be interested.
-- 
Best regards, Florian Fainelli
Email : florian@openwrt.org
http://openwrt.org
-------------------------------
