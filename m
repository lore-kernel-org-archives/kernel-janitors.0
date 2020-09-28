From: Joe Perches <joe@perches.com>
Date: Mon, 28 Sep 2020 17:57:22 +0000
Subject: Re: [PATCH 03/18] [ARM] pata_icside: use semicolons rather than commas to separate statements
Message-Id: <25aa56e1f7943f9ac535fa184465a752aa00a4b4.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
         <1601233948-11629-4-git-send-email-Julia.Lawall@inria.fr>
         <8cf2fad1659acd756703deb106d55483bd1e1eb9.camel@perches.com>
         <alpine.DEB.2.22.394.2009281909000.2650@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2009281909000.2650@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2020-09-28 at 19:11 +0200, Julia Lawall wrote:
> 
> On Mon, 28 Sep 2020, Joe Perches wrote:
> 
> > On Sun, 2020-09-27 at 21:12 +0200, Julia Lawall wrote:
> > > Replace commas with semicolons.  What is done is essentially described by
> > > the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
> > 
> > Hi Julia.
> > 
> > How did you decide on this patch subject header line?
> > 
> > It's certainly reasonable, but not what I would expect
> > from any automation.
> 
> Most of the patches on this file touch other files as well.  There are
> four that only touch this file.  One has no subsystem.  One has dma as the
> subsystem.  Two have pata_icside, so that was chosen.

So did you select the patch subject without any automation
or did you create a tool that looks only at commits for
individual files?

> > $ git log --no-merges --format='%s' drivers/ata/pata_icside.c | \
> >   cut -f1 -d":" | sort | uniq -c | sort -rn
> >      10 libata
> >       5 libata-sff
> >       2 [ARM] pata_icside
> >       2 [ARM] ecard
> >       2 [ARM] dma

Yeah...

Something like the script below and some examples of its use?

$ cat find_best_header.sh
#!/bin/bash

# Show possible patch subject prefixes for a file in git

# use commits that modify only the single file argument and
# emit up to the 5 most common commit prefixes

git log --no-merges --format='%h' -- $1 |
    while read commit ; do
	if [[ $(git log --format='%h' --name-only -1 $commit | wc -l) = 3 ]] ; then
	    git log --format='%s' -1 $commit
	fi
    done |
    cut -f1 -d":" | cut -f1-3 -d" " | sort | uniq -c | sort -rn | head -5

$ ./find_best_header.sh drivers/ata/pata_icside.c
      2 [ARM] pata_icside
      1 Fix pata_icside build
      1 [ARM] dma

$ ./find_best_header.sh kernel/fork.c
     36 fork
     14 kernel/fork.c
      6 mm
      4 pidns
      4 [PATCH] unshare system

$ ./find_best_header.sh kernel/sched/core.c
    150 sched
    110 sched/core
     12 sched/uclamp
     12 sched/debug
     10 sched/deadline

$ ./find_best_header.sh drivers/iio/pressure/mpl115.c
      3 iio
