From: Tejun Heo <tj@kernel.org>
Date: Wed, 19 Jul 2017 14:34:08 +0000
Subject: Re: [PATCH] libata: array underflow in ata_find_dev()
Message-Id: <20170719143407.GK3365493@devbig577.frc2.facebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170719100641.7ste3wo6ap2g2djv@mwanda>
In-Reply-To: <20170719100641.7ste3wo6ap2g2djv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

Hello,

On Wed, Jul 19, 2017 at 01:06:41PM +0300, Dan Carpenter wrote:
> My static checker complains that "devno" can be negative, meaning that
> we read before the start of the loop.  I've looked at the code, and I
> think the warning is right.  This come from /proc so it's root only or
> it would be quite a quite a serious bug.  The call tree looks like this:
> 
> proc_scsi_write() <- gets id and channel from simple_strtoul()
> -> scsi_add_single_device() <- calls shost->transportt->user_scan()
>    -> ata_scsi_user_scan()
>       -> ata_find_dev()
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I'm impressed that the static checker caught this.  Thanks a lot for
the fix, and lol at the code. :) Applied to libata/for-4.13-fixes w/
stable cc'd.

Thanks!

-- 
tejun
