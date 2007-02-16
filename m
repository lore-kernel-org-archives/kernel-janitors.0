From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 16 Feb 2007 09:20:31 +0000
Subject: Re: [KJ] [PATCH 1/5] moving to is_power_of_2
Message-Id: <Pine.LNX.4.64.0702160418190.21117@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1171605222.27506.74.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 16 Feb 2007, Vignesh Babu BM wrote:

> Removing instances of (n&(n-1)) for power of 2
> check with is_power_of_2 from linux/log.h.
>
>
>
> Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
> ---
>  arch/ia64/mm/hugetlbpage.c     |    4 +++-
>  drivers/block/rd.c             |    3 ++-
>  drivers/md/dm-snap.c           |    4 +++-
>  drivers/net/cxgb3/cxgb3_main.c |    7 +++++--
>  drivers/net/pcmcia/pcnet_cs.c  |    4 +++-
>  drivers/rtc/rtc-s3c.c          |    4 +++-
>  drivers/s390/block/dasd_int.h  |    4 +++-
>  drivers/s390/cio/cio.c         |    3 ++-
>  drivers/s390/cio/device_fsm.c  |    3 ++-
>  drivers/video/vesafb.c         |    4 +++-
>  fs/block_dev.c                 |    4 +++-
>  fs/ext2/super.c                |    4 +++-
>  fs/ext3/super.c                |    4 +++-
>  fs/ext4/super.c                |    7 +++++--
>  fs/fat/inode.c                 |   11 +++++++----
>  fs/hfs/btree.c                 |    3 ++-
>  fs/hfsplus/btree.c             |    4 +++-
>  fs/nfs/internal.h              |    5 +++--
>  fs/ntfs/inode.c                |    4 +++-
>  fs/ntfs/logfile.c              |    4 +++-
>  fs/ufs/super.c                 |    7 +++++--
>  kernel/kfifo.c                 |    4 +++-
>  net/core/neighbour.c           |    4 +++-
>  sound/core/rtctimer.c          |    4 +++-
>  24 files changed, 78 insertions(+), 31 deletions(-)

you're better off submitting these patches a subsystem at a time, and
CCing the subsystem maintainer on each patch, rather than trying to do
all this at once.

> diff --git a/arch/ia64/mm/hugetlbpage.c b/arch/ia64/mm/hugetlbpage.c
> index 0c7e94e..4fc6887 100644
> --- a/arch/ia64/mm/hugetlbpage.c
> +++ b/arch/ia64/mm/hugetlbpage.c
> @@ -16,6 +16,7 @@
>  #include <linux/smp_lock.h>
>  #include <linux/slab.h>
>  #include <linux/sysctl.h>
> +#include <linux/log2.h>
>  #include <asm/mman.h>
>  #include <asm/pgalloc.h>
>  #include <asm/tlb.h>
> @@ -175,7 +176,8 @@ static int __init hugetlb_setup_sz(char *str)
>  		tr_pages = 0x15557000UL;
>
>  	size = memparse(str, &str);
> -	if (*str || (size & (size-1)) || !(tr_pages & size) ||
> +	//if (*str || (size & (size-1)) || !(tr_pages & size) ||
> +	if (*str || !is_power_of_2(size) || !(tr_pages & size) ||

why are you retaining the original line in the source file, and just
commenting it out?

rday

-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
