From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 25 Mar 2011 15:04:38 +0000
Subject: Re: [Xen-devel] [patch 1/2] xen-gntdev: return -EFAULT on
Message-Id: <20110325150438.GG27651@dumpdata.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110319054434.GD2008@bicker>
In-Reply-To: <20110319054434.GD2008@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, kernel-janitors@vger.kernel.org, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org

On Sat, Mar 19, 2011 at 08:44:34AM +0300, Dan Carpenter wrote:
> copy_to_user() returns the amount of data remaining to be copied.  We
> want to return a negative error code here.  The upper layers just
> call WARN_ON() if we return non-zero so this doesn't change the
> behavior.  But returning -EFAULT is still cleaner.

Thank you. Will put it on rc1 train.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> index 017ce60..b0f9e8f 100644
> --- a/drivers/xen/gntdev.c
> +++ b/drivers/xen/gntdev.c
> @@ -273,7 +273,7 @@ static int __unmap_grant_pages(struct grant_map *map, int offset, int pages)
>  				map->vma->vm_start + map->notify.addr;
>  			err = copy_to_user(tmp, &err, 1);
>  			if (err)
> -				return err;
> +				return -EFAULT;
>  			map->notify.flags &= ~UNMAP_NOTIFY_CLEAR_BYTE;
>  		} else if (pgno >= offset && pgno < offset + pages) {
>  			uint8_t *tmp = kmap(map->pages[pgno]);
> 
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xensource.com
> http://lists.xensource.com/xen-devel
