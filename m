From: Bart Van Assche <bvanassche@acm.org>
Date: Thu, 11 Feb 2021 15:57:38 +0000
Subject: Re: [PATCH v2] scsi: qla2xxx: Removed extra space in variable declaration.
Message-Id: <ccf393f7-cbfc-fb8c-6f73-bb502eaa54f3@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210211131628.GA10754@machine1>
In-Reply-To: <20210211131628.GA10754@machine1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Milan P. Gandhi" <mgandhi@redhat.com>, kernel-janitors@vger.kernel.org
Cc: GR-QLogic-Storage-Upstream@marvell.com, linux-scsi@vger.kernel.org, njavali@marvell.com, jejb@linux.ibm.com, martin.petersen@oracle.com

On 2/11/21 5:16 AM, Milan P. Gandhi wrote:
> Removed extra space in variable declaration in qla2x00_sysfs_write_nvram
> 
> Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>
> ---
> changes v2:
>  - Added a small note about change.
> ---
> diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
> index ab45ac1e5a72..7f2db8badb6d 100644
> --- a/drivers/scsi/qla2xxx/qla_attr.c
> +++ b/drivers/scsi/qla2xxx/qla_attr.c
> @@ -226,7 +226,7 @@ qla2x00_sysfs_write_nvram(struct file *filp, struct kobject *kobj,
>  	struct scsi_qla_host *vha = shost_priv(dev_to_shost(container_of(kobj,
>  	    struct device, kobj)));
>  	struct qla_hw_data *ha = vha->hw;
> -	uint16_t	cnt;
> +	uint16_t cnt;
>  
>  	if (!capable(CAP_SYS_ADMIN) || off != 0 || count != ha->nvram_size ||
>  	    !ha->isp_ops->write_nvram)

I'm not sure if such a patch is considered substantial enough to be
included upstream.

For future patches, please follow the guidelines for submitting patches
and use the imperative mood for the subject (Removed -> Remove) and do
not end the patch subject with a dot. See also
Documentation/process/submitting-patches.rst

Bart.
