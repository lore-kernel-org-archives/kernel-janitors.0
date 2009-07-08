From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 08 Jul 2009 12:28:43 +0000
Subject: Re: [PATCH] vlynq: remove duplicated #include
Message-Id: <154e089b0907080528h24b6ccc6qa07bb1fa4db89aa0@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907072336.14767.florian@openwrt.org>
	 <154e089b0907071654o46145717h17ac558aa4d524e0@mail.gmail.com>
	 <200907080840.44451.florian@openwrt.org>
	 <alpine.LFD.2.00.0907080750100.23552@localhost>
In-Reply-To: <alpine.LFD.2.00.0907080750100.23552@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Florian Fainelli <florian@openwrt.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Huang Weiyi <weiyi.huang@gmail.com>

On Wed, Jul 8, 2009 at 13:50, Robert P. J. Day<rpjday@crashcourse.ca> wrote:
> On Wed, 8 Jul 2009, Florian Fainelli wrote:
>
>> Hi Hannes,
>>
>> Le Wednesday 08 July 2009 01:54:14 Hannes Eder, vous avez écrit :
>> > On Tue, Jul 7, 2009 at 23:36, Florian Fainelli<florian@openwrt.org> wrote:
>> > > Remove duplicated #include('s) in drivers/vlynq/vlynq.c
>> >
>> > The following little script catches more of these issues, though it
>> > might be a bit fragile:
>> >
>> > #!/bin/bash
>> > find . -name "*.c" | \
>> > while read file; do
>> >     dblinc=$(grep "^#include <" $file | sort | uniq -c | grep -v "^      1
>> > ") [ "$dblinc" != "" ] && echo $file: $dblinc
>> > done
>> >
>> > when ran from the linux-2.6 src tree, the output is something like
>> > (lines starting with '#' are my annotations):
>> >
>> > ./mm/slab.c: 3 #include <linux/kmalloc_sizes.h>
>> > # this is a false positive
>> > ./mm/slqb.c: 2 #include <linux/seq_file.h>
>> > # I did not look a this one
>> > ./mm/shmem.c: 2 #include <linux/vfs.h>
>> > # this is a hit
>> > # the rest (about 50 hits) skipped
>> >
>> > Do you want to investigate this issues?
>>
>> I will not, at least not now, but Huang (CC'd) might be interested.
>
>  isn't "make includecheck" supposed to identify duplicated includes?
> why aren't you using that?

Hey man, do not stop me from invent the wheel again, and again, and
again, ... ;).  You are right "make includecheck" does the trick check
for duplicated includes, in it does so in a much nicer way.

Thanks,
-Hannes
