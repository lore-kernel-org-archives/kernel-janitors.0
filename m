From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 11:17:33 +0000
Subject: Re: [glommer-memcg:kmemcg-slab 26/33] drivers/firmware/memmap.c:240:19: error: conflicting types for
Message-Id: <20121015111733.GA12946@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121015024230.GA16122@localhost>
In-Reply-To: <20121015024230.GA16122@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 15, 2012 at 12:39:39PM +0400, Glauber Costa wrote:
> On 10/15/2012 06:42 AM, Fengguang Wu wrote:
> > Hi Glauber,
> > 
> > FYI, kernel build failed on
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git kmemcg-slab
> > head:   f7dc2a43ce771e73443c82eb25d95f72f8161b45
> > commit: d17ddfd35a7329643b2fb442ade58e2974a2a05c [26/33] sl[au]b: Allocate objects from memcg cache
> > config: ia64-allmodconfig # make ARCH=ia64 allmodconfig
> > branch date: 3 hours ago
> > commit date: 4 hours ago
> > 
> 
> totally unrelated to my tree.

It's not your fault, but perhaps not totally unrelated ;-)

Your commit seems like the direct cause for:

        drivers/firmware/memmap.c:240:19: error: conflicting types for 'memmap_init'
        arch/ia64/include/asm/pgtable.h:565:17: note: previous declaration of 'memmap_init' was here

It adds

+#include <linux/memcontrol.h>
+#include <linux/mm.h>

to slub_def.h, this makes firmware/memmap.c eventually include
arch/ia64/include/asm/pgtable.h to create the type conflict.

The suggested fix, however, is to rename firmware/memmap.c's local
memmap_init() to a more specific name.

Thanks,
Fengguang

> Bad commit is :
> 
> commit 69ac9cd629ca96e59f34eb4ccd12d00b2c8276a7
> Author: Bernhard Walle <bwalle@suse.de>
> Date:   Fri Jun 27 13:12:54 2008 +0200
> 
>     sysfs: add /sys/firmware/memmap
