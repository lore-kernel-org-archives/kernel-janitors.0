From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Date: Fri, 08 Jun 2007 12:26:23 +0000
Subject: [KJ] Re: [PATCH] [trivial] drivers/ide/legacy/hd.c: Array size
Message-Id: <200706081426.23525.bzolnier@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 05 June 2007, Andi Drebes wrote:
> This patch replaces an array size calculation in drivers/ide/legacy/hd.c
> that was done using sizeof with the ARRAY_SIZE macro.
> 
> Tested by compilation on an i386 box using "allyesconfig".
> Diffed against Linus' git-tree.
> 
> Signed-off-by: Andi Drebes <lists-receive@programmierforen.de>

applied
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
