From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 20 Oct 2018 08:42:17 +0000
Subject: Re: [PATCH 3/3] scsi: myrs: prevent negatives in disable_enclosure_messages_store()
Message-Id: <20181020084203.pime6kadzboxrds7@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181019091909.a22ah7wybj6agqch@kili.mountain>
In-Reply-To: <20181019091909.a22ah7wybj6agqch@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 19, 2018 at 12:19:09PM +0300, Dan Carpenter wrote:
> We only want the value to be zero or one.
> 
> It's not a big deal, but say we passed set value to INT_MIN, then
> disable_enclosure_messages_show() would return that 12 bytes of "buf"
> are initialized but actually only 3 are.  I think there are tools like
> KASAN which will trigger an info leak warning when that happens.
> 
> Fixes: 77266186397c ("scsi: myrs: Add Mylex RAID controller (SCSI interface)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/scsi/myrs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/myrs.c b/drivers/scsi/myrs.c
> index 07e5a3f54e31..55842ed54231 100644
> --- a/drivers/scsi/myrs.c
> +++ b/drivers/scsi/myrs.c
> @@ -1501,7 +1501,7 @@ static ssize_t disable_enclosure_messages_store(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> -	if (value > 2)
> +	if (value < 0 || value > 2)
>  		return -EINVAL;

It's not actually clear to me why we allow 2.  Shouldn't we just use
kstrtobool()?

regards,
dan carpenter
