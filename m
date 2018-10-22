From: John Garry <john.garry@huawei.com>
Date: Mon, 22 Oct 2018 08:58:49 +0000
Subject: Re: [PATCH -next] mvsas: Remove set but not used variable 'id'
Message-Id: <84d5d93e-fc86-b933-a9b7-59325b1691fc@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540115454-160677-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1540115454-160677-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 21/10/2018 10:50, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/scsi/mvsas/mv_sas.c: In function 'mvs_work_queue':
> drivers/scsi/mvsas/mv_sas.c:1909:31: warning:
>  variable 'id' set but not used [-Wunused-but-set-variable]
>
> It never used since introduction in commit
> 20b09c2992fe ("[SCSI] mvsas: add support for 94xx; layout change; bug fixes")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: John Garry <john.garry@huawei.com>

> ---
>  drivers/scsi/mvsas/mv_sas.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/scsi/mvsas/mv_sas.c b/drivers/scsi/mvsas/mv_sas.c
> index 3df1428..ab50798 100644
> --- a/drivers/scsi/mvsas/mv_sas.c
> +++ b/drivers/scsi/mvsas/mv_sas.c
> @@ -1906,8 +1906,6 @@ static void mvs_work_queue(struct work_struct *work)
>
>  		if (phy->phy_event & PHY_PLUG_OUT) {
>  			u32 tmp;
> -			struct sas_identify_frame *id;
> -			id = (struct sas_identify_frame *)phy->frame_rcvd;

It would have been worth leaving a newline to avoid a possible 
checkpatch warning.

>  			tmp = MVS_CHIP_DISP->read_phy_ctl(mvi, phy_no);
>  			phy->phy_event &= ~PHY_PLUG_OUT;
>  			if (!(tmp & PHY_READY_MASK)) {
>
>
> .
>
