From: Alex Elder <elder@dreamhost.com>
Date: Wed, 06 Jun 2012 13:55:12 +0000
Subject: Re: [patch] rbd: endian bug in rbd_req_cb()
Message-Id: <4FCF6140.10604@dreamhost.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120504173954.GA18827@elgon.mountain>
In-Reply-To: <20120504173954.GA18827@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yehuda Sadeh <yehuda@hq.newdream.net>, Sage Weil <sage@newdream.net>, ceph-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 05/04/2012 12:39 PM, Dan Carpenter wrote:
> Sparse complains about this because:
> drivers/block/rbd.c:996:20: warning: cast to restricted __le32
> drivers/block/rbd.c:996:20: warning: cast from restricted __le16
> 
> These are set in osd_req_encode_op() and they are le16.

I had made a note to myself to fix this as well--and have a whole
series of patches in my queue related to improving consistency with
sizes and signedness.

Thank you for sending this, it looks good and I'm about to commit it.

Reviewed-by: Alex Elder <elder@inktank.com>

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index c1f7701..64d3d6f 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -993,7 +993,7 @@ static void rbd_req_cb(struct ceph_osd_request *req, struct ceph_msg *msg)
>  	op = (void *)(replyhead + 1);
>  	rc = le32_to_cpu(replyhead->result);
>  	bytes = le64_to_cpu(op->extent.length);
> -	read_op = (le32_to_cpu(op->op) = CEPH_OSD_OP_READ);
> +	read_op = (le16_to_cpu(op->op) = CEPH_OSD_OP_READ);
>  
>  	dout("rbd_req_cb bytes=%lld readop=%d rc=%d\n", bytes, read_op, rc);
>  
> --
> To unsubscribe from this list: send the line "unsubscribe ceph-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

