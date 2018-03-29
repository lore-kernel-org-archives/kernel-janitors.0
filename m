From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 29 Mar 2018 12:05:34 +0000
Subject: NAK: [PATCH] qed: fix spelling mistake: "checksumed" -> "checksummed"
Message-Id: <f3346ea5-acd5-99e2-1f02-bbb1f5b700aa@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180329115947.26920-1-colin.king@canonical.com>
In-Reply-To: <20180329115947.26920-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 29/03/18 12:59, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in DP_INFO message text
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/qlogic/qed/qed_ll2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/qlogic/qed/qed_ll2.c b/drivers/net/ethernet/qlogic/qed/qed_ll2.c
> index c4f14fdc4e77..0c50ed1955c4 100644
> --- a/drivers/net/ethernet/qlogic/qed/qed_ll2.c
> +++ b/drivers/net/ethernet/qlogic/qed/qed_ll2.c
> @@ -2383,7 +2383,7 @@ static int qed_ll2_start_xmit(struct qed_dev *cdev, struct sk_buff *skb)
>  	u8 flags = 0;
>  
>  	if (unlikely(skb->ip_summed != CHECKSUM_NONE)) {
> -		DP_INFO(cdev, "Cannot transmit a checksumed packet\n");
> +		DP_INFO(cdev, "Cannot transmit a checksummed packet\n");
>  		return -EINVAL;
>  	}
>  
> 
Found some more issues, I'll send an updated fix in a while
