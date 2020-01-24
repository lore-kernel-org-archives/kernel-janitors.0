From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 24 Jan 2020 19:24:28 +0000
Subject: Re: [PATCH] scsi: pm80xx: fix spelling mistake "to" -> "too"
Message-Id: <CAMGffEmhGxasQ=-S4akOLnDvVBpY1e42R=pvaFqKTH0R+TM-6w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200123005706.2834281-1-colin.king@canonical.com>
In-Reply-To: <20200123005706.2834281-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jan 23, 2020 at 1:57 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a pm8001_printk message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>

Thanks Colin.
> ---
>  drivers/scsi/pm8001/pm80xx_hwi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
> index 98dcdbd146d5..d1d95f1a2c6a 100644
> --- a/drivers/scsi/pm8001/pm80xx_hwi.c
> +++ b/drivers/scsi/pm8001/pm80xx_hwi.c
> @@ -2377,7 +2377,7 @@ mpi_sata_completion(struct pm8001_hba_info *pm8001_ha, void *piomb)
>                                 ts->buf_valid_size = sizeof(*resp);
>                         } else
>                                 PM8001_IO_DBG(pm8001_ha,
> -                                       pm8001_printk("response to large\n"));
> +                                       pm8001_printk("response too large\n"));
>                 }
>                 if (pm8001_dev)
>                         pm8001_dev->running_req--;
> --
> 2.24.0
>
