From: Dave Kleikamp <shaggy@austin.ibm.com>
Date: Thu, 20 Jan 2005 20:34:49 +0000
Subject: [KJ] Re: [PATCH 6/40] fs/jfs_logmgr: replace schedule_timeout() with
Message-Id: <1106253289.7970.3.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3581692298698127=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============3581692298698127==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2005-01-20 at 11:02 -0800, Nishanth Aravamudan wrote:
> Hi,
> 
> Please consider applying.

I will.  It looks good.

> Description: Use msleep() instead of schedule_timeout() to guarantee the task
> delays as expected. The current code uses TASK_INTERRUPTIBLE; however, it does
> not check for signals, so I do not think the change to msleep() is necessarily
> bad.

Right, TASK_INTERRUPTIBLE doesn't make sense here, so msleep is a better
fit.

Thanks,
Shaggy

> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.11-rc1-kj-v/fs/jfs/jfs_logmgr.c	2005-01-15 16:55:41.000000000 -0800
> +++ 2.6.11-rc1-kj/fs/jfs/jfs_logmgr.c	2005-01-18 10:53:46.000000000 -0800
> @@ -67,6 +67,7 @@
>  #include <linux/buffer_head.h>		/* for sync_blockdev() */
>  #include <linux/bio.h>
>  #include <linux/suspend.h>
> +#include <linux/delay.h>
>  #include "jfs_incore.h"
>  #include "jfs_filsys.h"
>  #include "jfs_metapage.h"
> @@ -1612,8 +1613,7 @@ void jfs_flush_journal(struct jfs_log *l
>  	 */
>  	if ((!list_empty(&log->cqueue)) || !list_empty(&log->synclist)) {
>  		for (i = 0; i < 800; i++) {	/* Too much? */
> -			current->state = TASK_INTERRUPTIBLE;
> -			schedule_timeout(HZ / 4);
> +			msleep(250);
>  			if (list_empty(&log->cqueue) &&
>  			    list_empty(&log->synclist))
>  				break;
-- 
David Kleikamp
IBM Linux Technology Center


--===============3581692298698127==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3581692298698127==--
