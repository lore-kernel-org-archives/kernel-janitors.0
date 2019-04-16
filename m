From: Mukesh Ojha <mojha@codeaurora.org>
Date: Tue, 16 Apr 2019 13:32:23 +0000
Subject: Re: [PATCH] qed: fix spelling mistake "faspath" -> "fastpath"
Message-Id: <ec71bfe9-1843-25b0-b639-cf7bd68e2dce@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190416114317.28983-1-colin.king@canonical.com>
In-Reply-To: <20190416114317.28983-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 4/16/2019 5:13 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a DP_INFO message, fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

Cheers,
-Mukesh
> ---
>   drivers/net/ethernet/qlogic/qed/qed_sriov.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/qlogic/qed/qed_sriov.c b/drivers/net/ethernet/qlogic/qed/qed_sriov.c
> index 9faaa6df78ed..2f318aaf2b05 100644
> --- a/drivers/net/ethernet/qlogic/qed/qed_sriov.c
> +++ b/drivers/net/ethernet/qlogic/qed/qed_sriov.c
> @@ -1591,7 +1591,7 @@ static void qed_iov_vf_mbx_acquire(struct qed_hwfn *p_hwfn,
>   			p_vfdev->eth_fp_hsi_minor = ETH_HSI_VER_NO_PKT_LEN_TUNN;
>   		} else {
>   			DP_INFO(p_hwfn,
> -				"VF[%d] needs fastpath HSI %02x.%02x, which is incompatible with loaded FW's faspath HSI %02x.%02x\n",
> +				"VF[%d] needs fastpath HSI %02x.%02x, which is incompatible with loaded FW's fastpath HSI %02x.%02x\n",
>   				vf->abs_vf_id,
>   				req->vfdev_info.eth_fp_hsi_major,
>   				req->vfdev_info.eth_fp_hsi_minor,
