From: Alim Akhtar <alim.akhtar@gmail.com>
Date: Wed, 17 Jun 2020 08:59:40 +0000
Subject: Re: [PATCH][next] scsi: ufs: ufs-exynos: fix spelling mistake "pa_granularty" -> "pa_granularity"
Message-Id: <CAGOxZ52KM-DpPPv5qpKZCRoXzEH=YJvcHsNs=3t6rcrB8yX56Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200617084911.167359-1-colin.king@canonical.com>
In-Reply-To: <20200617084911.167359-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Avri Altman <avri.altman@wdc.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, Seungwon Jeon <essuuj@gmail.com>

On Wed, Jun 17, 2020 at 2:19 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a dev_warn message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
Thanks Colin,
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  drivers/scsi/ufs/ufs-exynos.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/scsi/ufs/ufs-exynos.c b/drivers/scsi/ufs/ufs-exynos.c
> index 440f2af83d9c..0a9e99084f2a 100644
> --- a/drivers/scsi/ufs/ufs-exynos.c
> +++ b/drivers/scsi/ufs/ufs-exynos.c
> @@ -883,7 +883,7 @@ static int exynos_ufs_post_link(struct ufs_hba *hba)
>                 if (attr->pa_granularity < 1 || attr->pa_granularity > 6) {
>                         /* Valid range for granularity: 1 ~ 6 */
>                         dev_warn(hba->dev,
> -                               "%s: pa_granularty %d is invalid, assuming backwards compatibility\n",
> +                               "%s: pa_granularity %d is invalid, assuming backwards compatibility\n",
>                                 __func__,
>                                 attr->pa_granularity);
>                         attr->pa_granularity = 6;
> --
> 2.27.0.rc0
>


-- 
Regards,
Alim
