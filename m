From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Mar 2017 09:08:16 +0000
Subject: Re: [PATCH] scsi: cxgb3i: remove redundant null check and kfree on skb
Message-Id: <20170314090816.GH4136@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170313191408.20080-1-colin.king@canonical.com>
In-Reply-To: <20170313191408.20080-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Karen Xie <kxie@chelsio.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 13, 2017 at 07:14:08PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> On the error exit path, skb is always null, so the non-null check
> and __kfree_skb call are redundant.  Remove the redundant code,
> rename the rel_release label to err and make error paths jump to
> the err exit path.
> 
> Detected by CoverityScan, CID#114328 ("Logically Dead Code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/scsi/cxgbi/cxgb3i/cxgb3i.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c b/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
> index 1880eb6..f453a78 100644
> --- a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
> +++ b/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
> @@ -972,21 +972,21 @@ static int init_act_open(struct cxgbi_sock *csk)
>  			      &csk->daddr.sin_addr.s_addr);
>  	if (!csk->l2t) {
>  		pr_err("NO l2t available.\n");
> -		return -EINVAL;
> +		goto err;

err is a bad name because it doesn't say what the goto does.  Imagine
if function names were so opaque.  The most readable thing is a direct
return.

Also that's the least bug prone thing.

regards,
dan carpenter

