From: Avri Altman <Avri.Altman@wdc.com>
Date: Sun, 15 Dec 2019 06:06:32 +0000
Subject: RE: [PATCH 2/2] scsi: ufs: Simplify a condition
Message-Id: <MN2PR04MB6991BEAE05458E3C4B079720FC560@MN2PR04MB6991.namprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191213104828.7i64cpoof26rc4fw@kili.mountain>
 <20191213104935.wgpq2epaz6zh5zus@kili.mountain>
In-Reply-To: <20191213104935.wgpq2epaz6zh5zus@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, Subhash Jadavani <subhashj@codeaurora.org>
Cc: Pedro Sousa <pedrom.sousa@synopsys.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>, Can Guo <cang@codeaurora.org>, Bart Van Assche <bvanassche@acm.org>, Venkat Gopalakrishnan <venkatg@codeaurora.org>, Tomas Winkler <tomas.winkler@intel.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

 
> 
> We know that "check_for_bkops" is non-zero on this side of the || because it
> was checked on the other side.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

> ---
>  drivers/scsi/ufs/ufshcd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c index
> bf981f0ea74c..c299c5feaf1a 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -7684,8 +7684,7 @@ static int ufshcd_link_state_transition(struct ufs_hba
> *hba,
>          * turning off the link would also turn off the device.
>          */
>         else if ((req_link_state == UIC_LINK_OFF_STATE) &&
> -                  (!check_for_bkops || (check_for_bkops &&
> -                   !hba->auto_bkops_enabled))) {
> +                (!check_for_bkops || !hba->auto_bkops_enabled)) {
>                 /*
>                  * Let's make sure that link is in low power mode, we are doing
>                  * this currently by putting the link in Hibern8. Otherway to
> --
> 2.11.0
