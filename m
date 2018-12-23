From: "J. Bruce Fields" <bfields@fieldses.org>
Date: Sun, 23 Dec 2018 21:26:10 +0000
Subject: Re: [PATCH 01/20] nfsd: drop useless LIST_HEAD
Message-Id: <20181223212610.GB3183@fieldses.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545555435-24576-1-git-send-email-Julia.Lawall@lip6.fr>
 <1545555435-24576-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1545555435-24576-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org

Applied, thanks.--b.

On Sun, Dec 23, 2018 at 09:56:56AM +0100, Julia Lawall wrote:
> Drop LIST_HEAD where the variable it declares is never used.
> 
> This was introduced in c5c707f96fc9a ("nfsd: implement pNFS
> layout recalls"), but was not used even in that commit.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> identifier x;
> @@
> - LIST_HEAD(x);
>   ... when != x
> // </smpl>
> 
> Fixes: c5c707f96fc9a ("nfsd: implement pNFS layout recalls")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> Successfully 0-day tested on 151 configurations.
> 
>  fs/nfsd/nfs4layouts.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/fs/nfsd/nfs4layouts.c b/fs/nfsd/nfs4layouts.c
> index 2b36aa037ce0..44517fb5c0de 100644
> --- a/fs/nfsd/nfs4layouts.c
> +++ b/fs/nfsd/nfs4layouts.c
> @@ -656,7 +656,6 @@ nfsd4_cb_layout_done(struct nfsd4_callback *cb, struct rpc_task *task)
>  	struct nfsd_net *nn;
>  	ktime_t now, cutoff;
>  	const struct nfsd4_layout_ops *ops;
> -	LIST_HEAD(reaplist);
>  
>  
>  	switch (task->tk_status) {
