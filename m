From: Manish Rangankar <mrangankar@marvell.com>
Date: Tue, 02 Apr 2019 06:55:12 +0000
Subject: RE: [PATCH -next] scsi: qedf: Remove set but not used variable 'fr_len'
Message-Id: <BYAPR18MB248514CEDDAF476C3B787B37D8560@BYAPR18MB2485.namprd18.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539951177-184754-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539951177-184754-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> -----Original Message-----
> From: linux-scsi-owner@vger.kernel.org <linux-scsi-owner@vger.kernel.org>
> On Behalf Of YueHaibing
> Sent: Saturday, March 30, 2019 7:18 AM
> To: James E . J . Bottomley <jejb@linux.ibm.com>; Martin K. Petersen
> <martin.petersen@oracle.com>
> Cc: YueHaibing <yuehaibing@huawei.com>; QLogic-Storage-
> Upstream@cavium.com; linux-scsi@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH -next] scsi: qedf: Remove set but not used variable 'fr_len'
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/scsi/qedf/qedf_fip.c: In function 'qedf_fcoe_send_vlan_req':
> drivers/scsi/qedf/qedf_fip.c:22:6: warning:
>  variable 'fr_len' set but not used [-Wunused-but-set-variable]
> 
> It's never used since introduction and can be removed.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/scsi/qedf/qedf_fip.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/scsi/qedf/qedf_fip.c b/drivers/scsi/qedf/qedf_fip.c index
> 766da74fa546..49d0724535e3 100644
> --- a/drivers/scsi/qedf/qedf_fip.c
> +++ b/drivers/scsi/qedf/qedf_fip.c
> @@ -19,7 +19,6 @@ void qedf_fcoe_send_vlan_req(struct qedf_ctx *qedf)
> {
>  	struct sk_buff *skb;
>  	char *eth_fr;
> -	int fr_len;
>  	struct fip_vlan *vlan;
>  #define MY_FIP_ALL_FCF_MACS        ((__u8[6]) { 1, 0x10, 0x18, 1, 0, 2 })
>  	static u8 my_fcoe_all_fcfs[ETH_ALEN] = MY_FIP_ALL_FCF_MACS;
> @@ -29,7 +28,6 @@ void qedf_fcoe_send_vlan_req(struct qedf_ctx *qedf)
>  	if (!skb)
>  		return;
> 
> -	fr_len = sizeof(*vlan);
>  	eth_fr = (char *)skb->data;
>  	vlan = (struct fip_vlan *)eth_fr;
> 
> 

Thanks,
Acked-by: Manish Rangankar <mrangankar@marvell.com>
