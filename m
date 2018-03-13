From: "Kalderon, Michal" <Michal.Kalderon@cavium.com>
Date: Tue, 13 Mar 2018 09:40:18 +0000
Subject: RE: [PATCH net] qed: Use after free in qed_rdma_free()
Message-Id: <CY1PR0701MB20125766B31954BC4CBDCF3088D20@CY1PR0701MB2012.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180313090938.GA17609@mwanda>
In-Reply-To: <20180313090938.GA17609@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "Elior, Ariel" <Ariel.Elior@cavium.com>
Cc: Dept-Eng Everest Linux L2 <Dept-EngEverestLinuxL2@cavium.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Tuesday, March 13, 2018 11:10 AM
> To: Elior, Ariel <Ariel.Elior@cavium.com>; Kalderon, Michal
> <Michal.Kalderon@cavium.com>
> Cc: Dept-Eng Everest Linux L2 <Dept-EngEverestLinuxL2@cavium.com>;
> netdev@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH net] qed: Use after free in qed_rdma_free()
> 
> We're dereferencing "p_hwfn->p_rdma_info" but that is freed on the line
> before in qed_rdma_resc_free(p_hwfn).
> 
> Fixes: 9de506a547c0 ("qed: Free RoCE ILT Memory on rmmod qedr")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/ethernet/qlogic/qed/qed_rdma.c
> b/drivers/net/ethernet/qlogic/qed/qed_rdma.c
> index f3ee6538b553..a411f9c702a1 100644
> --- a/drivers/net/ethernet/qlogic/qed/qed_rdma.c
> +++ b/drivers/net/ethernet/qlogic/qed/qed_rdma.c
> @@ -379,8 +379,8 @@ static void qed_rdma_free(struct qed_hwfn
> *p_hwfn)
>  	DP_VERBOSE(p_hwfn, QED_MSG_RDMA, "Freeing RDMA\n");
> 
>  	qed_rdma_free_reserved_lkey(p_hwfn);
> -	qed_rdma_resc_free(p_hwfn);
>  	qed_cxt_free_proto_ilt(p_hwfn, p_hwfn->p_rdma_info->proto);
> +	qed_rdma_resc_free(p_hwfn);
>  }
> 
>  static void qed_rdma_get_guid(struct qed_hwfn *p_hwfn, u8 *guid)
Thanks,

Acked-by: Michal Kalderon <Michal.Kalderon@cavium.com>
