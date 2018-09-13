From: Jinpu Wang <jinpu.wang@profitbricks.com>
Date: Thu, 13 Sep 2018 07:54:50 +0000
Subject: Re: [PATCH -next] scsi: pm80xx: Remove set but not used variable 'device_id'
Message-Id: <CAMGffE=k-XWT=hZnH+vSSm3eA_M=w6x8GVUZBVp-a4sjNRz2BQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536803664-42497-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536803664-42497-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Thu, Sep 13, 2018 at 3:44 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/pm8001/pm8001_sas.c: In function 'pm8001_I_T_nexus_event_handler':
> drivers/scsi/pm8001/pm8001_sas.c:1052:6: warning:
>  variable 'device_id' set but not used [-Wunused-but-set-variable]
>
> drivers/scsi/pm8001/pm8001_sas.c: In function 'pm8001_abort_task':
> drivers/scsi/pm8001/pm8001_sas.c:1191:6: warning:
>  variable 'device_id' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Jack Wang <jinpu.wang@profitbricks.com>
Thanks!
> ---
>  drivers/scsi/pm8001/pm8001_sas.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/scsi/pm8001/pm8001_sas.c b/drivers/scsi/pm8001/pm8001_sas.c
> index b1e7d26..84092e4 100644
> --- a/drivers/scsi/pm8001/pm8001_sas.c
> +++ b/drivers/scsi/pm8001/pm8001_sas.c
> @@ -1049,13 +1049,11 @@ int pm8001_I_T_nexus_event_handler(struct domain_device *dev)
>         struct pm8001_device *pm8001_dev;
>         struct pm8001_hba_info *pm8001_ha;
>         struct sas_phy *phy;
> -       u32 device_id = 0;
>
>         if (!dev || !dev->lldd_dev)
>                 return -1;
>
>         pm8001_dev = dev->lldd_dev;
> -       device_id = pm8001_dev->device_id;
>         pm8001_ha = pm8001_find_ha_by_dev(dev);
>
>         PM8001_EH_DBG(pm8001_ha,
> @@ -1188,7 +1186,6 @@ int pm8001_abort_task(struct sas_task *task)
>  {
>         unsigned long flags;
>         u32 tag;
> -       u32 device_id;
>         struct domain_device *dev ;
>         struct pm8001_hba_info *pm8001_ha;
>         struct scsi_lun lun;
> @@ -1202,7 +1199,6 @@ int pm8001_abort_task(struct sas_task *task)
>         dev = task->dev;
>         pm8001_dev = dev->lldd_dev;
>         pm8001_ha = pm8001_find_ha_by_dev(dev);
> -       device_id = pm8001_dev->device_id;
>         phy_id = pm8001_dev->attached_phy;
>         rc = pm8001_find_tag(task, &tag);
>         if (rc == 0) {
>


-- 
Jack Wang
Linux Kernel Developer

ProfitBricks GmbH
Greifswalder Str. 207
D - 10405 Berlin

Tel:       +49 30 577 008  042
Fax:      +49 30 577 008 299
Email:    jinpu.wang@profitbricks.com
URL:      https://www.profitbricks.de

Sitz der Gesellschaft: Berlin
Registergericht: Amtsgericht Charlottenburg, HRB 125506 B
Geschäftsführer: Achim Weiss, Matthias Steinberg, Christoph Steffens
