From: Douglas Gilbert <dgilbert@interlog.com>
Date: Fri, 08 Mar 2013 17:57:12 +0000
Subject: Re: [patch] [SCSI] scsi_transport_sas: check for allocation failure
Message-Id: <513A2678.5000803@interlog.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130308120215.GB18712@longonot.mountain>
In-Reply-To: <20130308120215.GB18712@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 13-03-08 07:02 AM, Dan Carpenter wrote:
> Static checkers complain that this allocation isn't checked.  We
> should return zero if the allocation fails.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/scsi/scsi_transport_sas.c b/drivers/scsi/scsi_transport_sas.c
> index 1b68142..a022997 100644
> --- a/drivers/scsi/scsi_transport_sas.c
> +++ b/drivers/scsi/scsi_transport_sas.c
> @@ -379,9 +379,12 @@ sas_tlr_supported(struct scsi_device *sdev)
>   {
>   	const int vpd_len = 32;
>   	struct sas_end_device *rdev = sas_sdev_to_rdev(sdev);
> -	char *buffer = kzalloc(vpd_len, GFP_KERNEL);
> +	char *buffer;
>   	int ret = 0;
>
> +	buffer = kzalloc(vpd_len, GFP_KERNEL);
> +	if (!buffer)
> +		goto out;
>   	if (scsi_get_vpd_page(sdev, 0x90, buffer, vpd_len))
>   		goto out;
>

For 32 bytes, why not use the stack?

unsigned int
sas_tlr_supported(struct scsi_device *sdev)
{
         unsigned char buffer[32];
         struct sas_end_device *rdev = sas_sdev_to_rdev(sdev);
         int ret = 0;

         if (scsi_get_vpd_page(sdev, 0x90, buffer, sizeof(buffer)))
                 goto out;

         /*
          * The VPD Protocol Specific Logical Unit page (0x90) for SAS
          * has a 4 byte header and then one descriptor per device port.
          * The TLR bit is at offset 8 on each port descriptor.
          * We take the TLR value in the first descriptor.
          */
         ret = buffer[4 + 8] & 0x01;

  out:
         rdev->tlr_supported = ret;
         return ret;
}


Note the comment is changed.

Doug Gilbert


