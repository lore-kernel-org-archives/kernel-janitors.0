From: "Darrick J. Wong" <darrick.wong@oracle.com>
Date: Wed, 30 May 2018 18:11:17 +0000
Subject: Re: [PATCH][next] aio: fix missing break in switch statement
Message-Id: <20180530181117.GA23842@magnolia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180530180415.17572-1-colin.king@canonical.com>
In-Reply-To: <20180530180415.17572-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Benjamin LaHaise <bcrl@kvack.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 30, 2018 at 07:04:15PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The addition of the IOCB_CMD_POLL command removed the break
> statement for the IOCM_CMD_FDSYNC. From my understanding, this
> should not have been removed as the fall-through does not seem
> to make sense.  Fix this by adding the break back again.
> 
> Detected by CoverityScan, CID#1469469 ("Missing break in switch")
> 
> Fixes: 2c14fa838cbe ("aio: implement IOCB_CMD_POLL")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Makes sense to me...
Reviewed-by: Darrick J. Wong <darrick.wong@oracle.com>

--D

> ---
>  fs/aio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/aio.c b/fs/aio.c
> index 8274d09d44a2..e0b2f183fa1c 100644
> --- a/fs/aio.c
> +++ b/fs/aio.c
> @@ -1785,6 +1785,7 @@ static int io_submit_one(struct kioctx *ctx, struct iocb __user *user_iocb,
>  		break;
>  	case IOCB_CMD_FDSYNC:
>  		ret = aio_fsync(&req->fsync, iocb, true);
> +		break;
>  	case IOCB_CMD_POLL:
>  		ret = aio_poll(req, iocb);
>  		break;
> -- 
> 2.17.0
> 
