From: Satoru Takeuchi <takeuchi_satoru@jp.fujitsu.com>
Date: Mon, 23 Jun 2014 01:30:57 +0000
Subject: Re: [patch] Btrfs: fix error code in btrfs_init_test_fs()
Message-Id: <53A78351.4060804@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140620192010.GB19824@mwanda>
In-Reply-To: <20140620192010.GB19824@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Chris Mason <clm@fb.com>
Cc: Josef Bacik <jbacik@fb.com>, Sasha Levin <sasha.levin@oracle.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

(2014/06/21 4:20), Dan Carpenter wrote:
> We had intended to return a negative error code here, but we use the
> wrong variable so it returns success.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Satoru Takeuchi <takeuchi_satoru@jp.fujitsu.com>

>
> diff --git a/fs/btrfs/tests/btrfs-tests.c b/fs/btrfs/tests/btrfs-tests.c
> index 9626252..8e7225f 100644
> --- a/fs/btrfs/tests/btrfs-tests.c
> +++ b/fs/btrfs/tests/btrfs-tests.c
> @@ -65,7 +65,7 @@ int btrfs_init_test_fs(void)
>   	if (IS_ERR(test_mnt)) {
>   		printk(KERN_ERR "btrfs: cannot mount test file system\n");
>   		unregister_filesystem(&test_type);
> -		return ret;
> +		return PTR_ERR(test_mnt);
>   	}
>   	return 0;
>   }
> --
> To unsubscribe from this list: send the line "unsubscribe linux-btrfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

