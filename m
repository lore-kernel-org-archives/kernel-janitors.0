From: Laszlo Ersek <lersek@redhat.com>
Date: Fri, 05 Aug 2011 15:05:54 +0000
Subject: Re: [patch] xen-blkback: add missing return on error in xen_update_blkif_status()
Message-Id: <4E3C06D2.2020309@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110805141821.GK7659@shale.localdomain>
In-Reply-To: <20110805141821.GK7659@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Joe Jin <joe.jin@oracle.com>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 08/05/11 16:18, Dan Carpenter wrote:
> We should return here after reporting the error.  Otherwise we'd hit
> a NULL deref of blkif->xenblkd on the next line.
>
> Signed-off-by: Dan Carpenter<error27@gmail.com>
>
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index 32d4c3c..b750299 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -107,6 +107,7 @@ static void xen_update_blkif_status(struct xen_blkif *blkif)
>   		err = PTR_ERR(blkif->xenblkd);
>   		blkif->xenblkd = NULL;
>   		xenbus_dev_error(blkif->be->dev, err, "start xenblkd");
> +		return;
>   	}
>
>   	blkif->be->kthread_pid = blkif->xenblkd->pid;

In case somebody were asking for my opinion:

I think this block was the last block in the originally containing 
function (update_blkif_status()?), thus the "return" wasn't needed 
there. I guess the block got copied and then other code was added below it.

Acked-by: Laszlo Ersek <lersek@redhat.com>
