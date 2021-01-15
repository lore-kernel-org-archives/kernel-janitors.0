From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 15 Jan 2021 10:33:35 +0000
Subject: Re: [PATCH][next] scsi: pm80xx: clean up indentation of a code block
Message-Id: <CAMGffEnkfgwSQKSwr_91a8wakhEvGy3fU5m_DM9O5mpp3foNSA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210115095824.9170-1-colin.king@canonical.com>
In-Reply-To: <20210115095824.9170-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>

On Fri, Jan 15, 2021 at 10:58 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> A block of code is indented one level too deeply, clean this
> up.
>
> Addresses-Coverity: ("Indentation does not match nesting level")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
>  drivers/scsi/pm8001/pm80xx_hwi.c | 34 ++++++++++++++------------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
> index e7fef42b4f6c..6fd206abc9fc 100644
> --- a/drivers/scsi/pm8001/pm80xx_hwi.c
> +++ b/drivers/scsi/pm8001/pm80xx_hwi.c
> @@ -358,26 +358,22 @@ ssize_t pm80xx_get_fatal_dump(struct device *cdev,
>                                         MEMBASE_II_SHIFT_REGISTER,
>                                         pm8001_ha->fatal_forensic_shift_offset);
>                 }
> -                       /* Read the next block of the debug data.*/
> -                       length_to_read = pm8001_mr32(fatal_table_address,
> -                       MPI_FATAL_EDUMP_TABLE_ACCUM_LEN) -
> -                       pm8001_ha->forensic_preserved_accumulated_transfer;
> -                       if (length_to_read != 0x0) {
> -                               pm8001_ha->forensic_fatal_step = 0;
> -                               goto moreData;
> -                       } else {
> -                               pm8001_ha->forensic_info.data_buf.direct_data +> -                               sprintf(
> -                               pm8001_ha->forensic_info.data_buf.direct_data,
> +               /* Read the next block of the debug data.*/
> +               length_to_read = pm8001_mr32(fatal_table_address,
> +               MPI_FATAL_EDUMP_TABLE_ACCUM_LEN) -
> +               pm8001_ha->forensic_preserved_accumulated_transfer;
> +               if (length_to_read != 0x0) {
> +                       pm8001_ha->forensic_fatal_step = 0;
> +                       goto moreData;
> +               } else {
> +                       pm8001_ha->forensic_info.data_buf.direct_data +> +                       sprintf(pm8001_ha->forensic_info.data_buf.direct_data,
>                                 "%08x ", 4);
> -                               pm8001_ha->forensic_info.data_buf.read_len
> -                                                               = 0xFFFFFFFF;
> -                               pm8001_ha->forensic_info.data_buf.direct_len
> -                                                               =  0;
> -                               pm8001_ha->forensic_info.data_buf.direct_offset
> -                                                               = 0;
> -                               pm8001_ha->forensic_info.data_buf.read_len = 0;
> -                       }
> +                       pm8001_ha->forensic_info.data_buf.read_len = 0xFFFFFFFF;
> +                       pm8001_ha->forensic_info.data_buf.direct_len =  0;
> +                       pm8001_ha->forensic_info.data_buf.direct_offset = 0;
> +                       pm8001_ha->forensic_info.data_buf.read_len = 0;
> +               }
>         }
>         offset = (int)((char *)pm8001_ha->forensic_info.data_buf.direct_data
>                         - (char *)buf);
> --
> 2.29.2
>
