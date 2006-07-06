From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Thu, 06 Jul 2006 15:40:34 +0000
Subject: Re: [KJ] [PATCH] drivers/atm/nicstar.c: add KERN_* to printk
Message-Id: <20060706084034.7abb4cac.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44ABCCD6.6060101@chello.nl>
In-Reply-To: <44ABCCD6.6060101@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 06 Jul 2006 17:10:10 +0200 Richard wrote:

> Add KERN_* to printk statements
> ---
> 
> nicstar.c |  126 +++++++++++++++++++++++++++++++-------------------------------
> 1 file changed, 63 insertions(+), 63 deletions(-)

Use 'diffstat -p1 -w70' for diffstat listing so that we can see
path name also.

> Against: rsync.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

Looks like the diff is reversed...

Reversed (or previously applied) patch detected!  Assume -R? [n] y
patch: **** malformed patch at line 29: structure.\n", i);

You are using Thunderbird.  You probably need to disable
line wrapping (set it to 0).
There are still a lot of these bad line splits.

Also see (for using tbird for emailing patches):
http://mbligh.org/linuxdocs/Email/Clients/Thunderbird
http://lkml.org/lkml/2005/12/27/191


> --- mytree/drivers/atm/nicstar.c	2006-07-05 16:17:07.342546512 +0200
> +++ current/linux-2.6/drivers/atm/nicstar.c	2006-07-06 16:58:04.634481000 +0200


---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
