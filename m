From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Sat, 06 Aug 2011 14:46:52 +0000
Subject: Re: [patch] xen-blkback: add missing return on error in
Message-Id: <20110806144652.GB29514@dumpdata.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110805141821.GK7659@shale.localdomain>
In-Reply-To: <20110805141821.GK7659@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, joe.jin@oracle.com
Cc: Laszlo Ersek <lersek@redhat.com>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Aug 05, 2011 at 05:18:21PM +0300, Dan Carpenter wrote:
> We should return here after reporting the error.  Otherwise we'd hit
> a NULL deref of blkif->xenblkd on the next line.

Whao, yeah, I dropped that whole patchset. Will introduce it back
in when I get a better patchset from Joe.

Joe,
Can you add this fix in your patchqueue please?

> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/block/xen-blkback/xenbus.c b/drivers/block/xen-blkback/xenbus.c
> index 32d4c3c..b750299 100644
> --- a/drivers/block/xen-blkback/xenbus.c
> +++ b/drivers/block/xen-blkback/xenbus.c
> @@ -107,6 +107,7 @@ static void xen_update_blkif_status(struct xen_blkif *blkif)
>  		err = PTR_ERR(blkif->xenblkd);
>  		blkif->xenblkd = NULL;
>  		xenbus_dev_error(blkif->be->dev, err, "start xenblkd");
> +		return;
>  	}
>  
>  	blkif->be->kthread_pid = blkif->xenblkd->pid;
