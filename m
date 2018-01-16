From: Cathy Avery <cavery@redhat.com>
Date: Tue, 16 Jan 2018 14:36:24 +0000
Subject: Re: [PATCH] scsi: storvsc: missing error code in storvsc_probe()
Message-Id: <5A5E0DE8.7080603@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180116104022.GA3517@mwanda>
In-Reply-To: <20180116104022.GA3517@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "K. Y. Srinivasan" <kys@microsoft.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>, kernel-janitors@vger.kernel.org, devel@linuxdriverproject.org, Stephen Hemminger <sthemmin@microsoft.com>

On 01/16/2018 05:40 AM, Dan Carpenter wrote:
> We should set the error code if fc_remote_port_add() fails.
>
> Fixes: daf0cd445a21 ("scsi: storvsc: Add support for FC rport.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
> index 3b3d1d050cac..40fc7a590e81 100644
> --- a/drivers/scsi/storvsc_drv.c
> +++ b/drivers/scsi/storvsc_drv.c
> @@ -1834,8 +1834,10 @@ static int storvsc_probe(struct hv_device *device,
>   		fc_host_node_name(host) = stor_device->node_name;
>   		fc_host_port_name(host) = stor_device->port_name;
>   		stor_device->rport = fc_remote_port_add(host, 0, &ids);
> -		if (!stor_device->rport)
> +		if (!stor_device->rport) {
> +			ret = -ENOMEM;
>   			goto err_out4;
> +		}
>   	}
>   #endif
>   	return 0;

Reviewed-by: Cathy Avery <cavery@redhat.com>
