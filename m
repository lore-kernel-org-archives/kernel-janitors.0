From: Weston Andros Adamson <dros@netapp.com>
Date: Wed, 08 Jun 2011 14:30:00 +0000
Subject: Re: [patch] NFS: using freed variable in debug code
Message-Id: <4E3994E6-9DBF-439B-808E-F134EB5DD923@netapp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110608064300.GE3846@shale.localdomain>
In-Reply-To: <20110608064300.GE3846@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Trond Myklebust <Trond.Myklebust@netapp.com>, "open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>, kernel-janitors@vger.kernel.org

Oops, good catch!

Actually, we can leave the kfree() where it is.  Using ds->ds_remotestr in the dprintk is a typo - It should be tmp_ds->ds_remotestr.

-dros

On Jun 8, 2011, at 2:43 AM, Dan Carpenter wrote:

> "ds" gets dereferenced after a kfree in the debug output.  I just
> moved the free down a line.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/nfs/nfs4filelayoutdev.c b/fs/nfs/nfs4filelayoutdev.c
> index 77c171e..c63bbce 100644
> --- a/fs/nfs/nfs4filelayoutdev.c
> +++ b/fs/nfs/nfs4filelayoutdev.c
> @@ -362,11 +362,11 @@ nfs4_pnfs_ds_add(struct list_head *dsaddrs, gfp_t gfp_flags)
> 				__func__, tmp_ds->ds_remotestr, remotestr);
> 		}
> 		kfree(remotestr);
> -		kfree(ds);
> 		atomic_inc(&tmp_ds->ds_count);
> 		dprintk("%s data server %s found, inc'ed ds_count to %d\n",
> 			__func__, ds->ds_remotestr,
> 			atomic_read(&tmp_ds->ds_count));
> +		kfree(ds);
> 		ds = tmp_ds;
> 	}
> 	spin_unlock(&nfs4_ds_cache_lock);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

