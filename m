From: Jason Wang <jasowang@redhat.com>
Date: Fri, 13 Jan 2017 03:12:08 +0000
Subject: Re: [patch] vhost/scsi: silence uninitialized variable warning
Message-Id: <a25058f8-80c7-1174-29fe-b80adb64b0bf@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170112184504.GA12088@mwanda>
In-Reply-To: <20170112184504.GA12088@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org



On 2017年01月13日 02:45, Dan Carpenter wrote:
> This is to silence an uninitialized variable warning in debug output.
> The problem is this line:
>
> 	pr_debug("vhost_get_vq_desc: head: %d, out: %u in: %u\n",
> 		 head, out, in);
>
> If "head = vq->num" is true on the first iteration then "out" and "in"
> aren't initialized.  We handle that a few lines after the printk.  I was
> tempted to just delete the pr_debug() but I decided to just initialize
> them to zero instead.
>
> Also checkpatch.pl complains if variables are declared as just
> "unsigned" without the "int".
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> index 253310c..b98dac1 100644
> --- a/drivers/vhost/scsi.c
> +++ b/drivers/vhost/scsi.c
> @@ -843,7 +843,7 @@ vhost_scsi_handle_vq(struct vhost_scsi *vs, struct vhost_virtqueue *vq)
>   	struct iov_iter out_iter, in_iter, prot_iter, data_iter;
>   	u64 tag;
>   	u32 exp_data_len, data_direction;
> -	unsigned out, in;
> +	unsigned int out = 0, in = 0;
>   	int head, ret, prot_bytes;
>   	size_t req_size, rsp_size = sizeof(struct virtio_scsi_cmd_resp);
>   	size_t out_size, in_size;

Acked-by: Jason Wang <jasowang@redhat.com>
