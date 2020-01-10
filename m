From: Anand Jain <anand.jain@oracle.com>
Date: Fri, 10 Jan 2020 09:13:35 +0000
Subject: Re: [PATCH] btrfs: Fix error code in btrfs_sysfs_add_mounted()
Message-Id: <b5d47473-8dc1-6780-a774-95fa9a5bf8ee@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110055126.4rhhfsotll6puma7@kili.mountain>
In-Reply-To: <20200110055126.4rhhfsotll6puma7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Chris Mason <clm@fb.com>, Dennis Zhou <dennis@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org



On 10/1/20 1:51 PM, Dan Carpenter wrote:
> The error code wasn't set on this error path.
 >
> Fixes: e12ebce8a4a8 ("btrfs: sysfs: make UUID/debug have its own kobject")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   fs/btrfs/sysfs.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/btrfs/sysfs.c b/fs/btrfs/sysfs.c
> index 58486229be95..55e4ed1af29c 100644
> --- a/fs/btrfs/sysfs.c
> +++ b/fs/btrfs/sysfs.c
> @@ -1288,8 +1288,10 @@ int btrfs_sysfs_add_mounted(struct btrfs_fs_info *fs_info)
>   
>   #ifdef CONFIG_BTRFS_DEBUG
>   	fs_info->debug_kobj = kobject_create_and_add("debug", fsid_kobj);
> -	if (!fs_info->debug_kobj)
> +	if (!fs_info->debug_kobj) {
> +		error = -ENOMEM;


  uh-oh right.

Reviewed-by: Anand Jain <anand.jain@oracle.com>

Thanks, Anand

>   		goto failure;
> +	}
>   
>   	error = sysfs_create_files(fs_info->debug_kobj, btrfs_debug_mount_attrs);
>   	if (error)
> 
