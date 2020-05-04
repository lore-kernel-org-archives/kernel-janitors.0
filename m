From: Wang YanQing <udknight@gmail.com>
Date: Mon, 04 May 2020 10:22:42 +0000
Subject: Re: [PATCH v6] checkpatch: add support to check 'Fixes:' tag format
Message-Id: <20200504102242.GA13013@udknight>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200504082002.GA29972@udknight>
 <38251b1f-e89b-7b3a-6045-f5ce1dc2596a@web.de>
In-Reply-To: <38251b1f-e89b-7b3a-6045-f5ce1dc2596a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alexei Starovoitov <alexei.starovoitov@gmail.com>, Matteo Croce <mcroce@redhat.com>

On Mon, May 04, 2020 at 11:45:02AM +0200, Markus Elfring wrote:
> 
> >  4: Add support to check and emit sensible diagnostics
> >     info for description which spans across more than
> >     two lines.
> 
> My software concerns are growing also for the preferred dependency management.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id698dfa282211e414076f9dc7e83c1c288314fd#n138
>

Hi! Markus Elfring

This feature is a side effect of missing right '")' detection, so I think
it is acceptable to add it.

But I agree with you, this patch is a little big, I don't want to add more
code into it.

Joe, what is your opinion? Do you think this version is good enough to merge?

Thanks!
