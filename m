From: Chris Mason <clm@fb.com>
Date: Thu, 04 Sep 2014 12:48:30 +0000
Subject: Re: [patch] Btrfs: kfree()ing ERR_PTRs
Message-Id: <54085F9E.80206@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140904110915.GB21504@mwanda>
In-Reply-To: <20140904110915.GB21504@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Josef Bacik <jbacik@fb.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org



On 09/04/2014 07:09 AM, Dan Carpenter wrote:
> The "inherit" in btrfs_ioctl_snap_create_v2() and "vol_args" in
> btrfs_ioctl_rm_dev() are ERR_PTRs so we can't call kfree() on them.
> 
> These kind of bugs are "One Err Bugs" where there is just one error
> label that does everything.  I could set the "inherit = NULL" and keep
> the single out label but it ends up being more complicated that way.  It
> makes the code simpler to re-order the unwind so it's in the mirror
> order of the allocation and introduce some new error labels.

Thanks Dan, agreed on the unwinding.

-chris
