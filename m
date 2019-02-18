From: Sudarsana Reddy Kalluru <skalluru@marvell.com>
Date: Mon, 18 Feb 2019 14:40:20 +0000
Subject: RE: [PATCH net-next] bnx2x: Remove set but not used variable 'mfw_vn'
Message-Id: <CY4PR18MB1253E984E16BAAEE9C72B682D3630@CY4PR18MB1253.namprd18.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218121954.78928-1-yuehaibing@huawei.com>
In-Reply-To: <20190218121954.78928-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Ariel Elior <aelior@marvell.com>, "David S . Miller" <davem@davemloft.net>
Cc: GR-everest-linux-l2 <GR-everest-linux-l2@marvell.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

>-----Original Message-----
>From: YueHaibing [mailto:yuehaibing@huawei.com]
>Sent: 18 February 2019 17:50
>To: Ariel Elior <aelior@marvell.com>; Sudarsana Reddy Kalluru
><skalluru@marvell.com>; David S . Miller <davem@davemloft.net>
>Cc: YueHaibing <yuehaibing@huawei.com>; GR-everest-linux-l2 <GR-everest-
>linux-l2@marvell.com>; netdev@vger.kernel.org; kernel-
>janitors@vger.kernel.org
>Subject: [PATCH net-next] bnx2x: Remove set but not used variable 'mfw_vn'
>
>Fixes gcc '-Wunused-but-set-variable' warning:
>
>drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c: In function
>'bnx2x_get_hwinfo':
>drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c:11940:10: warning:
> variable 'mfw_vn' set but not used [-Wunused-but-set-variable]
>
>It's never used since introduction.
>
>Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>---
> drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
>b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
>index 3b5b47e98c73..7c47be215a34 100644
>--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
>+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
>@@ -11998,7 +11998,7 @@ static void validate_set_si_mode(struct bnx2x
>*bp)  static int bnx2x_get_hwinfo(struct bnx2x *bp)  {
> 	int /*abs*/func = BP_ABS_FUNC(bp);
>-	int vn, mfw_vn;
>+	int vn;
> 	u32 val = 0, val2 = 0;
> 	int rc = 0;
>
>@@ -12083,12 +12083,10 @@ static int bnx2x_get_hwinfo(struct bnx2x *bp)
> 	/*
> 	 * Initialize MF configuration
> 	 */
>-
> 	bp->mf_ov = 0;
> 	bp->mf_mode = 0;
> 	bp->mf_sub_mode = 0;
> 	vn = BP_VN(bp);
>-	mfw_vn = BP_FW_MB_IDX(bp);
>
> 	if (!CHIP_IS_E1(bp) && !BP_NOMCP(bp)) {
> 		BNX2X_DEV_INFO("shmem2base 0x%x, size %d, mfcfg offset
>%d\n",
>
>

Acked-by: Sudarsana Reddy Kalluru <skalluru@marvell.com>
