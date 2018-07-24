From: Jason Gunthorpe <jgg@ziepe.ca>
Date: Tue, 24 Jul 2018 20:57:29 +0000
Subject: Re: [PATCH -next] IB/ipoib: Fix error return code in ipoib_dev_init()
Message-Id: <20180724205729.GA18421@ziepe.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1531314942-178931-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1531314942-178931-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 11, 2018 at 01:15:42PM +0000, Wei Yongjun wrote:
> Fix to return a negative error code from the ipoib_neigh_hash_init()
> error handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 515ed4f3aab4 ("IB/IPoIB: Separate control and data related initializations")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Yuval Shaia <yuval.shaia@oracle.com>
> ---
>  drivers/infiniband/ulp/ipoib/ipoib_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to for-next, thanks

> diff --git a/drivers/infiniband/ulp/ipoib/ipoib_main.c b/drivers/infiniband/ulp/ipoib/ipoib_main.c
> index 9bcd487..d11adfa 100644
> --- a/drivers/infiniband/ulp/ipoib/ipoib_main.c
> +++ b/drivers/infiniband/ulp/ipoib/ipoib_main.c
> @@ -1791,7 +1791,8 @@ int ipoib_dev_init(struct net_device *dev, struct ib_device *ca, int port)
>  		goto out_free_pd;
>  	}
>  
> -	if (ipoib_neigh_hash_init(priv) < 0) {
> +	ret = ipoib_neigh_hash_init(priv);
> +	if (ret < 0) {

However I changed this to the cannonical 'if (ret)' format.

Jason
