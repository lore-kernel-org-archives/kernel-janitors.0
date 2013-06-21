From: Wei Liu <wei.liu2@citrix.com>
Date: Fri, 21 Jun 2013 09:51:01 +0000
Subject: Re: [patch] xen-netback: double free on unload
Message-Id: <20130621095101.GA14648@zion.uk.xensource.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130621062008.GA10873@elgon.mountain>
In-Reply-To: <20130621062008.GA10873@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ian Campbell <ian.campbell@citrix.com>, xen-devel@lists.xensource.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, wei.liu2@citrix.com

On Fri, Jun 21, 2013 at 09:20:08AM +0300, Dan Carpenter wrote:
> There is a typo here, "i" vs "j", so we would crash on module_exit().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
> index a0b50ad..130bcb2 100644
> --- a/drivers/net/xen-netback/netback.c
> +++ b/drivers/net/xen-netback/netback.c
> @@ -1968,8 +1968,8 @@ static void __exit netback_fini(void)
>  		del_timer_sync(&netbk->net_timer);
>  		kthread_stop(netbk->task);
>  		for (j = 0; j < MAX_PENDING_REQS; j++) {
> -			if (netbk->mmap_pages[i])
> -				__free_page(netbk->mmap_pages[i]);
> +			if (netbk->mmap_pages[j])
> +				__free_page(netbk->mmap_pages[j]);

Nice catch, thanks.


Wei.
