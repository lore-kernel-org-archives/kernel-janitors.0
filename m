From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 27 Jul 2012 14:27:32 +0000
Subject: Re: [next:akpm 147/308] net/sunrpc/clnt.c:720:36: sparse: dereference of noderef expression
Message-Id: <20120727142732.GA30773@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120727130225.GA29912@localhost>
In-Reply-To: <20120727130225.GA29912@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 27, 2012 at 03:10:36PM +0100, Mel Gorman wrote:
> On Fri, Jul 27, 2012 at 09:02:25PM +0800, Fengguang Wu wrote:
> > Hi Mel,
> > 
> > There are new sparse warnings show up in
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git akpm
> > head:   247109fa112ac912f31efc28e130ed2a0cc1764c
> > commit: 5bb176c86a868289d5d93d89919c3b5a339d6d20 [147/308] nfs: enable swap on NFS
> > 
> 
> Thanks (adding Andrew to cc for picking up in mm)
> 
> How about the following?

Looks good to me. And it does fix the warning.

I assume the fix will be folded into the original patch, otherwise the
subject will look a bit strange ;)

Thanks,
Fengguang

> ---8<---
> 
> sparsefix: nfs: enable swap on NFS
>
> Fengguang Wu reports the following sparse problem
> 
> 	net/sunrpc/clnt.c:720:36: sparse: dereference of noderef expression
> 
> task->tk_client->cl_xprt is RCU protected and must be dereferenced using
> rcu_dereference(). This patch checks if a socket is being used for swap
> and if so it takes the RCU read lock and dereferences properly. This is
> a fix for "nfs: enable swap on NFS"
> 
> Signed-off-by: Mel Gorman <mgorman@suse.de>
> ---
>  net/sunrpc/clnt.c |   11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/net/sunrpc/clnt.c b/net/sunrpc/clnt.c
> index 2848e5b..df27890 100644
> --- a/net/sunrpc/clnt.c
> +++ b/net/sunrpc/clnt.c
> @@ -717,8 +717,15 @@ void rpc_task_set_client(struct rpc_task *task, struct rpc_clnt *clnt)
>  		atomic_inc(&clnt->cl_count);
>  		if (clnt->cl_softrtry)
>  			task->tk_flags |= RPC_TASK_SOFT;
> -		if (task->tk_client->cl_xprt->swapper)
> -			task->tk_flags |= RPC_TASK_SWAPPER;
> +		if (sk_memalloc_socks()) {
> +			struct rpc_xprt *xprt;
> +
> +			rcu_read_lock();
> +			xprt = rcu_dereference(clnt->cl_xprt);
> +			if (xprt->swapper)
> +				task->tk_flags |= RPC_TASK_SWAPPER;
> +			rcu_read_unlock();
> +		}
>  		/* Add to the client's list of all tasks */
>  		spin_lock(&clnt->cl_lock);
>  		list_add_tail(&task->tk_task, &clnt->cl_tasks);
