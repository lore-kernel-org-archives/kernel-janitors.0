From: David Chinner <dgc@sgi.com>
Date: Wed, 20 Jun 2007 05:26:20 +0000
Subject: [KJ] Re: [xfs-masters] [PATCH]is_power_of_2-xfs/xfs_inode.c
Message-Id: <20070620052620.GY86004887@sgi.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jun 14, 2007 at 01:39:42PM +0530, vignesh babu wrote:
> 
> Replacing (n & (n-1)) in the context of power of 2 checks
> with is_power_of_2

Checked in to the XFS dev tree so this will go to Linus when the
next merge window opens. Thanks.

Cheers,

Dave.
-- 
Dave Chinner
Principal Engineer
SGI Australian Software Group
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
