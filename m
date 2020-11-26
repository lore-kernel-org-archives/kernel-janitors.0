From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Thu, 26 Nov 2020 14:01:49 +0000
Subject: Re: [PATCH][next] scsi: pm8001: remove space in a debug message
Message-Id: <CAMGffEnNkj4GkM-Er-MDuUQiFdZCBD-Bzb1_pGGXazfH=NkCtQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201124093828.307709-1-colin.king@canonical.com>
In-Reply-To: <20201124093828.307709-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 24, 2020 at 10:38 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are two words that need separating with a space in a
> pm8001_dbg message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
Thanks
> ---
>  drivers/scsi/pm8001/pm8001_hwi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/pm8001/pm8001_hwi.c b/drivers/scsi/pm8001/pm8001_hwi.c
> index 08d6cc9b50db..c8d4d87c5473 100644
> --- a/drivers/scsi/pm8001/pm8001_hwi.c
> +++ b/drivers/scsi/pm8001/pm8001_hwi.c
> @@ -1031,7 +1031,7 @@ pm8001_chip_soft_rst(struct pm8001_hba_info *pm8001_ha)
>         regVal = pm8001_cr32(pm8001_ha, 2, GSM_WRITE_DATA_PARITY_CHECK);
>         pm8001_cw32(pm8001_ha, 2, GSM_WRITE_DATA_PARITY_CHECK, regVal3);
>         pm8001_dbg(pm8001_ha, INIT,
> -                  "GSM 0x700048 - Write Data Parity Check Enableis set to = 0x%x\n",
> +                  "GSM 0x700048 - Write Data Parity Check Enable is set to = 0x%x\n",
>                    pm8001_cr32(pm8001_ha, 2, GSM_WRITE_DATA_PARITY_CHECK));
>
>         /* step 13: bring the IOP and AAP1 out of reset */
> --
> 2.29.2
>
