From: David Sterba <dsterba@suse.cz>
Date: Thu, 18 Feb 2016 08:58:25 +0000
Subject: Re: [patch] btrfs: array overflow in btrfs_ioctl_rm_dev_v2()
Message-Id: <20160218085825.GU4374@suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160218050109.GA7781@mwanda>
 <56C56F3C.3030408@oracle.com>
In-Reply-To: <56C56F3C.3030408@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anand Jain <anand.jain@oracle.com>
Cc: Chris Mason <clm@fb.com>, Dan Carpenter <dan.carpenter@oracle.com>, Josef Bacik <jbacik@fb.com>, kernel-janitors@vger.kernel.org, linux-btrfs@vger.kernel.org

On Thu, Feb 18, 2016 at 03:14:04PM +0800, Anand Jain wrote:
> 
> 
> Thanks Dan.
>   Chris pointed out as well. We are working on it..

In for next since yesterday.

>   Just one concern when device is added the max device length is
>   BTRFS_PATH_NAME_MAX. However below fix is proper from the vol_args
>   perspective.

Yeah, there's mess in the various PATH constants, but they're all > 4000
and that should be enough for most uses.
