From: Jinpu Wang <jinpu.wang@profitbricks.com>
Date: Fri, 14 Sep 2018 07:58:14 +0000
Subject: Re: [PATCH -next] scsi: pm80xx: Remove set but not used variable 'page_code'
Message-Id: <CAMGffEnQt0tfFGORVPX+-o7X3FiL0GydM+fGaQ5VdiP6x=rZxQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536803664-42497-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536803664-42497-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 14, 2018 at 3:29 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/pm8001/pm80xx_hwi.c: In function 'pm8001_set_phy_profile':
> drivers/scsi/pm8001/pm80xx_hwi.c:4679:6: warning:
>  variable 'page_code' set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Acked-by: Jack Wang <jinpu.wang@profitbricks.com>
Thanks!
> ---
>  drivers/scsi/pm8001/pm80xx_hwi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
> index b641875..9864a3c 100644
> --- a/drivers/scsi/pm8001/pm80xx_hwi.c
> +++ b/drivers/scsi/pm8001/pm80xx_hwi.c
> @@ -4676,9 +4676,8 @@ void mpi_set_phy_profile_req(struct pm8001_hba_info *pm8001_ha,
>  void pm8001_set_phy_profile(struct pm8001_hba_info *pm8001_ha,
>         u32 length, u8 *buf)
>  {
> -       u32 page_code, i;
> +       u32 i;
>
> -       page_code = SAS_PHY_ANALOG_SETTINGS_PAGE;
>         for (i = 0; i < pm8001_ha->chip->n_phy; i++) {
>                 mpi_set_phy_profile_req(pm8001_ha,
>                         SAS_PHY_ANALOG_SETTINGS_PAGE, i, length, (u32 *)buf);
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
