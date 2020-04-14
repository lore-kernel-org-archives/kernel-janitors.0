From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 14 Apr 2020 18:34:41 +0000
Subject: Re: [PATCH] RDMA/ocrdma: Fix an off-by-one issue in 'ocrdma_add_stat'
Message-Id: <20200414183441.GA28870@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200328073040.24429-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200328073040.24429-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: selvin.xavier@broadcom.com, devesh.sharma@broadcom.com, dledford@redhat.com, leon@kernel.org, colin.king@canonical.com, roland@purestorage.com, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Mar 28, 2020 at 08:30:40AM +0100, Christophe JAILLET wrote:
> There is an off-by-one issue when checking if there is enough space in the
> output buffer, because we must keep some place for a final '\0'.
> 
> While at it:
>    - Use 'scnprintf' instead of 'snprintf' in order to avoid a superfluous
>     'strlen'
>    - avoid some useless initializations
>    - avoida hard coded buffer size that can be computed at built time.
> 
> Fixes: a51f06e1679e ("RDMA/ocrdma: Query controller information")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> The '\0' comes from memset(..., 0, ...) in all callers.
> This could be also avoided if needed.
> ---
>  drivers/infiniband/hw/ocrdma/ocrdma_stats.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_stats.c b/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
> index 5f831e3bdbad..614a449e6b87 100644
> --- a/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
> +++ b/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
> @@ -49,13 +49,12 @@ static struct dentry *ocrdma_dbgfs_dir;
>  static int ocrdma_add_stat(char *start, char *pcur,
>  				char *name, u64 count)
>  {
> -	char buff[128] = {0};
> -	int cpy_len = 0;
> +	char buff[128];
> +	int cpy_len;
>  
> -	snprintf(buff, 128, "%s: %llu\n", name, count);
> -	cpy_len = strlen(buff);
> +	cpy_len = scnprintf(buff, sizeof(buff), "%s: %llu\n", name, count);
>  
> -	if (pcur + cpy_len > start + OCRDMA_MAX_DBGFS_MEM) {
> +	if (pcur + cpy_len >= start + OCRDMA_MAX_DBGFS_MEM) {
>  		pr_err("%s: No space in stats buff\n", __func__);
>  		return 0;
>  	}

The memcpy is still kind of silly right? What about this:

static int ocrdma_add_stat(char *start, char *pcur, char *name, u64 count)
{
	size_t len = (start + OCRDMA_MAX_DBGFS_MEM) - pcur;
	int cpy_len;

	cpy_len = snprintf(pcur, len, "%s: %llu\n", name, count);
	if (cpy_len >= len || cpy_len < 0) {
		pr_err("%s: No space in stats buff\n", __func__);
		return 0;
	}
	return cpy_len;
}

Jason
