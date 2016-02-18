From: Anand Jain <anand.jain@oracle.com>
Date: Thu, 18 Feb 2016 07:14:04 +0000
Subject: Re: [patch] btrfs: array overflow in btrfs_ioctl_rm_dev_v2()
Message-Id: <56C56F3C.3030408@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160218050109.GA7781@mwanda>
In-Reply-To: <20160218050109.GA7781@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Chris Mason <clm@fb.com>
Cc: Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org



Thanks Dan.
  Chris pointed out as well. We are working on it..
  Just one concern when device is added the max device length is
  BTRFS_PATH_NAME_MAX. However below fix is proper from the vol_args
  perspective.

Thanks,  Anand


On 02/18/2016 01:01 PM, Dan Carpenter wrote:
> We were putting the NUL terminator at BTRFS_PATH_NAME_MAX (4087) bytes
> instead of BTRFS_SUBVOL_NAME_MAX (4039) so it corrupted memory.
>
> Fixes: 22af1a869288 ('btrfs: introduce device delete by devid')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> index 5224fc8..77c61b4 100644
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@ -2700,7 +2700,7 @@ static long btrfs_ioctl_rm_dev_v2(struct file *file, void __user *arg)
>   	if (vol_args->flags & BTRFS_DEVICE_SPEC_BY_ID) {
>   		ret = btrfs_rm_device(root, NULL, vol_args->devid);
>   	} else {
> -		vol_args->name[BTRFS_PATH_NAME_MAX] = '\0';
> +		vol_args->name[BTRFS_SUBVOL_NAME_MAX] = '\0';
>   		ret = btrfs_rm_device(root, vol_args->name, 0);
>   	}
>   	mutex_unlock(&root->fs_info->volume_mutex);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-btrfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
