From: Dave Kleikamp <dave.kleikamp@oracle.com>
Date: Tue, 06 Sep 2016 17:24:26 +0000
Subject: Re: [PATCH] jfs: Simplify code
Message-Id: <7e6c449d-1b6e-b574-9849-07266c52ab83@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472880929-29449-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1472880929-29449-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, shaggy@kernel.org
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/03/2016 12:35 AM, Christophe JAILLET wrote:
> Calling 'list_splice' followed by 'INIT_LIST_HEAD' is equivalent to
> 'list_splice_init'.

Looks good. I'll push this upstream.

> 
> This has been spotted with the following coccinelle script:
> /////
> @@
> expression y,z;
> @@
> 
> -   list_splice(y,z);
> -   INIT_LIST_HEAD(y);
> +   list_splice_init(y,z);
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>

> ---
>  fs/jfs/jfs_txnmgr.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/jfs/jfs_txnmgr.c b/fs/jfs/jfs_txnmgr.c
> index 2e58978d6f45..4d973524c887 100644
> --- a/fs/jfs/jfs_txnmgr.c
> +++ b/fs/jfs/jfs_txnmgr.c
> @@ -2893,8 +2893,7 @@ restart:
>  	 * on anon_list2.  Let's check.
>  	 */
>  	if (!list_empty(&TxAnchor.anon_list2)) {
> -		list_splice(&TxAnchor.anon_list2, &TxAnchor.anon_list);
> -		INIT_LIST_HEAD(&TxAnchor.anon_list2);
> +		list_splice_init(&TxAnchor.anon_list2, &TxAnchor.anon_list);
>  		goto restart;
>  	}
>  	TXN_UNLOCK();
> 
