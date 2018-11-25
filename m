From: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
Date: Sun, 25 Nov 2018 17:06:40 +0000
Subject: Re: [PATCH][V2] net: bridge: remove redundant checks for null p->dev and p->br
Message-Id: <074d65f8-d6e8-078e-9365-a2d8f74b0c5e@cumulusnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181125160851.6919-1-colin.king@canonical.com>
In-Reply-To: <20181125160851.6919-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Roopa Prabhu <roopa@cumulusnetworks.com>, "David S . Miller" <davem@davemloft.net>, bridge@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 25/11/2018 18:08, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A recent change added a null check on p->dev after p->dev was being
> dereferenced by the ns_capable check on p->dev. It turns out that
> neither the p->dev and p->br null checks are necessary, and can be
> removed, which cleans up a static analyis warning.
> 
> As Nikolay Aleksandrov noted, these checks can be removed because:
> 
> "My reasoning of why it shouldn't be possible:
> - On port add new_nbp() sets both p->dev and p->br before creating
>   kobj/sysfs
> 
> - On port del (trickier) del_nbp() calls kobject_del() before call_rcu()
>   to destroy the port which in turn calls sysfs_remove_dir() which uses
>   kernfs_remove() which deactivates (shouldn't be able to open new
>   files) and calls kernfs_drain() to drain current open/mmaped files in
>   the respective dir before continuing, thus making it impossible to
>   open a bridge port sysfs file with p->dev and p->br equal to NULL.
> 
> So I think it's safe to remove those checks altogether. It'd be nice to
> get a second look over my reasoning as I might be missing something in
> sysfs/kernfs call path."
> 
> Thanks to Nikolay Aleksandrov's suggestion to remove the check and
> David Miller for sanity checking this.
> 
> Detected by CoverityScan, CID#751490 ("Dereference before null check")
> 
> Fixes: a5f3ea54f3cc ("net: bridge: add support for raw sysfs port options")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> ---
> 
> V2: remove checks instead of moving them before the dereference of
> p->dev.
> ---
>  net/bridge/br_sysfs_if.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/net/bridge/br_sysfs_if.c b/net/bridge/br_sysfs_if.c
> index 7c87a2fe5248..88715edb119a 100644
> --- a/net/bridge/br_sysfs_if.c
> +++ b/net/bridge/br_sysfs_if.c
> @@ -320,9 +320,6 @@ static ssize_t brport_store(struct kobject *kobj,
>  	if (!rtnl_trylock())
>  		return restart_syscall();
>  
> -	if (!p->dev || !p->br)
> -		goto out_unlock;
> -
>  	if (brport_attr->store_raw) {
>  		char *buf_copy;
>  
> 

Thanks,
Acked-by: Nikolay Aleksandrov <nikolay@cumulusnetworks.com>
