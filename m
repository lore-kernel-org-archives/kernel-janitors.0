From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Fri, 06 Feb 2015 18:48:16 +0000
Subject: Re: [patch] vhost/scsi: potential memory corruption
Message-Id: <1423248496.9544.0.camel@haakon3.risingtidesystems.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150205073733.GA27855@mwanda>
In-Reply-To: <20150205073733.GA27855@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, linux-scsi@vger.kernel.org, kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>

On Thu, 2015-02-05 at 10:37 +0300, Dan Carpenter wrote:
> This code in vhost_scsi_make_tpg() is confusing because we limit "tpgt"
> to UINT_MAX but the data type of "tpg->tport_tpgt" and that is a u16.
> 
> I looked at the context and it turns out that in
> vhost_scsi_set_endpoint(), "tpg->tport_tpgt" is used as an offset into
> the vs_tpg[] array which has VHOST_SCSI_MAX_TARGET (256) elements so
> anything higher than 255 then it is invalid.  I have made that the limit
> now.
> 
> In vhost_scsi_send_evt() we mask away values higher than 255, but now
> that the limit has changed, we don't need the mask.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Compile tested only.
> 
> diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> index 3e265ef..4339222 100644
> --- a/drivers/vhost/scsi.c
> +++ b/drivers/vhost/scsi.c
> @@ -1278,7 +1278,7 @@ vhost_scsi_send_evt(struct vhost_scsi *vs,
>  		 * lun[4-7] need to be zero according to virtio-scsi spec.
>  		 */
>  		evt->event.lun[0] = 0x01;
> -		evt->event.lun[1] = tpg->tport_tpgt & 0xFF;
> +		evt->event.lun[1] = tpg->tport_tpgt;
>  		if (lun->unpacked_lun >= 256)
>  			evt->event.lun[2] = lun->unpacked_lun >> 8 | 0x40 ;
>  		evt->event.lun[3] = lun->unpacked_lun & 0xFF;
> @@ -2149,12 +2149,12 @@ vhost_scsi_make_tpg(struct se_wwn *wwn,
>  			struct vhost_scsi_tport, tport_wwn);
>  
>  	struct vhost_scsi_tpg *tpg;
> -	unsigned long tpgt;
> +	u16 tpgt;
>  	int ret;
>  
>  	if (strstr(name, "tpgt_") != name)
>  		return ERR_PTR(-EINVAL);
> -	if (kstrtoul(name + 5, 10, &tpgt) || tpgt > UINT_MAX)
> +	if (kstrtou16(name + 5, 10, &tpgt) || tpgt >= VHOST_SCSI_MAX_TARGET)
>  		return ERR_PTR(-EINVAL);
>  
>  	tpg = kzalloc(sizeof(struct vhost_scsi_tpg), GFP_KERNEL);

Nice catch Dan.  Applied to target-pending/for-next.

--nab



