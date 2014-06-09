From: Sony Chacko <sony.chacko@qlogic.com>
Date: Mon, 09 Jun 2014 19:01:13 +0000
Subject: RE: [patch] qlcnic: remove duplicate QLC_83XX_GET_LSO_CAPABILITY define
Message-Id: <0EA5B226BC5C7B45A71BF612AA8A019E01288C8977@AVMB1.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140609145539.GB9600@mwanda>
In-Reply-To: <20140609145539.GB9600@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Shahed Shaikh <shahed.shaikh@qlogic.com>
Cc: Dept-HSG Linux NIC Dev <Dept-HSGLinuxNICDev@qlogic.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, netdev <netdev@vger.kernel.org>

> -----Original Message-----
> From: dept_hsg_linux_nic_dev-bounces@qlclistserver.qlogic.com
> [mailto:dept_hsg_linux_nic_dev-bounces@qlclistserver.qlogic.com] On
> Behalf Of Dan Carpenter
> Sent: Monday, June 09, 2014 7:56 AM
> To: Shahed Shaikh
> Cc: Dept-HSG Linux NIC Dev; kernel-janitors@vger.kernel.org; netdev
> Subject: [patch] qlcnic: remove duplicate QLC_83XX_GET_LSO_CAPABILITY
> define
> 
> The QLC_83XX_GET_LSO_CAPABILITY define is cut and pasted twice so we
> can delete the second instance.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h
> b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h
> index 97784d0..2bf101a 100644
> --- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h
> +++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_83xx_hw.h
> @@ -418,7 +418,6 @@ enum qlcnic_83xx_states {
>  #define QLC_83XX_GET_FUNC_MODE_FROM_NPAR_INFO(val)	(val &
> 0x80000000)
>  #define QLC_83XX_GET_LRO_CAPABILITY(val)		(val & 0x20)
>  #define QLC_83XX_GET_LSO_CAPABILITY(val)		(val & 0x40)
> -#define QLC_83XX_GET_LSO_CAPABILITY(val)		(val & 0x40)
>  #define QLC_83XX_GET_HW_LRO_CAPABILITY(val)		(val & 0x400)

Acked-by: Sony Chacko <sony.chacko@qlogic.com>

Thanks,
Sony
