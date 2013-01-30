From: Boaz Harrosh <bharrosh@panasas.com>
Date: Wed, 30 Jan 2013 15:56:13 +0000
Subject: Re: [patch] [SCSI] libosd: check for kzalloc() failure
Message-Id: <5109429D.1080802@panasas.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130130070602.GB12396@elgon.mountain>
In-Reply-To: <20130130070602.GB12396@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "James E.J. Bottomley" <JBottomley@parallels.com>
Cc: Benny Halevy <bhalevy@tonian.com>, osd-dev@open-osd.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/30/2013 09:06 AM, Dan Carpenter wrote:
> There wasn't any error handling for this kzalloc().
> 

ACK-by: Boaz Harrosh <bharrosh@panasas.com>

James please queue for inclusion

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan

> 
> diff --git a/drivers/scsi/osd/osd_initiator.c b/drivers/scsi/osd/osd_initiator.c
> index c06b8e5..d8293f2 100644
> --- a/drivers/scsi/osd/osd_initiator.c
> +++ b/drivers/scsi/osd/osd_initiator.c
> @@ -144,6 +144,10 @@ static int _osd_get_print_system_info(struct osd_dev *od,
>  	odi->osdname_len = get_attrs[a].len;
>  	/* Avoid NULL for memcmp optimization 0-length is good enough */
>  	odi->osdname = kzalloc(odi->osdname_len + 1, GFP_KERNEL);
> +	if (!odi->osdname) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
>  	if (odi->osdname_len)
>  		memcpy(odi->osdname, get_attrs[a].val_ptr, odi->osdname_len);
>  	OSD_INFO("OSD_NAME               [%s]\n", odi->osdname);
> 

