From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Mar 2020 07:30:43 +0000
Subject: Re: [PATCH] NFS: check for allocation failure from mempool_alloc
Message-Id: <20200302073043.GA4140@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200226234320.7722-1-colin.king@canonical.com>
In-Reply-To: <20200226234320.7722-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Trond Myklebust <trond.myklebust@hammerspace.com>, Anna Schumaker <anna.schumaker@netapp.com>, linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 26, 2020 at 11:43:20PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> It is possible for mempool_alloc to return null when using
> the GFP_KERNEL flag, so return NULL and avoid a null pointer
> dereference on the following memset of the null pointer.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: 2b17d725f9be ("NFS: Clean up writeback code")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/nfs/write.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/nfs/write.c b/fs/nfs/write.c
> index c478b772cc49..7ca036660dd1 100644
> --- a/fs/nfs/write.c
> +++ b/fs/nfs/write.c
> @@ -106,6 +106,9 @@ static struct nfs_pgio_header *nfs_writehdr_alloc(void)
>  {
>  	struct nfs_pgio_header *p = mempool_alloc(nfs_wdata_mempool, GFP_KERNEL);
>  
> +	if (!p)

The fixes tag was wrong.  When I searched for the correct fixes tag,
it turned out this was intentional.  See commit 237f8306c302
("NFS: don't expect errors from mempool_alloc().") and commit 518662e0fcb9
("NFS: fix usage of mempools.").

    When passed GFP flags that allow sleeping (such as
    GFP_NOIO), mempool_alloc() will never return NULL, it will
    wait until memory is available.

regards,
dan carpenter
