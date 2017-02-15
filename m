From: Bart Van Assche <Bart.VanAssche@sandisk.com>
Date: Wed, 15 Feb 2017 18:03:09 +0000
Subject: Re: [PATCH] scsi, block: fix memory leak of sdpk on when gd fails to allocate
Message-Id: <1487181776.2666.7.camel@sandisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170203193854.6782-1-colin.king@canonical.com>
In-Reply-To: <20170203193854.6782-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>, "colin.king@canonical.com" <colin.king@canonical.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "axboe@fb.com" <axboe@fb.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, 2017-02-03 at 19:38 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> On an allocation failure of gd, the current exit path is via out_free_devt
> which leaves sdpk still allocated and hence it gets leaked. Fix this by
> correcting the order of resource free'ing with a change in the error exit
> path labels.
> 
> Detected by CoverityScan, CID#1399519 ("Resource Leak")
> 
> Fixes: 0dba1314d4f81115dc ("scsi, block: fix duplicate bdi name registration crashes")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/scsi/sd.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> index cb6e68d..99e1206 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -3213,10 +3213,10 @@ static int sd_probe(struct device *dev)
>  	sd_devt = NULL;
>   out_put:
>  	put_disk(gd);
> - out_free:
> -	kfree(sdkp);
>   out_free_devt:
>  	kfree(sd_devt);
> + out_free:
> +	kfree(sdkp);
>   out:
>  	scsi_autopm_put_device(sdp);
>  	return error;

Hello Colin,

This patch looks fine to me. But since it is a fix for a patch that exists
in Jens' tree and that is not yet upstream, please resubmit it to Jens.

Bart.